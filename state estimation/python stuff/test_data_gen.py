import time
import numpy as np

for i in range(1000):
    print(f'{0.01 * (1 + i)},{np.random.normal(0, 1, 1)[0]},{np.random.normal(0, 1, 1)[0]}')
