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

// struct BufferStruct {
//     double* vector1;
//     double* vector2;
//     double* vector3;
//     double* vector4;
//     double* vector5;
//     double** matrix1;
//     double** matrix2;
//     double** matrix3;
//     double** matrix4;
//     double** matrix5;
//     double** matrix6;
//     double** matrix7;
//     double** matrix8;
//     double** matrix9;
    
// };


struct Matrix matrix_addition(struct Matrix A, struct Matrix B, double* result_data[]);
struct Matrix scalar_multiplication(struct Matrix A, double s, double* result_data[]);
struct Vector vector_multiplication(struct Matrix A, struct Vector B, double array[]);
struct Matrix matrix_multiplication(struct Matrix A, struct Matrix B, double* result_data[]);
struct Matrix matrix_transposition(struct Matrix A, double* result_data[]);
struct Vector cross_product(struct Vector A, struct Vector B, double* buf);

double dot_product(struct Vector A, struct Vector B);
double norm(struct Vector A);

void row_operation(struct Matrix A, int recvRow, int sendRow, double scalar);
struct Matrix matrix_inverse(struct Matrix matrix, double* inverse_data[]);


void print_matrix(struct Matrix A);

// Kalman Library Functions

struct KalmanEntity {
  struct Vector * state;
  struct Matrix * covariance;
};

struct PredictionParameters {
  struct Matrix * model; // F
  struct Matrix * prediction_uncertainty; // Q
};

struct ControlParameters {
  struct Matrix * control_matrix; // G
  struct Vector * input; // u
};

struct SensorReading {
  struct Matrix * sensor_matrix; // H
  struct Matrix * sensor_uncertainty; // R
  struct Vector * sensor_reading; // z
};

void KalmanIterate(
  struct KalmanEntity *k,
  struct PredictionParameters predParams,
  struct ControlParameters ctrlParams,
  struct SensorReading snsrReading
);

#endif /* _EXAMPLE_FILE_NAME_H */
