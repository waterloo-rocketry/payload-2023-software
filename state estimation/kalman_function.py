import numpy as np

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

    def __repr__(self):
        return self.x

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

        x_B = self.F @ self.x + self.G @ u
        P_B = self.F @ self.P @ self.F.T + self.Q

        KG = P_B @ self.H.T @ np.linalg.inv(self.H @ P_B @ self.H.T + self.R)

        x_A = x_B + KG @ (z - self.H @ x_B)
        P_A = P_B - KG @ self.H @ P_B

        self.x = x_A
        self.P = P_A

        return self.x





# this is where the fun begins




