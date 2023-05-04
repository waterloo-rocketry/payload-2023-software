import numpy as np

# angular stuff
theta = 0
omega = 2

## Position stuff
x = [0, 0, 0]
v = [300, 200, 100]
a = [-5, -10, -20]

def n():
    return np.random.normal(0, 1, 1)[0]

def conv(vec, vel, angle):
    Rot = np.array(
            [
            [np.cos(angle), -np.sin(angle), 0],
            [np.sin(angle), np.cos(angle), 0],
            [0, 0, 1]
            ])

    v = np.cross(np.array([0, 0, 1]), vel)
    c = np.dot(np.array([0, 0, 1]), vel)



    if vec = [0, 0, -1]:
        return [-elem for elem in vec]



for i in range(1000):
    t = 0.01 * (1 + i)
    sensor_reads = f'{x[0] + t*v[0] + t*t*a[0]/2 + n()},{x[1] + t*v[1] + t*t*a[1]/2 + n()},{x[2] + t*v[2] + t*t*a[2]/2 + n()},{a[0] + n()},{a[1] + n()},{a[2] + n()}'
    true_values = f'{x[0] + t*v[0] + t*t*a[0]/2},{x[1] + t*v[1] + t*t*a[1]/2},{x[2] + t*v[2] + t*t*a[2]/2},{v[0] + t*a[0]},{v[1] + t*a[1]},{v[2] + t*a[2]},{a[0]},{a[1]},{a[2]}'
    print(f'{t},{sensor_reads},{true_values}')
