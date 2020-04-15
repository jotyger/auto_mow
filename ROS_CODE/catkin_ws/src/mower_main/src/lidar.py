"""
lidar.py
"""

import math

from rplidar_driver import RPLidar

def _process_scan(points, mower):
    points = sorted(points)  # points may be slightly out of order; sort them.
    for point in points:
        angle = point[0] - 15  # [degrees] Correction for lidar mount/lidar itself not being perfectly straight. TODO calibrate
        if 140 < angle < 220:  # Search an area in front that is 80 degrees wide.
            theta = math.radians((angle + 180) % 360)  # [radians] Rotate coordinate system so that 0 radian mark is forward (lidar is mounted backward)
            r = point[1]  # [m]
            x = r * math.cos(theta)  # [m] x-axis goes forward for lawnmower
            y = -r * math.sin(theta)  # [m] y-axis goes left for lawnmower
            if 0 < x < 99 and -5 < y < 5:  # Obstacle is within a 99m x 10m box in front of the mower
                if mower.engine_state == True:
                    print("Lidar detected obstacle at x,y = {:.3f},{:.3f}".format(x, y))
                mower.kill_engine()
                return


def monitor(mower):  
    callback = lambda points: _process_scan(points, mower)
    lidar_sensor = RPLidar('/dev/ttyUSB0', baudrate=115200, timeout=1, process_scan=callback)
    lidar_sensor.connect()  # Connect to COM port
    lidar_sensor.stop_scan()  # Send command to stop scan if one is in progress.
    
    #lidar_sensor.get_device_info()  # Model, firmware, hardware, serial
    #lidar_sensor.get_device_health()  # Status, error code
    #lidar_sensor.get_sample_rate()  # Standard & express data rate (express is used)
    
    lidar_sensor.start_express_scan()  # Send command to start express scan, and start calling process functions.