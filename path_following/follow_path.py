import math
import csv
from PIL import Image

import gps
import path

# x, y
gps_path = []
if True:
    image = Image.open("path2.png")
    data = image.convert('RGB')

    mpp = 0.147
    white = (255, 255, 255)
    red = (255, 0, 0)

    #find start point and path points
    start_point = False
    points = []
    for x in range(image.size[0]):
        for y in range(image.size[1]):
            if data.getpixel((x, y)) == white:
                points.append([x, y])
            if not start_point and data.getpixel((x, y)) == red:
                start_point = [x, y]

    def get_distance(p1, p2):
        return ((p1[0] - p2[0])**2 + (p1[1] - p2[1])**2)**0.5
    
    def get_distance_point_line(p0, p1, p2): # distance between p1 and line from p2 to p3
        #https://en.wikipedia.org/wiki/Distance_from_a_point_to_a_line
        return abs((p2[1] - p1[1])*p0[0] - (p2[0] - p1[0])*p0[1] + p2[0]*p1[1] - p2[1]*p1[0])/((p2[1] - p1[1])**2 + (p2[0] - p1[0])**2)**0.5
        
    def get_angle_3_points(p0, p1, p2): # get angle at p0 made by p1 and p2
        #https://stackoverflow.com/questions/1211212/how-to-calculate-an-angle-from-three-points
        angle_radians = math.atan2(p2[1] - p0[1], p2[0] - p0[0]) - math.atan2(p1[1] - p0[1], p1[0] - p0[0])
        angle_degrees = 180 / math.pi * angle_radians
        return angle_degrees

    #order path points
    gps_path = [start_point]
    while len(points) > 0:
        if len(points) % 100 == 0:
            print(len(points))
        location = gps_path[-1]
        nearest_point = [999999, 999999]
        distance = 9999999
        for point in points:
            point_distance = get_distance(point, location)
            if point_distance < distance:
                nearest_point = point
                distance = point_distance
        gps_path.append(nearest_point)
        points.remove(nearest_point)

    for i in range(len(gps_path)):
        gps_path[i] = [gps_path[i][0] * mpp, -gps_path[i][1] * mpp]
    
    distance_limit = 0.147
    filtered_gps_path = [gps_path.pop(0)]
    print(filtered_gps_path[0])
    while len(gps_path) > 1:
        bad = False
        location = filtered_gps_path[-1]
        for i in range(len(gps_path)):
            destination = gps_path[i]
            for j in range(0, i):
                if get_distance_point_line(gps_path[j], location, destination) > distance_limit:
                    bad = True
                    break
            if bad:
                break
        
        destination = gps_path[i-1]
        for j in range(i):
            gps_path.pop(0)
        filtered_gps_path.append(destination)
    gps_path = filtered_gps_path
    
    for i in range(len(gps_path)):
        coord = gps_path[i]
        point = [int(round(coord[0]/mpp, 0)), -int(round(coord[1]/mpp))]
        zero_turn = 1
        if 0 < i < len(gps_path) - 1:
            angle_degrees = get_angle_3_points(gps_path[i], gps_path[i-1], gps_path[i+1])
            if angle_degrees < 0:
                angle_degrees += 180
            else:
                angle_degrees -= 180
            print(angle_degrees)
            if -45 < angle_degrees < 45:
                zero_turn = 0
        gps_path[i] = gps_path[i] + [zero_turn]
    gps_path[0] = gps_path[0] + [1]
    gps_path[-1] = gps_path[-1] + [1]
else:
    with open('path.csv', newline='') as file:
        reader = csv.reader(file, delimiter=",", quotechar='|')
        for row in reader:
            gps_path.append([float(row[1]), float(row[2]), int(row[3])])
        file.close() 

target_path = path.expand(gps_path)
with open("path_detailed.csv", 'w', newline='') as file:
    writer = csv.writer(file, delimiter=",")
    writer.writerow(["Point", "X", "Y", "D", "R", "V", "A", "AV", "AA", "T", "T2"])
    for i in range(len(target_path)):
        writer.writerow([i] + list(target_path[i]))
    file.close()
exit()

#at_target=False
#controller.calibrate()

#current_x, current_y = gps.get_position()
#x_vel, y_vel, speed = gps.get_velocity()
#controller.angle = gps.get_angle()
#for target in targets:
#    target_x, target_y, target_speed, target_angle = target
#    
#    angle_toward_target = math.atan2(target_y - current_y, target_x - current_x)
#    
#    if controller.stopped == True:
#        controller.zero_turn_to_angle(angle_toward_target)
#    else:
        
    

#Controller:
#    def zero_turn_to_angle(self, target_angle)
#        angle_to_turn = target_angle - self.angle
#        if abs(angle_to_turn) > math.pi:
#            if angle_to_turn > 0:
#                angle_to_turn -= 2 * math.pi
#            elif angle_to_turn < 0:
#                angle_to_turn += 2 * math.pi
#        self.zero_turn_maneuver(angle_to_turn)

    