#include "kalman_lib.h"

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

double** matrix_multiplication(double** A, double** B, int AsizeX, int AsizeY, int BsizeX, int BsizeY){
    if (AsizeY != BsizeX){
        return NULL;
    }
    double ** result = (double **) malloc (AsizeX * sizeof(double*));
    for (int i = 0; i < AsizeX; i++){
        result[i] = (double*) malloc (BsizeY * sizeof(double));
        for (int j = 0; j < BsizeY; j++){
            
            result[i][j] = 0;
            // actual multiplication
            for (int n = 0; n < AsizeX; n++){
                result[i][j] += (A[i][n] * B[n][j]);
            }

        }
    }
    return result;
}


/* *****************************************************************************
 End of File
 */
