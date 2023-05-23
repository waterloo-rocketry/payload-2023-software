import numpy as np
from conversion import conv

# angular stuff
theta = 0
omega = 2

## Position stuff
x = [0, 0, 0]
v = [0, 0, 0]
a = [5, 10, 20]

def n():
    return np.random.normal(0, 1, 1)[0]

for i in range(1000):
    t = 0.01 * (1 + i)

    X = [x[0] + t*v[0] + t*t*a[0]/2, x[1] + t*v[1] + t*t*a[1]/2, x[2] + t*v[2] + t*t*a[2]/2]
    V = [v[0] + t*a[0], v[1] + t*a[1], v[2] + t*a[2]]
    x_rot = conv(X, V, theta + t*omega)
    a_rot = conv(a, V, theta + t*omega)

    sensor_reads = f'{theta+t*omega+n()},{omega+n()},{x_rot[0]},{x_rot[1]},{x_rot[2]},{a_rot[0]},{a_rot[1]},{a_rot[2]}'
    true_values = f'{x[0] + t*v[0] + t*t*a[0]/2},{x[1] + t*v[1] + t*t*a[1]/2},{x[2] + t*v[2] + t*t*a[2]/2},{v[0] + t*a[0]},{v[1] + t*a[1]},{v[2] + t*a[2]},{a[0]},{a[1]},{a[2]}'
    print(f'{t},{sensor_reads},{true_values}')
