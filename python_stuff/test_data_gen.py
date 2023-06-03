import numpy as np
from conversion import conv
from ordata import *
# 'accel_data', 'disp_data', 'time_stamp', 'vel_data'

# angular stuff
theta = 0
omega = 2

def n():
    return np.random.normal(0, 10, 1)[0]

for i in range(3,1003):
    t = time_stamp[i]
    X = disp_data[i]
    V = vel_data[i]
    A = accel_data[i]
    #x_rot = conv(X, V, theta + t*omega)
    a_rot = conv(A, V, theta + t*omega)

    sensor_reads = f'{theta+t*omega+n()},{omega+n()},{X[0]+n()},{X[1]+n()},{X[2]+n()},{a_rot[0]+n()},{a_rot[1]+n()},{a_rot[2]+n()}'
    true_values = f'{X[0]},{X[1]},{X[2]},{V[0]},{V[1]},{V[2]},{A[0]},{A[1]},{A[2]}'
    print(f'{t},{sensor_reads},{true_values}')
