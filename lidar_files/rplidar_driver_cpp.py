#!/usr/bin/env python3
'''Animates distances and measurment quality'''
import subprocess
import threading
import time
import math

import PIL.Image as Image
print("Opening process")
process = subprocess.Popen(("/home/pi/rplidar_sdk/sdk/output/Linux/Release/test"), stdout=subprocess.PIPE, close_fds=True, bufsize=-1)
print("Opened process")
scan_start_angle = 45 # degrees

def process_measurement(measurement):
    angle = measurement[0]  # degrees
    distance = measurement[1]  # m

scan = [[1, 0]]
is_full_scan = False
def process_batch(measurements):
    global scan, is_full_scan
    for measurement in measurements:
        angle = measurement[0]
        distance = measurement[1]
        prev_angle = scan[-1][0]
        a = (prev_angle <= scan_start_angle < angle)
        b = (prev_angle - 360 <= scan_start_angle < angle) and angle < prev_angle and abs(prev_angle - 360) < 5 #TODO
        if a or b:
            if a: print("a")
            if b: print("b")
            process_scan(scan)
            is_full_scan = True
            scan = []
        scan += [[angle, distance]]

def voxels_to_png(voxels):
    print("creating image")
    x_min = 0
    x_max = 0
    y_min = 0
    y_max = 0
    for voxel in voxels:
        x_min = min(x_min, voxel[0])
        x_max = max(x_max, voxel[0])
        y_min = min(y_min, voxel[1])
        y_max = max(y_max, voxel[1])
    width = int((x_max - x_min) / res + 1)
    height = int((y_max - y_min) / res + 1)
    image=Image.new("RGB",[width, height])
    data = [(0, 0, 0)] * width * height
    for voxel in voxels:
        i = int((y_max - voxel[1]) / res * width + (voxel[0] - x_min) / res)
        data[i] = (255, 255, 255)
    i0 = int((y_max * width - x_min) / res)
    data[i0] = (255, 0, 0)
    image.putdata(data)
    scale = 5
    image = image.resize((width * scale, height * scale), Image.NEAREST)
    image.save("lidar_scan.png")
    

def process_scan(measurements):
    voxels = []
    print(measurements)
    for measurement in measurements:
        voxel = measurement_to_voxel(measurement)
        if voxel not in voxels:
            voxels.append(voxel)
    if is_full_scan:
        threading.Thread(target=voxels_to_png, args=[voxels]).start()
        exit()

res = 0.01
def measurement_to_voxel(measurement):
    theta = math.radians(-measurement[0])
    r = measurement[1]
    x = r * math.cos(theta)
    y = r * math.sin(theta)
    x_v = round(x / res) * res
    y_v = round(y / res) * res
    return x_v, y_v

def timeout_thread():
    time.sleep(5)
    if not started:
        print("Timeout")
        process.kill()

started = False
threading.Thread(target=timeout_thread, args=[]).start()
try:
    t1 = time.time()
    n = 0
    t = 0
    for line in process.stdout:
        started = True
        line = line.decode().strip().rstrip(";")  # remove the end junk
        if not line.startswith("$"): continue  # skip if not a list of readings
        batch = line.lstrip("$").split(";")  # create list of strings
        batch = [[float(point.split(",")[0]), float(point.split(",")[1]) / 1000] for point in batch]
        
        for measurement in batch:
            process_measurement(measurement)
        
        process_batch(batch)
        t += 1 / ((time.time() - t1) / (batch[-1][0] - batch[0][0]) * 360)
        n += 1
        print(t / n)
        t1 = time.time()
        
        continue
    
##        angles, distances = zip(*points)
##        print(angles[0], angles[-1], distances[0], distances[-1])
##        desired_angle = 0
##        index = 0
##        min_dif = 999
##        for i, angle in enumerate(angles):
##            dif = min(abs(angle - desired_angle), abs(angle - 360 - desired_angle))
##            if dif < min_dif:
##                index = i
##                min_dif = dif
##        if min_dif < 2:
##            if 0 < distances[index] < 300:
##                print(distances[index])
##                GPIO.output(24, True)
##            else:
##                GPIO.output(24, False)
            
    process.stdout.close()
except KeyboardInterrupt:
    process.kill()