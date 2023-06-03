import numpy as np

def conv(vec, vel, angle):
    norm = np.linalg.norm(vel)
    for i in range(3):
        vel[i] /= norm
    
    Rot = np.array(
            [
            [np.cos(angle), -np.sin(angle), 0],
            [np.sin(angle), np.cos(angle), 0],
            [0, 0, 1]
            ])

    v = np.cross(np.array([0, 0, 1]), vel)
    c = np.dot(np.array([0, 0, 1]), vel)

    if c == -1:
        return Rot

    Align = np.array(
        [
            [0, -v[2], v[1]],
            [v[2], 0, -v[0]],
            [-v[1], v[0], 0]
        ]
    )

    Iden = np.array(
        [
            [1,0,0],
            [0,1,0],
            [0,0,1]
        ]
    )

    v_square = np.matmul(Align, Align)
    v_square_scaled = v_square * (1/(1+c))
    v_square_scaled_plus_v = v_square_scaled + Align
    v_square_scaled_plus_v_plus_i = v_square_scaled_plus_v + Iden

    result = np.matmul(v_square_scaled_plus_v_plus_i, Rot)

    return np.matmul(result, vec)
