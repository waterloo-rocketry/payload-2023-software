import numpy as np
from conversion import conv
# 'accel_data', 'disp_data', 'time_stamp', 'vel_data'

import csv

time_stamp = []
acceleration = []
velocity = []
position = []

def map_float(lst):
    return [float(elem) for elem in lst]

with open('/home/kavin/Documents/git-repos/rocketry/payload-2023-software/python_stuff/ortest2.csv') as csvfile:
    spamreader = csv.reader(csvfile)
    for row in spamreader:
        if len(row) == 10:
            time_stamp.append(float(row[0]))
            acceleration.append(map_float(row[1:4]))
            velocity.append(map_float(row[4:7]))
            position.append(map_float(row[7:10]))

# angular stuff
theta = 0
omega = 2

def n(std = 100):
    return np.random.normal(0, std, 1)[0]

for i in range(3,1003):
    t = time_stamp[i]
    X = position[i]
    V = velocity[i]
    A = acceleration[i]
    #x_rot = conv(X, V, theta + t*omega)
    a_rot = conv(A, V[:], theta + t*omega)

    sensor_reads = f'{theta+t*omega+n(1)},{omega+n(1)},{X[0]+n()},{X[1]+n()},{X[2]+n()},{a_rot[0]+n()},{a_rot[1]+n()},{a_rot[2]+n()}'
    true_values = f'{X[0]},{X[1]},{X[2]},{V[0]},{V[1]},{V[2]},{A[0]},{A[1]},{A[2]}'
    print(f'{t},{sensor_reads},{true_values}')
