#include "kalman_lib.h"
#include <stdio.h>
#include <stdlib.h>

int main(){
    double** A = (double**) malloc (sizeof(double*) * 3);
    for (int i = 0; i < 3; i++){
        A[i] = (double*) malloc (sizeof(double) * 2);
    }
    A[0][0] = 1; A[0][1] = 2;
    A[1][0] = 2; A[1][1] = 1;
    A[2][0] = 3; A[2][1] = 3;
    
    double** B = (double**) malloc (sizeof(double*) * 2);
    for (int i = 0; i < 2; i++){
        B[i] = (double*) malloc (sizeof(double) * 1);
    }
    B[0][0] = 3; //B[0][1] = 2;
    B[1][0] = 2; //B[1][1] = 1;

    int* Csize = malloc(sizeof(int) * 2);
    double** C = matrix_multiplication(A, B, 3, 2, 2, 1, Csize);

    printf("%d %d\n", Csize[0], Csize[1]);
    for (int i = 0; i < Csize[0]; i++){ 
        for (int j = 0; j < Csize[1]; j++){
            printf("%f ", C[i][j]);
        }
        printf("\n");
    }

}
