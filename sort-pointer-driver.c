// Program: Pointer Array Sorter
// Author: K. Guardiano
// CWID: 886571256
// Email: kjd.guardiano@csu.fullerton.edu
// Course/Section Number: CPSC 240-3 
// Due Date/Time: October 9, 2023, 1 AM PST

#include "stdio.h"
#define _MAX_SIZE 8

// ==== Start of Function/Variable/Macro Declarations ====
double* manage();
extern double* manage(unsigned long *n);
// ==== End of Function/Variable/Macro Declarations ====
int main(int argc, char* argv[])
{
 printf("Welcome to PointerSorter.\n");
 printf("This product is maintained by Katherine Joy Guardiano at kjd.guardiano@csu.fullerton.edu\n");
 unsigned long size = 0;
 double *array = manage(&size);

 printf("The main function received this array:\n");
 for(int i = 0; i < _MAX_SIZE; i++){
  printf("%lf\n",array[i]);
 }
 printf("Please consider buying more software from our suite of commercial programs.\n");
 printf("A zero will be returned to the operating system.\nGoodbye.\n");
 return 0;
}