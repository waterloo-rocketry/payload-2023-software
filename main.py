import time

import numpy as np
# see https://numpy.org/doc/stable/numpy-user.pdf
from scipy import *

# two state variable implementation of a standard kalman filter for yaw angle and angular momentum (LSM6DS33 IMU chip)
# prediction eqns: x(t+1) = F*x(t) + G*u(t); P(t+1) = F*P(t)*F' + Q
# update eqns: xA = x(t+1) + K(t)*( z(t) - x(t+1) ), <insert P eqn>


# we are going to keep track of angle and angular momentum,

## static matrices

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
# (im calling the noise for the angle measurement 0 here, since any error will come from a combination of angular
# momentum encapsulated in q[1][1] and measurment error encapsulated in R )

Q = np.array([0, 0],
             [0, .361])

# u is the "control input" - we use it to tell the model when we are applying a known external disturbance
# to the system, so that it sees it coming. otherwise our measurement device will essentially spike, but our model
# will disagree and heavily dampen the change to "correct" the sensor.
#
# In our case, u will nominally be a 90 degree turn,
# which we will toss in on one iteration of the loop. Otherwise u will just be 0 (we wont add u)
# not particularly accurate since we wont be instantatneously spinning the sensor 90 degrees, but we
# dont have a better choice unless we attach to a motor and add angular momentum as a control input instead or smth


# G is the transformation from u-space to x-space (that is, if u is m x 1 and x is n x 1, G is n x m)
# essentially, it defines how each control variable affects each state variable (if at all)
# here, our state is in degrees and dps, and since we're simulating everything, we just choose our control input to
# also be in degrees - hence G is just the vector [1, 0]

G = np.array([1, 0]).transpose()


# H defines the transformation from x-space to z-space. Since our z is a 1x1 vector representing angular velocity
# (in dps as expected), and x contains both angle and angular velocity, H is defined as:

H = np.array([0, 1])


def dynamic_matrices(d_t):
    # F contains the model information. The current angle is equal to the last angle plus the angular velocity
    # integrated over time (that is, multiplied by the discrete time step, d_t)
    F = np.array([1, d_t],
                 [0, 1])

    return (F,)


def get_gyro_yaw_velocity():
    return 69.420


def kalman_iteration(d_t, x_old, P_old, G, u, Q, R, H):
    F = dynamic_matrices(d_t)[0]
    z = get_gyro_yaw_velocity()

    x_b = F*x_old + G*u
    P_b = F*P*F.T + Q

    K = P*H.T * np.invert(H*P*H.T + R)

    x_a = x_b + K*(z - H*x_b)
    P_a = (np.identity(2)-K*H)*P_b

    return (x_a, P_a)




# define initial values
# the intial value of P represents the accuracy of our intial estiamtion of x
# specifically, it is the covariance matrix of x1, x2......
# lets say one std deviation on our absolute angle is 1 degree. then our variance for x1 is 1^2 = 1
# we are a lot more confident that our sensor is not spinning intially, than we are that it is
# pointing at exactly 0 degrees, and we set it up accordingly

x = np.array([0, 0]).transpose()
P = np.array([1**2, 0],
             [0, 0.25**2])

t_total = 0
d_t = 0
t_last = time.time()
duration = 5000
u_flag = False

while(t_total < duration):
    d_t = time.time() - t_last
    t_total += d_t

    u = 0
    if t_total >= 1000 and not u_flag:
        u = 90
        u_flag = True

    x, P = kalman_iteration(d_t, x, P, G, Q, R, H)
    print(x, P)



