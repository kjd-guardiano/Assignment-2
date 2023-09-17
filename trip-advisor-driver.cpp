// Assignment 1
// Katherine Joy Guardiano
// Course # 240-3

// 

#include <stdio.h>
#include <iostream>
using namespace std;

// needs name of functions to be called
extern "C" double lasvegas();

int main(){

    // needed variables for asm
    double final_speed = 0.0;
    //needed variables for constants
    //double total_distance = 253.5;
    printf("Welcome to Trip Advisor by Katherine Joy Guardiano.\nWe help you plan your trip.\n");
    final_speed = lasvegas();
    printf("The main module received this number %lf and will keep it for a while.\nA zero will be sent to your operating system.\n", final_speed);
    printf("Good-bye. Have a great trip.\n");
    return 0;
}