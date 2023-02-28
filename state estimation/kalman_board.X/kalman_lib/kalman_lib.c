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
        for (int j = 0; j < sizeY; j++){
            result_data[i][j] = A.data[i][j] + B.data[i][j];
        }
    }
    
    struct Matrix result = {result_data, A.rows, A.columns};

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
    assert(B.size == A.columns)

    double * result_data = (double *) malloc (A.rows * sizeof(double));
    for (int i = 0; i < A.rows; i++){
        result_data[i] = 0;
        for (int j = 0; j < A.columns; j++){
            result_data[i] += A.data[i][j] * B[j];
        }
    }

    struct Matrix result = {result_data, A.rows};

    return result;
}

struct Matrix matrix_multiplication(struct Matrix A, struct Matrix B){
    assert(A.columns == B.rows);

    double** result_data = (double **) malloc (A.rows * sizeof(double*));
    for (int i = 0; i < A.rows; i++){
        result_data[i] = (double*) malloc (B.columns * sizeof(double));
        for (int j = 0; j < B.columns; j++){            
            result[i][j] = 0;
            // result[i][j] = (ith row of A) * (jth column of B)
            for (int n = 0; n < AsizeY; n++){
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
        result[i] = (double*) malloc (A.rows * sizeof(double));
        for (int j = 0; j < A.rows; j++){            
            result_data[i][j] = A.data[j][i];
        }
    }

    struct Matrix result = {result_data, A.columns, B.rows};

    return result;
}

// Function to print a matrix
void printMatrix(struct Matrix A) {
    for (int i = 0; i < A.rows; i++) {
        for (int j = 0; j < A.columns; j++) {
            printf("%f ", matrix[i][j]);
        }
        printf("\n");
    }
}

// Function to perform row operations on a matrix
void rowOperation(struct Matrix A, int recvRow, int sendRow, double scalar) {
    assert(recvRow < A.rows);
    assert(sendRow < A.rows);

    for (int k = 0; k < A.columns; k++) {
        A.data[recvRow][k] -= scalar * A.data[sendRow][k];
    }
}

// Function to calculate the inverse of a matrix using Gauss-Jordan method
struct Matrix matrixInverse(struct Matrix matrix) {
    assert(matrix.rows == matrix.columns);
    int n = matrix.rows;

    double** inverse = (double**)malloc(n * sizeof(double*));

    for (int i = 0; i < n; i++) {
        inverse[i] = (double*)malloc(n * sizeof(double));
        for (j = 0; j < n; j++) {
            if (i == j) {
                inverse[i][j] = 1.0;
            } else {
                inverse[i][j] = 0.0;
            }
        }
    }

    for (int i = 0; i < n; i++) {
        if (matrix.data[i][i] == 0) {
            // Find a row with non-zero entry in the ith column and swap it with the current row
            int row_to_swap = i + 1;
            while (row_to_swap < n && matrix.data[row_to_swap][i] == 0) {
                row_to_swap++;
            }
            if (row_to_swap == n) {
                // If no such row exists, the matrix is singular and has no inverse
                printf("Matrix is singular and has no inverse.\n");
                assert(1 == 0);
            }
            // Swap the current row with the row with non-zero entry in the ith column
            for (int j = 0; j < n; j++){
                printf("%f ", matrix.data[i][j]);
            }
            double* temp = matrix.data[i];
            matrix.data[i] = matrix.data[row_to_swap];
            matrix.data[row_to_swap] = temp;
            temp = inverse[i];
            inverse[i] = inverse[row_to_swap];
            inverse[row_to_swap] = temp;
        }
        double x = matrix.data[i][i];
        for (int j = 0; j < n; j++) {
            matrix.data[i][j] /= x;
            inverse[i][j] /= x;
        }
        for (int j = 0; j < n; j++) {
            if (i != j) {
                x = matrix.data[j][i];
                rowOperation(matrix.data, n, j, i, x);
                rowOperation(inverse, n, j, i, x);
            }
        }
    }
    struct Matrix result = {inverse, n, n};
    return result;
}

void freeMatrix(struct Matrix A) {
    for (int i = 0; i < A.rows; ++i) {
        free(A.data[i]);
    }

    free(A.data);
}

void freeVector(struct Vector v) {
    free(v.data);
}

// Kalman Stuff

void KalmanIterate(struct KalmanEntity k, ){
    // Predict State
    struct Vector x_p = vector_multiplication(F, k.state);

    struct Matrix m1 = matrix_multiplication(F, k.covariance);
    struct Matrix m2 = matrix_transposition(F);
    struct Matrix P_p = matrix_multiplication(m1, m2);

    freeMatrix(m1);
    freeMatrix(m2);
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
