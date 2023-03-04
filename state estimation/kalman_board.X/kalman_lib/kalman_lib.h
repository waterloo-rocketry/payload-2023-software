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
void row_operation(struct Matrix A, int recvRow, int sendRow, double scalar);
struct Matrix matrix_inverse(struct Matrix matrix);
void free_matrix(struct Matrix A);
void free_vector(struct Vector v);

void print_matrix(struct Matrix A);

// Kalman Library Functions

struct KalmanEntity {
  struct Vector state;
  struct Matrix covariance;
};

struct PredictionParameters {
  struct Matrix model; // F
  struct Matrix prediction_uncertainty; // Q
};

struct ControlParameters {
  struct Matrix control_matrix; // G
  struct Vector input; // u
};

struct SensorReading {
  struct Matrix sensor_matrix; // H
  struct Matrix sensor_uncertainty; // R
  struct Vector sensor_reading; // z
};

void KalmanIterate(
  struct KalmanEntity *k,
  struct PredictionParameters predParams,
  struct ControlParameters ctrlParams,
  struct SensorReading snsrReading
);

#endif /* _EXAMPLE_FILE_NAME_H */
