#!/bin/bash

#Program: Array Manager
#Author: K. Guardiano

#Delete some un-needed files
rm *.o
rm *.out

#NOTE: Replace all of these names at a later date!:
#C-based File (change compiler type as well!) - trip-advisor-driver
#Assembly File - trip-advisor

echo "Compile main file array-handler-driver.c"
gcc -c -m64 -Wall -fno-pie -no-pie -o array-handler-driver.o array-handler-driver.c -std=c17

echo "Assemble array-handler-manage.asm"
nasm -f elf64 -l array-handler-manage.lis -o array-handler-manage.o array-handler-manage.asm

echo "Assemble array-handler-fill.asm"
nasm -f elf64 -l array-handler-fill.lis -o array-handler-fill.o array-handler-fill.asm

echo "Assemble array-handler-sum.asm"
nasm -f elf64 -l array-handler-sum.lis -o array-handler-sum.o array-handler-sum.asm

echo "Assemble array-handler-display.asm"
nasm -f elf64 -l array-handler-display.lis -o array-handler-display.o array-handler-display.asm

echo "Link the object files using the gcc linker standard 2017"
gcc -m64 -no-pie -o array-handler.out -std=c17 array-handler-driver.o array-handler-manage.o array-handler-fill.o array-handler-display.o array-handler-sum.o #-fno-pie -no-pie

echo "Run the program Array Management:"
./array-handler.out

echo "The script file will terminate"