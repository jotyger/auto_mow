# called when each new point is retreived (32 times each packet)
def process_point(angle, distance):  # angle = degrees, distance = meters
    pass

# called after each packet retreival; contains 32 points
def process_32_points(points):  # [[angle, distance], ...] [angle = degrees, distance = meters]
    pass

# called after a packet crosses 0 degree mark. typically contains ~550 points, 0.6 degree resolution. # angles may not be in order due to way that angles are calculated. list may be sorted, but order of time may be lost.
def process_32_points(points):  # [[angle, distance], ...] [angle = degrees, distance = meters]
    pass
    
try:
                     #Port,          #Baud   #Timeout   
    sensor = RPLidar('/dev/ttyUSB0', 115200, 1, process_point=process_point, process_32_points=process_32_points, process_scan=process_scan)  # create lidar instance
    sensor.connect()  # connec to COM port
    sensor.stop_scan()  # send command to stop scan if one is in progress
    
    sensor.get_device_info()  # model, firmware, hardware, serial
    sensor.get_device_health()  # status, error code
    sensor.get_sample_rate()  # standard & express data rate (express is used)
    
    sensor.start_express_scan()  # send command to start express scan, and start calling process functions.

except KeyboardInterrupt:
    print("Keyboard Interrupt")
finally:
    sensor.stop_scan()
    sensor.disconnect()
