import time

class GPS:
    points = [[0, 0, 0]]  # x, y, time
    angles = [[0, 0]]  # angle, time
    len_points = 5
    def __init__():
        self.t0 = time.time()
        threading.Thread(target=update_data_thread, args=[]).start()
        
    def update_data_thread():
        while(self.should_continue):
            # TODO wait for packet from uins with data
            x = 0  # set to value from packet
            y = 0  # set to value from packet
            angle = 0  # set to value from packet
            t = time.time() - self.t0
            points.append([x, y, t])
            angles.append([angle, t])
    
    def add_point(point):
        points.append(point)
        if len(points) > len_points:
            points.pop(0)
    
    def get_position():
        return points[-1]
    
    def get_velocity():
        p1 = points[-2]  # TODO ensure len(points) >= 2
        p2 = points[-1]
        x1, y1, t1 = p1
        x2, y2, t2 = p2
        x_vel = (x2 - x1) / (t2 - t1)
        y_vel = (y2 - y1) / (t2 - t1)
        speed = (x_vel**2 + y_vel**2)**0.5
        return x_vel, y_vel, speed
    
    def get_angle():
        return 0  # TODO get angle from magnetometer and/or gyroscopes on uins