#include "kalman_lib.h"
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

struct Matrix matrix_addition(struct Matrix A, struct Matrix B){
    assert(A.rows == B.rows);
    assert(A.columns == B.columns);

    double ** result_data = (double **) malloc (A.rows * sizeof(double*));

    for (int i = 0; i < A.rows; i++){
        result_data[i] = (double*) malloc (A.columns * sizeof(double));
        for (int j = 0; j < A.columns; j++){
            result_data[i][j] = A.data[i][j] + B.data[i][j];
        }
    }
    
    struct Matrix result = {result_data, A.rows, A.columns};

    return result;
}

struct Vector vector_addition(struct Vector A, struct Vector B){
    assert(A.size == B.size);

    double * result_data = (double *) malloc (A.size * sizeof(double));

    for (int i = 0; i < A.size; i++){
        result_data[i] = A.data[i] + B.data[i];
    }
    
    struct Vector result = {result_data, A.size};

    return result;
}


struct Matrix scalar_multiplication(struct Matrix A, double s){
    double ** result_data = (double **) malloc (A.rows * sizeof(double*));
    for (int i = 0; i < A.rows; i++){
        result_data[i] = (double*) malloc (A.columns * sizeof(double));
        for (int j = 0; j < A.columns; j++){
            result_data[i][j] = A.data[i][j] * s;
        }
    }

    struct Matrix result = {result_data, A.rows, A.columns};

    return result;
}

struct Vector vector_multiplication(struct Matrix A, struct Vector B){
    assert(B.size == A.columns);

    double * result_data = (double *) malloc (A.rows * sizeof(double));
    for (int i = 0; i < A.rows; i++){
        result_data[i] = 0;
        for (int j = 0; j < A.columns; j++){
            result_data[i] += A.data[i][j] * B.data[j];
        }
    }

    struct Vector result = {result_data, A.rows};

    return result;
}

struct Matrix matrix_multiplication(struct Matrix A, struct Matrix B){
    assert(A.columns == B.rows);

    double** result_data = (double **) malloc (A.rows * sizeof(double*));
    for (int i = 0; i < A.rows; i++){
        result_data[i] = (double*) malloc (B.columns * sizeof(double));
        for (int j = 0; j < B.columns; j++){            
            result_data[i][j] = 0;
            // result[i][j] = (ith row of A) * (jth column of B)
            for (int n = 0; n < A.columns; n++){
                result_data[i][j] += (A.data[i][n] * B.data[n][j]);
            }

        }
    }
    
    struct Matrix result = {result_data, A.rows, B.columns};

    return result;
}

struct Matrix matrix_transposition(struct Matrix A){
    double ** result_data = (double **) malloc (A.columns * sizeof(double*));
    for (int i = 0; i < A.columns; i++){
        result_data[i] = (double*) malloc (A.rows * sizeof(double));
        for (int j = 0; j < A.rows; j++){            
            result_data[i][j] = A.data[j][i];
        }
    }

    struct Matrix result = {result_data, A.columns, A.rows};

    return result;
}

// Function to print a matrix
void print_matrix(struct Matrix A) {
    for (int i = 0; i < A.rows; i++) {
        for (int j = 0; j < A.columns; j++) {
            printf("%f ", A.data[i][j]);
        }
        printf("\n");
    }
}

