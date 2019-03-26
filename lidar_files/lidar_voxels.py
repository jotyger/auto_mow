import math
import threading

from rplidar_driver import RPLidar
import PIL.Image as Image

scan_count = 0
voxels = []
def process_scan(points):
    global scan_count, voxels
    scan_count += 1
    phi, rover_theta, rover_x, rover_y, rover_z = get_rover_position()
    for point in points:
        voxel = point_to_voxel(point, phi, rover_theta, rover_x, rover_y, rover_z)
        if voxel not in voxels:
            voxels.append(voxel)
    if scan_count >= 100:
        threading.Thread(target=voxels_to_png, args=[voxels]).start()
        exit()
    
def get_rover_position():
    mount_tilt = 0  # degrees; mount tilt from horizontal; + is front down, - is front up
    rover_tilt = 0  # degrees; rover tilt from hotizontal; + is front down, - is front up
    phi = 90 + mount_tilt + rover_tilt
    rover_theta = 0  # degrees; 0=east, 90=north, 180=west, 270=south
    rover_x = 0
    rover_y = 0
    rover_z = 0
    return phi, rover_theta, rover_x, rover_y, rover_z

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
    print(x_min, x_max, y_min, y_max)
    print("width", width, "height", height)
    data = [(0, 0, 0)] * width * height
    for voxel in voxels:
        i = int((y_max - voxel[1]) / res * width + (voxel[0] - x_min) / res)
        data[i] = (0, 255, 0)
    i0 = int((y_max * width - x_min) / res)
    data[i0] = (255, 0, 0)
    image.putdata(data)
    scale = 5
    image = image.resize((width * scale, height * scale), Image.NEAREST)
    image.save("lidar_scan.png")

res = 0.05
def point_to_voxel(point, phi, rover_theta, rover_x, rover_y, rover_z):
    phi = math.radians(phi)
    
    lidar_theta = math.radians(-point[0])
    rover_theta = math.radians(rover_theta)
    theta = lidar_theta + rover_theta
    
    r = point[1]
    x = rover_x + r * math.sin(phi) * math.cos(theta)
    y = rover_y + r * math.sin(phi) * math.sin(theta)
    z = rover_z + r * math.cos(phi)
    x_v = round(x / res) * res
    y_v = round(y / res) * res
    z_v = round(z / res) * res
    return x_v, y_v, z_v

try:
                     #Port,          #Baud   #Timeout   
    sensor = RPLidar('/dev/ttyUSB0', 115200, 1, process_scan=process_scan)
    sensor.connect()
    sensor.stop_scan()
    
    sensor.get_device_info()
    sensor.get_device_health()
    sensor.get_sample_rate()
    
    sensor.start_express_scan()

except KeyboardInterrupt:
    print("Keyboard Interrupt")
finally:
    sensor.stop_scan()
    sensor.disconnect()