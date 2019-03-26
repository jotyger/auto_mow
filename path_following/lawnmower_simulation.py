from PIL import Image
image = Image.open("path.png")

grayscale = image.convert('L')
minima, maxima = grayscale.getextrema()


def get_distance(p1, p2):
    return ((p1[0] - p2[0])**2 + (p1[1] - p2[1])**2)**0.5

maximas = []
for x in range(image.size[0]):
   for y in range(image.size[1]):
       if grayscale.getpixel((x, y)) == maxima:
           maximas.append([x, y])

start = [101, 984]
location = start
path = [location]
maximas.remove(location)
while len(maximas) > 0:
    nearest_point = [999999, 999999]
    distance = 9999999
    for point in maximas:
        point_distance = get_distance(point, location)
        if point_distance < distance:
            nearest_point = point
            distance = point_distance
    location = nearest_point
    path.append(location)
    maximas.remove(location)

path2 = [start]
for i in range(len(path)):
    if get_distance(path[i], path2[-1]) > 5:
        path2.append(path[i-1])
print(path2)

list_of_pixels = []
for y in range(image.size[1]):
    for x in range(image.size[0]):
        if [x, y] in path2:
            list_of_pixels.append(255)
        else:
            list_of_pixels.append(0)

image2 = Image.new("L", image.size)
image2.putdata(list_of_pixels)
image2.save("path2.png")