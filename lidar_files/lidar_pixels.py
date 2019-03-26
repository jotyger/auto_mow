import math
import threading

from rplidar_driver import RPLidar
import PIL.Image as Image

is_full_scan = False
def process_scan(points):
    global is_full_scan
    pixels = []
    for point in points:
        pixel = point_to_pixel(point)
        if pixel not in pixels:
            pixels.append(pixel)
    if is_full_scan:
        threading.Thread(target=pixels_to_png, args=[pixels]).start()
        exit()
    is_full_scan = True

def pixels_to_png(pixels):
    print("creating image")
    x_min = 0
    x_max = 0
    y_min = 0
    y_max = 0
    for pixel in pixels:
        x_min = min(x_min, pixel[0])
        x_max = max(x_max, pixel[0])
        y_min = min(y_min, pixel[1])
        y_max = max(y_max, pixel[1])
    width = int((x_max - x_min) / res + 1)
    height = int((y_max - y_min) / res + 1)
    image=Image.new("RGB",[width, height])
    print(x_min, x_max, y_min, y_max)
    print("width", width, "height", height)
    data = [(0, 0, 0)] * width * height
    for pixel in pixels:
        i = int((y_max - pixel[1]) / res * width + (pixel[0] - x_min) / res)
        data[i] = (0, 255, 0)
    i0 = int((y_max * width - x_min) / res)
    data[i0] = (255, 0, 0)
    image.putdata(data)
    scale = 5
    image = image.resize((width * scale, height * scale), Image.NEAREST)
    image.save("lidar_scan.png")

res = 0.025
def point_to_pixel(point):
    theta = math.radians(-point[0])
    r = point[1]
    x = r * math.cos(theta)
    y = r * math.sin(theta)
    x_v = round(x / res) * res
    y_v = round(y / res) * res
    return x_v, y_v

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
