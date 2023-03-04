#include <stdio.h>
#include <stdlib.h>
#include "kalman_lib.h"

struct Matrix load_matrix() {
    int n; 
    scanf("%d", &n);
    double** matrix = (double**)malloc(n * sizeof(double*));
    for (int i = 0; i < n; i++) {
        matrix[i] = (double*)malloc(n * sizeof(double));
        for (int j = 0; j < n; j++) {
            scanf("%lf", &matrix[i][j]);
        }
    }
    struct Matrix A = {matrix, n, n};
    return A;
}


int main() {
    for (int _ = 0; _ < 2; ++_) {
        struct Matrix A = load_matrix();
        printf("The matrix is:\n");
        print_matrix(A);

        struct Matrix inverse = matrix_inverse(A);
        printf("The inverse of the matrix is:\n");
        print_matrix(inverse);

        free_matrix (A);
        free_matrix (inverse);
    }

    

    return 0;
}
