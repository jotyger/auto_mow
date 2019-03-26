import numpy as np
import matplotlib.pyplot as plt
import scipy.interpolate
import csv
import math
import threading

def expand(path_gps):
    X0 = [x[0] for x in path_gps]
    Y0 = [x[1] for x in path_gps]
    Z0 = [x[2] for x in path_gps]
    X1 = [[X0[0]]]
    Y1 = [[Y0[0]]]
    for i in range(1, len(Z0)):
        X1[-1].append(X0[i])
        Y1[-1].append(Y0[i])
        if Z0[i] == 1:
            X1.append([X0[i]])
            Y1.append([Y0[i]])
    X1.pop(-1)
    Y1.pop(-1)
    
    X = []
    Y = []
    D = []
    R = []
    V = []
    A = []
    AV = []
    AA = []
    T = []
    T2 = []
    try:
        for i in range(len(X1)):
            print(X1[i])
            print(Y1[i])
            X2, Y2, D1 = interpolate(X1[i], Y1[i])
            path_details = get_path_details(X2, Y2, D1)
            
            X.extend(X2[:-1])
            Y.extend(Y2[:-1])
            D.extend(D1[:-1])
            R.extend(path_details[0][:-1])
            V.extend(path_details[1][:-1])
            A.extend(path_details[2][:-1])
            AV.extend(path_details[3][:-1])
            AA.extend(path_details[4][:-1])
            T.extend(path_details[5][:-1])
            T2.extend(path_details[6][:-1])
            #R, V, A, AV, AA, T, T2 = 
    except:
        pass
    
    T2 = [0] * len(T)
    for i in range(1, len(T)):
        T2[i] = T2[i - 1] + T[i]
    plt.figure(1)
    plt.plot(X, Y, '-')
    plt.plot(X0, Y0, '.')
    plt.title("XY")
    plt.figure(2)
    plt.plot(T2, V, '-')
    plt.title("Velocity")
    plt.ylim(0, 3)
    plt.figure(3)
    plt.plot(T2, A, '-')
    plt.title("Acceleration")
    plt.ylim(-0.4, 0.4)
    plt.figure(4)
    plt.plot(T2, AV, '-')
    plt.title("Angular Velocity")
    plt.figure(5)
    plt.plot(T2, AA, '-')
    plt.title("Angular Acceleration")
    plt.figure(6)
    plt.plot(T2, X, '-')
    plt.title("X")
    plt.figure(7)
    plt.plot(X0, Y0, '-')
    plt.plot(X0, Y0, '.')
    plt.title("XY")
    
    plt.show()
    if False:
        plt.plot(x_int(T1), y_int(T1), '-')
        plt.plot(x_int(T2), y_int(T2), 'o')
        plt.plot(X, Y, 'o')
        plt.show()
    return list(zip(X, Y, D, R, V, A, AV, AA, T, T2))

def interpolate(X, Y):
    

    #X = [0, 0, 1, 2, 3, 4, 3, 2, 2, 3]
    #Y = [1, 0, 3, 0, 3, 0, 2, 3, 2, 0]

    #X = [0, 1, 1, 0]
    #Y = [0, 0, 1, 1]
    T = list(range(0, len(X)))

    cubic = False
    if cubic:
        x_int = scipy.interpolate.interp1d(T, X, kind="cubic")
        y_int = scipy.interpolate.interp1d(T, Y, kind="cubic")
    else:
        x_int = scipy.interpolate.interp1d(T, X, kind="quadratic")
        y_int = scipy.interpolate.interp1d(T, Y, kind="quadratic")

    interp_res_t = 0.01
    interp_res_d = 0.25
    start = 0.1
    T1 = np.arange(start, max(T), interp_res_t)
    T2 = [0]
    D = [0]
    current_length = 0
    for i, t in enumerate(T1[1:]):
        new_length = ((x_int(T1[i]) - x_int(T1[i-1]))**2 + (y_int(T1[i]) - y_int(T1[i-1]))**2)**0.5
        if current_length + new_length > interp_res_d:
            T2.append(t)
            D.append(current_length + new_length)
            current_length = new_length
        else:
            current_length += new_length
    return x_int(T2), y_int(T2), D

def get_angle_3_points(p0, p1, p2): # get angle at p0 made by p1 and p2
    #https://stackoverflow.com/questions/1211212/how-to-calculate-an-angle-from-three-points
    angle_radians = math.atan2(p2[1] - p0[1], p2[0] - p0[0]) - math.atan2(p1[1] - p0[1], p1[0] - p0[0])
    angle_degrees = 180 / math.pi * angle_radians
    return angle_degrees
    
def get_path_details(X, Y, D):  # assume 0 at bounds
    max_cent_accel = 1
    V = [0]
    R = [9999]
    for i in range(1, len(X) - 1):
        x0, y0 = X[i - 1], Y[i - 1]
        x1, y1 = X[i    ], Y[i    ]
        x2, y2 = X[i + 1], Y[i + 1]
        p0 = x0 + y0 * 1j
        p1 = x1 + y1 * 1j
        p2 = x2 + y2 * 1j
        
        w = p2 - p0
        w /= p1 - p0
        if w.imag != 0:
            c = (p1-p0)*(w-abs(w)**2)/2j/w.imag-p0
        
            radius = abs(c+p1)
            angle = get_angle_3_points([x0, y0], [x1, y1], [x2, y2])
            if angle < 0:
                radius = -radius
        else:
            radius = 9999
        v = (abs(radius) * max_cent_accel) ** 0.5
        V.append(v)
        R.append(radius)
        
    V.append(0)
    R.append(99999)
    
    accel = 0.35
    v_max = 2.5
    for i in range(1, len(V)):
        v0 = V[i - 1]
        v_accel = (v0**2 + 2*accel*D[i])**0.5
        V[i] = min(V[i], v_accel, v_max)
    V[-1] = 0
    
    for i in range(0, len(V) - 1)[::-1]:
        v0 = V[i + 1]
        v_accel = (v0**2 + 2*accel*D[i + 1])**0.5
        V[i] = min(V[i], v_accel, v_max)
    
    T = [0]
    T2 = [0]
    for i in range(1, len(V)):
        if D[i] < 1:
            t = D[i] / ((V[i - 1] + V[i]) / 2)
        else:
            t = 0.1
        T.append(t)
        T2.append(T2[i - 1] + t)
    
    A = [0]
    for i in range(1, len(V)):
        a = (V[i] - V[i - 1]) / T[i]
        A.append(a)
    
    AV = [0]
    for i in range(1, len(V)):
        av = V[i] / R[i]
        AV.append(av)
        
    AA = [0]
    for i in range(1, len(V)):
        a = (AV[i] - AV[i - 1]) / T[i]
        AA.append(a)
    
    return R, V, A, AV, AA, T, T2