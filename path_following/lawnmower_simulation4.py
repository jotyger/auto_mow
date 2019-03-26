from PIL import Image
import csv
import math

image = Image.open("path2.png")
data = image.convert("HSV")

coords = []
with open('path.csv', newline='') as file:
    reader = csv.reader(file, delimiter=",", quotechar='|')
    for row in reader:
        coords.append([float(row[1]), float(row[2])])
    file.close()

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

distance_limit = 0.147
filtered_coords = [coords.pop(0)]
print(filtered_coords[0])
while len(coords) > 1:
    bad = False
    location = filtered_coords[-1]
    for i in range(len(coords)):
        destination = coords[i]
        for j in range(0, i):
            if get_distance_point_line(coords[j], location, destination) > distance_limit:
                bad = True
                break
        if bad:
            break
    
    destination = coords[i-1]
    for j in range(i):
        coords.pop(0)
    filtered_coords.append(destination)
print(filtered_coords)

print("processing")
mpp = 0.147
for i in range(len(filtered_coords)):
    coord = filtered_coords[i]
    point = [int(round(coord[0]/mpp, 0)), -int(round(coord[1]/mpp))]
    color = (164, 255, 255)
    if 0 < i < len(filtered_coords) - 1:
        angle_degrees = get_angle_3_points(filtered_coords[i], filtered_coords[i-1], filtered_coords[i+1])
        if angle_degrees < 0:
            angle_degrees += 180
        else:
            angle_degrees -= 180
        print(angle_degrees)
        if -45 < angle_degrees < 45:
            color = (0, 255, 255)
    data.putpixel(point, color)
data.convert("RGB").save("path4.png")







