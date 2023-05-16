#include "orientation_conversion.h"
#include "kalman_lib.h"
#include <math.h>

struct Matrix reference_frame_correction(struct Vector velocity, double angle, double **buffer) {
    // we require velocity to be normalized.
    buffer[0][0] = buffer[1][1] = buffer[2][2] = 1;
    buffer[0][1] = buffer[0][2] = buffer[1][0] = buffer[1][2] = buffer[2][0] = buffer[2][1] = 0;

    /* Computing the rotation due to theta */
    double rot0[3] = {cos(angle), -sin(angle), 0};
    double rot1[3] = {sin(angle), cos(angle), 0};
    double rot2[3] = {0, 0, 1};
    double *rot[3] = {rot0, rot1, rot2};
    
    struct Matrix Rot = {rot, 3, 3};

    /* Computing the rotation that alings the reference frame */
    double cross_prod[3];
    double z_dat[3] = {0, 0, 1};
    struct Vector z_hat = {z_dat, 3};

    struct Vector v = cross_product(z_hat, velocity, cross_prod);
    double c = dot_product (z_hat, velocity);

    /* Check to make sure we won't be diving by 0 (we need to do 1/(1+c)) */
    if (c == -1) {
      buffer = rot;
      return Rot;
    }

    // [v]_x
    double align0[3] = {0, -v.data[2], v.data[1]};
    double align1[3] = {v.data[2], 0, -v.data[0]};
    double align2[3] = {-v.data[1], v.data[0], 0};
    double *align[3] = {align0, align1, align2};
    struct Matrix Align = {align, 3, 3};

    // identity
    double iden0[3] = {1, 0, 0};
    double iden1[3] = {0, 1, 0};
    double iden2[3] = {0, 0, 1};
    double *iden[3] = {iden0, iden1, iden2};
    struct Matrix Iden = {iden, 3, 3};

    // buffers
    double b10[3];
    double b11[3];
    double b12[3];
    double *b1[3] = {b10, b11, b12};

    double b20[3];
    double b21[3];
    double b22[3];
    double *b2[3] = {b20, b21, b22};

    struct Matrix v_square = matrix_multiplication(Align, Align, b1);
    struct Matrix v_square_scaled = scalar_multiplication(v_square, 1/(1 + c), b1);
    struct Matrix v_square_scaled_plus_v = matrix_addition(v_square_scaled, Align, b1);
    struct Matrix v_square_scaled_plus_v_plus_i = matrix_addition(v_square_scaled_plus_v, Iden, b1);

    /* putting it all together */
    struct Matrix result_inverse = matrix_multiplication(v_square_scaled_plus_v_plus_i, Rot, b2);
    struct Matrix result = matrix_inverse(result_inverse, buffer);

    return result;
}

