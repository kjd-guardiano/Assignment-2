;Program: Pointer Array Sorter
;Author: K. Guardiano
;CWID: 886571256
;Email: kjd.guardiano@csu.fullerton.edu
;Course/Section Number: CPSC 240-3 
;Due Date/Time: October 9, 2023, 1 AM PST

; ==== Code Area Start ====
global display
extern scanf ;for calling the function scanf
extern printf ;for calling the function printf

segment .data
; ==== Data Declarations ====
receivemsg db "%lf", 10, 0
; both startof* and endof* are for debugging purposes
startofdisplaymsg db "Reached start of display.", 10, 0
endofdisplaymsg db "Reached end of display.", 10, 0

; ==== Format Declarations ====
floatform db "%lf", 0 ;8-byte float format

segment .bss
;example only
align 64
;backup resb 832
number_input resq 8

segment .text
; ==== Start of Code ====
display:
mov r14, rdi ;r14 is the array
mov r15, rsi ;r15 is the count of valid numbers in array

xor r13, r13 ;places a 0 within register r13, acts as index; when r13 == 15, array is full

begindisplay:
cmp r13, r15
je donedisplay ;if r13 > r15, exit

;block used for checking array filling
movsd xmm0, [r14 + r13*8]
mov rdi, receivemsg
push rax
call printf
pop rax

inc r13

jmp begindisplay

donedisplay:
mov rax, r15 ;rax is the only register that can move an integer back to caller

; for debugging purposes
mov rax, 0
mov rdi, endofdisplaymsg
push rax
call printf
pop rax

ret
; ==== End of Code ====