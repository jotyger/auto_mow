import math
import threading

min_bound = 90
max_bound = 270
def process_32_points(points):
    thetas = [x[0] for x in points]
    if min_bound < min(thetas) < max_bound or min_bound < max(thetas) < max_bound:
        for point in points:
            if point[1] < 10

try:
                     #Port,          #Baud   #Timeout   
    sensor = RPLidar('/dev/ttyUSB0', 115200, 1, process_32_points=process_32_points)
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
