import numpy as np
# see https://numpy.org/doc/stable/numpy-user.pdf
from scipy import *

a = np.array([[0, 1, 2, 3],
       [4, 5, 6, 7],
       [8, 9, 10, 11]])

print(a)

# univariate implementation of a standard kalman filter for yaw angle (LSM6DS33 IMU chip)
# prediction eqns: x(t+1) = F*x(t) + G*u(t); P(t+1) = F*P(t)*F' + Q
# update eqns: xA = x(t+1) + K(t)*( z(t) - x(t+1) ), <insert P eqn>

## static matrices (here, 1x1)

# datasheet specifies a zero-rate offset (that is, how fast the gyro will say its rotating when its actually
# rotating at 0 deg/s) of +/- 10 dps, which is pretty standard (this is one of the places where gyros suck and why
# we want to filter their data in the first place) so that will be our R value
R = 10

# digestiable info on how to calculate noise is pretty bad, buuuut
# https://ez.analog.com/mems/f/q-a/81960/gyros-rate-noise-density this guy gives us some equations
# "noise" will usually be specified as a single value with a name like "rate noise density"
# in units of <thing you want to measure> / sqrt(Hz)
# In summary, letting in higher frequency signals lets you read data faster but makes your data more noisy
# In order to determine bandwidth, we will consult the "output data rate" section of the datasheet
# Ideally we would filter out frequencies above what the gyro transmits at
# (the only possible thing those frequencies could be is noise)
# but for an approximation we will just say our bandwidth is from 0 to the highest output rate in Hz (1666)
# (RMS is root mean squared - its like mean but oscillating signals have a true mean of 0 so we use this instead)
# RMSNoise = 7*10^-3 dps * sqrt(1666*1.6) = 0.361 dps - hence:

Q = 0.361


# u is the "control input" - we use it to tell the model when we are applying a known external disturbance
# to the system, so that it sees it coming. otherwise our measurement device will essentially spike, but our model
# will disagree and heavily dampen the change to "correct" the sensor.
#
# In our case, u will nominally be a 90 degree turn,
# which we will toss in on one iteration of the loop. Otherwise u will just be 0 (we wont add u)

u = 90

# G is the transformation from u-space to x-space (that is, if u is m x 1 and x is n x 1, G is n x m)
# essentially, it defines how each control variable affects each state variable (if at all)
# here, our state is in degrees and since we're simulating everything, we just choose our control input to
# also be in degrees - hence G is just 1

G = 1







