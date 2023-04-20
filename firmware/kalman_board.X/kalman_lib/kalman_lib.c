#include "kalman_lib.h"
#include <math.h>
#include <stdlib.h>
#include <assert.h>

const int MATRIX_SIZE = 2;
double vector1[2] = {0,0};
double vector2[2] = {0,0};
double vector3[2] = {0,0};
double vector4[2] = {0,0};
double vector5[2] = {0,0};
double n1[2] = {0,0};
double m1[2] = {0,0};
double* matrix1[2] = {n1,m1};
double n2[2] = {0,0};
double m2[2] = {0,0};
double* matrix2[2] = {n2,m2};
double n3[2] = {0,0};
double m3[2] = {0,0};
double* matrix3[2] = {n3,m3};
double n4[2] = {0,0};
double m4[2] = {0,0};
double* matrix4[2] = {n4,m4};
double n5[2] = {0,0};
double m5[2] = {0,0};
double* matrix5[2] = {n5, m5};
double n6[2] = {0,0};
double m6[2] = {0,0};
double* matrix6[2] = {n6,m6};
double n7[2] = {0,0};
double m7[2] = {0,0};
double* matrix7[2] = {n7, m7};
double n8[2] = {0,0};
double m8[2] = {0,0};
double* matrix8[2] = {n8,m8};
double n9[2] = {0,0};
double m9[2] = {0,0};
double* matrix9[2] = {n9, m9};

//to run:   k.exe < inputfile.in > outputfile.out


struct Matrix matrix_addition(struct Matrix A, struct Matrix B, double *result_data[]){
    assert(A.rows == B.rows);
    assert(A.columns == B.columns);

    for (int i = 0; i < A.rows; i++){
        for (int j = 0; j < A.columns; j++){
            result_data[i][j] = A.data[i][j] + B.data[i][j];
        }
    }
    struct Matrix result = {result_data, A.rows, A.columns};

    return result;
}

struct Vector vector_addition(struct Vector A, struct Vector B, double array[]){
    assert(A.size == B.size);

    double * result_data = array;

    for (int i = 0; i < A.size; i++){
        result_data[i] = A.data[i] + B.data[i];
    }

    struct Vector result = {result_data, A.size};

    return result;
}


struct Matrix scalar_multiplication(struct Matrix A, double s, double *result_data[]){
    for (int i = 0; i < A.rows; i++){
        for (int j = 0; j < A.columns; j++){
            result_data[i][j] = A.data[i][j] * s;
        }
    }

    struct Matrix result = {result_data, A.rows, A.columns};
    return result;
}

struct Vector vector_multiplication(struct Matrix A, struct Vector B, double array[]){
    assert(B.size == A.columns);

    double * result_data = array;
    for (int i = 0; i < A.rows; i++){
        result_data[i] = 0;
        for (int j = 0; j < A.columns; j++){
            result_data[i] += A.data[i][j] * B.data[j];
        }
    }

    struct Vector result = {result_data, A.rows};

    return result;
}

struct Matrix matrix_multiplication(struct Matrix A, struct Matrix B, double *result_data[]){
    assert(A.columns == B.rows);

    for (int i = 0; i < A.rows; i++){
        for (int j = 0; j < B.columns; j++){            
            result_data[i][j] = 0;
            // result[i][j] = (ith row of A) * (jth column of B)
            for (int n = 0; n < A.columns; n++){
                result_data[i][j] += (A.data[i][n] * B.data[n][j]);
            }

        }
    }
    
    struct Matrix result = {result_data, A.rows, A.columns};
    return result;
}

struct Matrix matrix_transposition(struct Matrix A, double *result_data[]){
    for (int i = 0; i < A.columns; i++){
        for (int j = 0; j < A.rows; j++){            
            result_data[i][j] = A.data[j][i];
        }
    }

    struct Matrix result = {result_data, A.rows, A.columns};

    return result;
}

// Function to perform row operations on a matrix
void row_operation(struct Matrix A, int recvRow, int sendRow, double scalar) {
    assert(recvRow < A.rows);
    assert(sendRow < A.rows);

    for (int k = 0; k < A.columns; k++) {
        A.data[recvRow][k] -= scalar * A.data[sendRow][k];
    }
}

// Function to calculate the inverse of a matrix using Gauss-Jordan method
struct Matrix matrix_inverse(struct Matrix A, double *inverse_data[]) {
    assert(A.rows == A.columns);
    int n = A.rows;


    for (int i = 0; i < n; i++) {
        //inverse_data[i] = (double*)malloc(n * sizeof(double));
        for (int j = 0; j < n; j++) {
            if (i == j) {
                inverse_data[i][j] = 1.0;
            } else {
                inverse_data[i][j] = 0.0;
            }
        }
    }
    struct Matrix A_inv = {inverse_data, A.rows, A.columns};