void print_vector(struct Vector V) {
    for (int i = 0; i < V.size; i++) {
        printf("%f ", V.data[i]);
    }
    printf("\n");
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
struct Matrix matrix_inverse(struct Matrix A) {
    assert(A.rows == A.columns);
    int n = A.rows;

    double** inverse_data = (double**)malloc(n * sizeof(double*));

    for (int i = 0; i < n; i++) {
        inverse_data[i] = (double*)malloc(n * sizeof(double));
        for (int j = 0; j < n; j++) {
            if (i == j) {
                inverse_data[i][j] = 1.0;
            } else {
                inverse_data[i][j] = 0.0;
            }
        }
    }

    struct Matrix A_inv = {inverse_data, n, n};

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

void free_matrix(struct Matrix A) {
    for (int i = 0; i < A.rows; ++i) {
        free(A.data[i]);
    }

    free(A.data);
}

void free_vector(struct Vector v) {
    free(v.data);
}

// Kalman Stuff

void KalmanIterate(
    struct KalmanEntity* k,
    struct PredictionParameters predParams,
    struct ControlParameters ctrlParams,
    struct SensorReading snsrReading)
{
    // Predict State, implementing these equations
    /*
    x_p = Fx + Gu
    P_p = FPF^t + Q
    */

    struct Vector x_p_no_control = vector_multiplication(predParams.model, k->state);
    struct Vector control = vector_multiplication(ctrlParams.control_matrix, ctrlParams.input);
    struct Vector x_p = vector_addition(x_p_no_control, control);

    free_vector(x_p_no_control);
    free_vector(control);

    struct Matrix FP = matrix_multiplication(predParams.model, k->covariance);
    struct Matrix Ft = matrix_transposition(predParams.model);
    struct Matrix P_p_no_noise = matrix_multiplication(FP, Ft);
    struct Matrix P_p = matrix_addition(P_p_no_noise, predParams.prediction_uncertainty);

    free_matrix(FP);
    free_matrix(Ft);
    free_matrix(P_p_no_noise);

    //printf("Predicted State:\n");
    //print_vector(x_p);
    //printf("Predicted Covariances:\n");
    //print_matrix(P_p);

    // Compute the Kalman Gain
    // KG = (P_p)H^t * (H(P_p)H^T + R)^-1

    struct Matrix HP_p = matrix_multiplication(snsrReading.sensor_matrix, P_p);
    struct Matrix Ht = matrix_transposition(snsrReading.sensor_matrix);
    struct Matrix denom_no_noise = matrix_multiplication(HP_p, Ht);
    struct Matrix denom = matrix_addition(denom_no_noise, snsrReading.sensor_uncertainty);
    struct Matrix denom_inv = matrix_inverse(denom);
    struct Matrix Ht_denom_inv = matrix_multiplication(Ht, denom_inv);
    struct Matrix KalmanGain = matrix_multiplication(P_p, Ht_denom_inv);

    //printf("Kalman Gain:\n");
    //print_matrix(KalmanGain);

    free_matrix(HP_p);
    free_matrix(Ht);
    free_matrix(denom_no_noise);
    free_matrix(denom);
    free_matrix(denom_inv);
    free_matrix(Ht_denom_inv);

    // Compute the update predictions
    struct Matrix minus_H = scalar_multiplication(snsrReading.sensor_matrix, -1);

    struct Vector minus_Hxp = vector_multiplication(minus_H, x_p);
    struct Vector z_minus_Hxp = vector_addition(snsrReading.sensor_reading, minus_Hxp);
    struct Vector change_factor_x = vector_multiplication(KalmanGain, z_minus_Hxp);
    struct Vector x_updated = vector_addition(x_p, change_factor_x);

    free_vector(minus_Hxp);
    free_vector(z_minus_Hxp);
    free_vector(change_factor_x);

    struct Matrix minus_HPp = matrix_multiplication(minus_H, P_p);
    struct Matrix negative_change_factor = matrix_multiplication(KalmanGain, minus_HPp);
    struct Matrix P_updated = matrix_addition(P_p, negative_change_factor);

    free_matrix(minus_H);
    free_matrix(minus_HPp);
    free_matrix(negative_change_factor);

    free_vector(x_p);
    free_matrix(P_p);
    free_matrix(KalmanGain);

    free_vector(k->state);
    free_matrix(k->covariance);

    k->state = x_updated;
    k->covariance = P_updated;
}

/*
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
*/
/* *****************************************************************************
 End of File
 */
