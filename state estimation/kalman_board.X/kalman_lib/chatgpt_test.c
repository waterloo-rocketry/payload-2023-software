#include <stdio.h>
#include <stdlib.h>

// Function to print a matrix
void printMatrix(float** matrix, int n) {
    int i, j;
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            printf("%f ", matrix[i][j]);
        }
        printf("\n");
    }
}

// Function to perform row operations on a matrix
void rowOperation(float** matrix, int n, int i, int j, float x) {
    int k;
    for (k = 0; k < n; k++) {
        matrix[i][k] -= x * matrix[j][k];
    }
}

// Function to calculate the inverse of a matrix using Gauss-Jordan method
float** matrixInverse(float** matrix, int n) {
    float** inverse = (float**)malloc(n * sizeof(float*));
    int i, j, k;
    for (i = 0; i < n; i++) {
        inverse[i] = (float*)malloc(n * sizeof(float));
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
                printf("%f ", matrix[row_to_swap][j]);
            }
            printf("\n");
            float* temp = matrix[i];
            matrix[i] = matrix[row_to_swap];
            matrix[row_to_swap] = temp;
            temp = inverse[i];
            inverse[i] = inverse[row_to_swap];
            inverse[row_to_swap] = temp;
        }
        float x = matrix[i][i];
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

int main() {
    int n, i, j;
    printf("Enter the size of matrix: ");
    n = 3; 
    // scanf("%d", &n);
    float** matrix = (float**)malloc(n * sizeof(float*));
    printf("Enter the matrix:\n");
    for (i = 0; i < n; i++) {
        matrix[i] = (float*)malloc(n * sizeof(float));
        for (j = 0; j < n; j++) {
            //scanf("%f", &matrix[i][j]);
        }
    }
    matrix[0][0] = 0;matrix[0][1] = 0;matrix[0][2] = 9;
    matrix[1][0] = 2;matrix[1][1] = 1;matrix[1][2] = 3;
    matrix[2][0] = 1;matrix[2][1] = 0;matrix[2][2] = 8;


    printf("The matrix is:\n");
    printMatrix(matrix, n);
    float** inverse = matrixInverse(matrix, n);
    printf("The inverse of the matrix is:\n");
    printMatrix(inverse, n);
    return 0;
}
