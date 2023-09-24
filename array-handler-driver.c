// Assignment 2
// Katherine Joy Guardiano
// CS-240-3

#include "stdio.h"
#define _MAX_SIZE 8

// ==== Start of Function/Variable/Macro Declarations ====

double manage();
extern double manage();
double sum;
double * array;

// ==== End of Function/Variable/Macro Declarations ====

int main(int argc, char* argv[])
{
 printf("Welcome to the Array Management System.\n");
 printf("This product is maintained by Katherine Joy Guardiano at kjd.guardiano@csu.fullerton.edu\n");
 sum = manage();
 //printf("The main function received this array:\n");
 //for(int i = 0; i < _MAX_SIZE; i++){
 // printf("%lf\n",array[i]);
 //}
 printf("The main function received this sum: %lf\n", sum);
 printf("Please consider buying more software from our suite of commercial programs.\n");
 printf("A zero will be returned to the operating system.\nGoodbye.\n");
 // use the below printf for actual completion
 //printf("The main function received this array:\n");
 return 0;
}