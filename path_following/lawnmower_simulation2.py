from PIL import Image
import csv
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
    return mpp * ((p1[0] - p2[0])**2 + (p1[1] - p2[1])**2)**0.5

#order path points
ordered_points = [start_point]
while len(points) > 0:
    if len(points) % 100 == 0:
        print(len(points))
    location = ordered_points[-1]
    nearest_point = [999999, 999999]
    distance = 9999999
    for point in points:
        point_distance = get_distance(point, location)
        if point_distance < distance:
            nearest_point = point
            distance = point_distance
    ordered_points.append(nearest_point)
    points.remove(nearest_point)

for i in range(len(ordered_points)):
    ordered_points[i] = [ordered_points[i][0] * mpp, ordered_points[i][1] * mpp]

with open("path.csv", 'w', newline='') as file:
    writer = csv.writer(file, delimiter=",")
    for i in range(len(ordered_points)):
        writer.writerow([i, ordered_points[i][0], -ordered_points[i][1]])
    file.close()
exit()

image2 = Image.new("L", image.size)
image2.putdata(list_of_pixels)
image2.save("path2.png")