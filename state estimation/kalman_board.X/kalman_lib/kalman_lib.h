/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef _EXAMPLE_FILE_NAME_H    /* Guard against multiple inclusion */
#define _EXAMPLE_FILE_NAME_H

#ifndef KALMAN_LIB
#ifndef KALMAN_LIB
#define KALMAN_LIB
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

// Linear Algebra

struct Matrix {
  double** data;
  int rows;
  int columns;
};

struct Vector {
  double* data;
  int size;
};


struct Matrix matrix_addition(struct Matrix A, struct Matrix B);
struct Matrix scalar_multiplication(struct Matrix A, double s);
struct Vector vector_multiplication(struct Matrix A, struct Vector B);
struct Matrix matrix_multiplication(struct Matrix A, struct Matrix B);
struct Matrix matrix_transposition(struct Matrix A);
void rowOperation(struct Matrix A, int recvRow, int sendRow, double scalar);
struct Matrix matrix_inverse(struct Matrix matrix);
void freeMatrix(struct Matrix A);
void freeVector(struct Vector v);

// Kalman Library Functions

struct KalmanEntity {
  struct Vector state;
  struct Matrix covariance;
};

struct KalmanEnvironment {
  struct Matrix model; // F
  struct Matrix control; // G
  struct Matrix predictionNoise; // Q

};

#endif /* _EXAMPLE_FILE_NAME_H */
