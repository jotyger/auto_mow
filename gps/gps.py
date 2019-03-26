import subprocess
import csv
import time
import math

t = time.time()
n = 0
with open("gps_output.csv", 'w', newline='') as file:
    writer = csv.writer(file, delimiter=",")
    writer.writerow(["time", "lat [deg]", "lon [deg]", "y [m]", "x [m]"])
    
    output= subprocess.Popen(("rtk.bat"), stdout=subprocess.PIPE).stdout

    for line in output:
        line = str(line)
        if "LLA" in line:
            line = line.split("LLA:   ")[1]
            line_data = line.replace(" ", "").split(",")
            timestamp = time.time() - t
            lat = float(line_data[0])
            lon = float(line_data[1])
            n += 1
            if n == 1:
                lat1 = lat
                lon1 = lon
            y = round((lat - lat1) * 111111, 3)
            x = round((lon - lon1) * 111111 * math.cos(lat * math.pi / 180), 3)
            print(timestamp, lat, lon, y, x)
            writer.writerow([timestamp, lat, lon, y, x])
            file.flush()

    output.close()