from PIL import Image
import csv

image = Image.open("path2.png")
data = image.convert("HSV")

coords = []
with open('path.csv', newline='') as file:
    reader = csv.reader(file, delimiter=",", quotechar='|')
    for row in reader:
        coords.append([float(row[1]), float(row[2])])
    file.close()

print("processing")
mpp = 0.147
points = []
colors = []
for i in range(len(coords)):
    coord = coords[i]
    point = [int(round(coord[0]/mpp, 0)), -int(round(coord[1]/mpp))]
    color = (int(i/20)%255, 255, 255)
    data.putpixel(point, color)
data.convert("RGB").save("path3.png")