#!/bin/bash

#Program: Array Manager
#Author: K. Guardiano

#Delete some un-needed files
rm *.o
rm *.out

#NOTE: Replace all of these names at a later date!:
#C-based File (change compiler type as well!) - trip-advisor-driver
#Assembly File - trip-advisor

echo "Compile main file sort-pointer-driver.c"
gcc -c -m64 -Wall -fno-pie -no-pie -o sort-pointer-driver.o sort-pointer-driver.c -std=c17

echo "Assemble sort-pointer-manage.asm"
nasm -f elf64 -l sort-pointer-manage.lis -o sort-pointer-manage.o sort-pointer-manage.asm

echo "Assemble sort-pointer-fill.asm"
nasm -f elf64 -l sort-pointer-fill.lis -o sort-pointer-fill.o sort-pointer-fill.asm

echo "Assemble sort-pointer-display.asm"
nasm -f elf64 -l sort-pointer-display.lis -o sort-pointer-display.o sort-pointer-display.asm

echo "Link the object files using the gcc linker standard 2017"
gcc -m64 -no-pie -o sort-pointer.out -std=c17 sort-pointer-driver.o sort-pointer-manage.o sort-pointer-fill.o sort-pointer-display.o sort-pointer-sum.o #-fno-pie -no-pie

echo "Run the program Array Management:"
./sort-pointer.out

echo "The script file will terminate"