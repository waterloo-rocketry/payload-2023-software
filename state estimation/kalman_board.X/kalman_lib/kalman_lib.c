#include "kalman_lib.h"
#include <stdio.h>
#include <stdlib.h>

/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.c

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

/* This section lists the other files that are included in this file.
 */

/* TODO:  Include other files here if needed. */


/* ************************************************************************** */
/* ************************************************************************** */
/* Section: File Scope or Global Data                                         */
/* ************************************************************************** */
/* ************************************************************************** */

/*  A brief description of a section can be given directly below the section
    banner.
 */

/* ************************************************************************** */
/** Descriptive Data Item Name

  @Summary
    Brief one-line summary of the data item.
    
  @Description
    Full description, explaining the purpose and usage of data item.
    <p>
    Additional description in consecutive paragraphs separated by HTML 
    paragraph breaks, as necessary.
    <p>
    Type "JavaDoc" in the "How Do I?" IDE toolbar for more information on tags.
    
  @Remarks
    Any additional remarks
 */
int global_data;


/* ************************************************************************** */
/* ************************************************************************** */
// Section: Local Functions                                                   */
/* ************************************************************************** */
/* ************************************************************************** */

/*  A brief description of a section can be given directly below the section
    banner.
 */

/* ************************************************************************** */

/** 
  @Function
    int ExampleLocalFunctionName ( int param1, int param2 ) 

  @Summary
    Brief one-line description of the function.

  @Description
    Full description, explaining the purpose and usage of the function.
    <p>
    Additional description in consecutive paragraphs separated by HTML 
    paragraph breaks, as necessary.
    <p>
    Type "JavaDoc" in the "How Do I?" IDE toolbar for more information on tags.

  @Precondition
    List and describe any required preconditions. If there are no preconditions,
    enter "None."

  @Parameters
    @param param1 Describe the first parameter to the function.
    
    @param param2 Describe the second parameter to the function.

  @Returns
    List (if feasible) and describe the return values of the function.
    <ul>
      <li>1   Indicates an error occurred
      <li>0   Indicates an error did not occur
    </ul>

  @Remarks
    Describe any special behavior not described above.
    <p>
    Any additional remarks.

  @Example
    @code
    if(ExampleFunctionName(1, 2) == 0)
    {
        return 3;
    }
 */
static int ExampleLocalFunction(int param1, int param2) {
    return 0;
}


/* ************************************************************************** */
/* ************************************************************************** */
// Section: Interface Functions                                               */
/* ************************************************************************** */
/* ************************************************************************** */

/*  A brief description of a section can be given directly below the section
    banner.
 */

// *****************************************************************************

/** 
  @Function
    int ExampleInterfaceFunctionName ( int param1, int param2 ) 

  @Summary
    Brief one-line description of the function.

  @Remarks
    Refer to the example_file.h interface header for function usage details.
 */
int ExampleInterfaceFunction(int param1, int param2) {
    return 0;
}

double** matrix_addition(double** A, double ** B, int sizeX, int sizeY){
    double ** result = (double **) malloc (sizeX * sizeof(double*));
    for (int i = 0; i < sizeX; i++){
        result[i] = (double*) malloc (sizeY * sizeof(double));
        for (int j = 0; j < sizeY; j++){
            result[i][j] = A[i][j] + B[i][j];
        }
    }
    return result;
}
double** scalar_multiplication(double** A, double B, int sizeX, int sizeY){
    double ** result = (double **) malloc (sizeX * sizeof(double*));
    for (int i = 0; i < sizeX; i++){
        result[i] = (double*) malloc (sizeY * sizeof(double));
        for (int j = 0; j < sizeY; j++){
            result[i][j] = A[i][j] * B;
        }
    }
    return result;
}

double* vector_multiplication(double** A, double* B, int sizeX, int sizeY, int sizeV){
    if (sizeV != sizeY){
        return NULL;
    }
    double * result = (double *) malloc (sizeV * sizeof(double*));
    for (int i = 0; i < sizeV; i++){
        result[i] = 0;
        for (int j = 0; j < sizeX; j++){
            result[i] += A[i][j] * B[j];
        }
    }
    return result;
}

