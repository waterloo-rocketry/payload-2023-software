import numpy as np

def skew_symmetric(vec):
  return np.array([
    [0, -vec[2], vec[1]],
    [vec[2], 0, -vec[0]],
    [-vec[1], vec[0], 0]
  ])

class RigidBody:
  def __init__(self):

    # params
    # self.J = skew_symmetric(np.array([1, 1, 1])) # spherical cow energy
    self.J = np.identity(3)

    # states
    self.Delta = np.zeros(3)

    self.v = np.zeros(3)

    self.R = np.identity(3)

    self.omega = np.zeros(3)

    # state derivatives
    self.Delta_dot = np.zeros(3)
    self.v_dot = np.zeros(3)
    self.R_dot = np.zeros((3,3))
    self.omega_dot = np.zeros(3)

    # inputs
    self.tau = np.zeros(3)
    self.a = np.zeros(3)

  def update(self, dt=0.01):
    # calculate the derivatives
    self.omega_dot = np.linalg.inv(self.J) @ (self.tau - np.cross(self.omega, self.J @ self.omega))

    self.v_dot = skew_symmetric(self.omega) @ self.v + self.a

    self.R_dot = self.R @ skew_symmetric(self.omega)

    self.Delta_dot = self.R @ self.v

    self.omega += self.omega_dot * dt
    self.Delta += self.Delta_dot * dt
    self.v += self.v_dot * dt
    self.R += self.R_dot * dt

class Payload(RigidBody):
  def __init__(self):
    super().__init__()

  def get_noisy_data(self):
    return (
      self.Delta + np.random.normal(0, 1, 3),
      self.v + np.random.normal(0, 1, 3),
      self.R + np.random.normal(0, 1, 3),
      self.omega + np.random.normal(0, 1, 3),
    )

  def control(self, a, tau, dt=0.01):
    self.a = a
    self.tau = tau