    for (int i = 0; i < n; i++) {
        if (A.data[i][i] == 0) {
            // Find a row with non-zero entry in the ith column and swap it with the current row
            int row_to_swap = i + 1;
            while (row_to_swap < n && A.data[row_to_swap][i] == 0) {
                row_to_swap++;
            }
            if (row_to_swap == n) {
                // If no such row exists, the matrix is singular and has no inverse
                printf("Matrix is singular and has no inverse.\n");
                assert(1 == 0);
            }
            // Swap the current row with the row with non-zero entry in the ith column
            double* temp = A.data[i];
            A.data[i] = A.data[row_to_swap];
            A.data[row_to_swap] = temp;

            temp = A_inv.data[i];
            A_inv.data[i] = A_inv.data[row_to_swap];
            A_inv.data[row_to_swap] = temp;
        }
        double x = A.data[i][i];
        for (int j = 0; j < n; j++) {
            A.data[i][j] /= x;
            A_inv.data[i][j] /= x;
        }
        for (int j = 0; j < n; j++) {
            if (i != j) {
                x = A.data[j][i];
                row_operation(A, j, i, x);
                row_operation(A_inv, j, i, x);
            }
        }
    }

    return A_inv;
}

struct Vector cross_product(struct Vector A, struct Vector B, double *buf) {
    assert(A.size == B.size);
    assert(A.size == 3);

    buf[0] = A.data[1] * B.data[2] - A.data[2] * B.data[1];
    buf[1] = A.data[2] * B.data[0] - A.data[0] * B.data[2];
    buf[2] = A.data[0] * B.data[1] - A.data[1] * B.data[0];

    struct Vector result = (struct Vector) {buf, 3};
    return result;
}

double dot_product(struct Vector A, struct Vector B) {
    assert(A.size == B.size);
    double output = 0;

    for (int i = 0; i < A.size; ++i) {
        output += A.data[i] * B.data[i];
    }

    return output;
}

double norm(struct Vector A) {
    return sqrt(dot_product(A, A));
}

// Kalman Stuff

void KalmanIterate(
    struct KalmanEntity* k,
    struct PredictionParameters predParams,
    struct ControlParameters ctrlParams,
    struct SensorReading snsrReading
    )
{
    // Predict State, implementing these equations
    /*
    x_p = Fx + Gu
    P_p = FPF^t + Q
    */

    struct Vector x_p_no_control = vector_multiplication(*(predParams.model), *(k->state), vector1);
    struct Vector control = vector_multiplication(*(ctrlParams.control_matrix), *(ctrlParams.input), vector3);
    struct Vector x_p = vector_addition(x_p_no_control, control, vector2);
    struct Matrix FP = matrix_multiplication(*(predParams.model), *(k->covariance), matrix1);
    struct Matrix Ft = matrix_transposition(*(predParams.model), matrix2);
    struct Matrix P_p_no_noise = matrix_multiplication(FP, Ft, matrix3);
    struct Matrix P_p = matrix_addition(P_p_no_noise, *(predParams.prediction_uncertainty), matrix4);


    // Compute the Kalman Gain
    // KG = (P_p)H^t * (H(P_p)H^T + R)^-1

    struct Matrix HP_p = matrix_multiplication(*(snsrReading.sensor_matrix), P_p, matrix1);
    struct Matrix Ht = matrix_transposition(*(snsrReading.sensor_matrix), matrix2);
    struct Matrix denom_no_noise = matrix_multiplication(HP_p, Ht, matrix3);
    struct Matrix denom = matrix_addition(denom_no_noise, *(snsrReading.sensor_uncertainty), matrix5);
    struct Matrix denom_inv = matrix_inverse(denom, matrix6);
    struct Matrix Ht_denom_inv = matrix_multiplication(Ht, denom_inv, matrix7);
    struct Matrix KalmanGain = matrix_multiplication(P_p, Ht_denom_inv, matrix8);

    // Compute the update predictions
    struct Matrix minus_H = scalar_multiplication(*(snsrReading.sensor_matrix), -1, matrix1);
    struct Vector minus_Hxp = vector_multiplication(minus_H, x_p, vector1);
    struct Vector z_minus_Hxp = vector_addition(*(snsrReading.sensor_reading), minus_Hxp, vector3);
    struct Vector change_factor_x = vector_multiplication(KalmanGain, z_minus_Hxp, vector4);
    struct Vector x_updated = vector_addition(x_p, change_factor_x, vector5);


    struct Matrix minus_HPp = matrix_multiplication(minus_H, P_p, matrix2);
    struct Matrix negative_change_factor = matrix_multiplication(KalmanGain, minus_HPp, matrix3);
    struct Matrix P_updated = matrix_addition(P_p, negative_change_factor, matrix5);

    // Deep Copy the new values so that we can safely leave x_updated and P_updated to go out of scope

    //k->state = x_updated;
    k->state->size = x_updated.size;
    for (int i = 0; i < x_updated.size; i++){
      k->state->data[i] = x_updated.data[i];
    }
    
    //k->covariance = P_updated;
    k->covariance->rows = P_updated.rows;
    k->covariance->columns = P_updated.columns;
    for (int i = 0; i < P_updated.rows; i++){
      for (int j = 0; j < P_updated.columns; j++)
        k->covariance->data[i][j] = P_updated.data[i][j];
    }
}