double** matrix_multiplication(double** A, double** B, int AsizeX, int AsizeY, int BsizeX, int BsizeY, int* sizeReturn){
    if (AsizeY != BsizeX){
        return NULL;
    }
    else {
        sizeReturn[0] = AsizeX;
        sizeReturn[1] = BsizeY;
    }
    double ** result = (double **) malloc (AsizeX * sizeof(double*));
    for (int i = 0; i < AsizeX; i++){
        result[i] = (double*) malloc (BsizeY * sizeof(double));
        for (int j = 0; j < BsizeY; j++){            
            result[i][j] = 0;
            // actual multiplication
            for (int n = 0; n < AsizeY; n++){
                result[i][j] += (A[i][n] * B[n][j]);
            }

        }
    }
    return result;
}

double** matrix_transposition(double** A, int AsizeX, int AsizeY, int* sizeReturn){
    sizeReturn[0] = AsizeY;
    sizeReturn[1] = AsizeX;
    double ** result = (double **) malloc (AsizeY * sizeof(double*));
    for (int i = 0; i < AsizeY; i++){
        result[i] = (double*) malloc (AsizeX * sizeof(double));
        for (int j = 0; j < AsizeX; j++){            
            result[i][j] = A[j][i];
        }
    }
    return result;
}

// Function to print a matrix
void printMatrix(double** matrix, int n) {
    int i, j;
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            printf("%f ", matrix[i][j]);
        }
        printf("\n");
    }
}

// Function to perform row operations on a matrix
void rowOperation(double** matrix, int n, int i, int j, double x) {
    int k;
    for (k = 0; k < n; k++) {
        matrix[i][k] -= x * matrix[j][k];
    }
}

// Function to calculate the inverse of a matrix using Gauss-Jordan method
double** matrixInverse(double** matrix, int n) {
    double** inverse = (double**)malloc(n * sizeof(double*));
    int i, j, k;
    for (i = 0; i < n; i++) {
        inverse[i] = (double*)malloc(n * sizeof(double));
        for (j = 0; j < n; j++) {
            if (i == j) {
                inverse[i][j] = 1.0;
            } else {
                inverse[i][j] = 0.0;
            }
        }
    }
    for (i = 0; i < n; i++) {
        if (matrix[i][i] == 0) {
            // Find a row with non-zero entry in the ith column and swap it with the current row
            int row_to_swap = i + 1;
            while (row_to_swap < n && matrix[row_to_swap][i] == 0) {
                row_to_swap++;
            }
            if (row_to_swap == n) {
                // If no such row exists, the matrix is singular and has no inverse
                printf("Matrix is singular and has no inverse.\n");
                exit(1);
            }
            // Swap the current row with the row with non-zero entry in the ith column
            for (int j = 0; j < n; j++){
                printf("%f ", matrix[i][j]);
            }
            double* temp = matrix[i];
            matrix[i] = matrix[row_to_swap];
            matrix[row_to_swap] = temp;
            temp = inverse[i];
            inverse[i] = inverse[row_to_swap];
            inverse[row_to_swap] = temp;
        }
        double x = matrix[i][i];
        for (j = 0; j < n; j++) {
            matrix[i][j] /= x;
            inverse[i][j] /= x;
        }
        for (j = 0; j < n; j++) {
            if (i != j) {
                x = matrix[j][i];
                rowOperation(matrix, n, j, i, x);
                rowOperation(inverse, n, j, i, x);
            }
        }
    }
    return inverse;
}



struct KalmanEntity{
    int dim;
    double* state;
    double** covariance;
}

void KalmanIterate(struct KalmanEntity* k, double* control, double* sensor, double** model){
    double* predicted_state = vector_multiplication(model, k->state, k->dim, k->dim, )


}

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

/* *****************************************************************************
 End of File
 */
