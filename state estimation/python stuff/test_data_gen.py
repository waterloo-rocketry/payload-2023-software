import time
import numpy as np

x = 0
v = 2

for i in range(1000):
    t = 0.01 * (1 + i)
    print(f'{t},{x + t*v + np.random.normal(0, 1, 1)[0]},{v + np.random.normal(0, 1, 1)[0]}')
