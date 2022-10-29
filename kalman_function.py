import numpy as np
import time


# workflow looks something like:
# 1. define static matrices (R,Q, etc)
# 2. define intial values for time-dependent matrices (x, F, etc)
# 3. create filter object
# 4. call filter init method
# 5. begin mainloop
# 6. get sys time

# 1.1. Get current time
# 1.2. Get delta t

class Kalman:
    def __init__(self, dim_x, dim_z, dim_u):
        self.x = np.zeros((dim_x, 1))
        self.F = np.zeros((dim_x, dim_x))
        self.u = np.zeros((dim_u, 1))
        self.G = np.zeros((dim_x, dim_u))
        self.P = np.zeros((dim_x, dim_x))
        self.Q = np.zeros((dim_x, dim_x))

        self.z = np.zeros((dim_z, 1))
        self.R = np.zeros((dim_z, dim_z))
        self.H = np.zeros((dim_z, dim_x))

        for n in range(self.x.shape[0]):
            self.x[n] = 1

    def __repr__(self):
        self.x

    def initialize(self, x_0, F_0, G_0, P_0, Q_0, R_0, H_0):
        self.x = x_0
        self.F = F_0
        self.G = G_0
        self.P = P_0
        self.Q = Q_0
        self.R = R_0
        self.H = H_0

    def iterate(self, z, u, F=None, G=None, Q=None):
        # x and P are off limits, z is required, R shouldn't change. H also probably shouldn't change in our case

        if F is not None:
            self.F = F
        if G is not None:
            self.G = G
        if Q is not None:
            self.Q = Q

        x_B = self.F * self.x + self.G * u
        P_B = self.F * self.P * self.F.T + self.Q

        KG = P_B * self.H.T * np.invert(self.H * P_B * self.H.T + self.R)

        x_A = x_B + KG * (z - self.H * x_B)
        P_A = P_B - KG * self.H * P_B

        self.x = x_A
        self.P = P_A

        return self.x


# testing fun times #1

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

G = np.array([1, 0]).T

# H defines the transformation from x-space to z-space. Since our z is a 1x1 vector representing angular velocity
# (in dps as expected), and x contains both angle and angular velocity, H is defined as:

H = np.array([0, 1])


# this is where the fun begins


def get_gyro_data():
    return 0


x = np.zeros((2, 1))
F = np.zeroes((2, 2))
P = np.array([1**2, 0],
             [0, 0.25**2])
u = 0
k = Kalman(2, 1, 1)

t_last = time.time()
dt = 0
sum_t = 0
results = []

k.initialize(x, F, G, P, Q, R, H)

while sum_t < 60:
    t = time.time()
    dt = t - t_last
    t_last = t
    sum_t += dt

    F = np.array([1, dt],
                 [0, 1])

    x = k.iterate(get_gyro_data(), 0, F=F)
    print(x)
    results.append([sum_t, x])
