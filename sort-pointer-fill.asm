;Program: Pointer Array Sorter
;Author: K. Guardiano
;CWID: 886571256
;Email: kjd.guardiano@csu.fullerton.edu
;Course/Section Number: CPSC 240-3 
;Due Date/Time: October 9, 2023, 1 AM PST

; ==== Code Area Start ====
global fillarray
extern scanf ;for calling the function scanf
extern printf ;for calling the function printf

segment .data
; ==== Data Declarations ====
receivemsg db "Number received: %lf", 10, 0
endoffillmsg db "Reached end of fill.", 10, 0

; ==== Format Declarations ====
floatform db "%lf", 0 ;8-byte float format

segment .bss
;example only
align 64
;backup resb 832
;number_input resq 8

segment .text
; ==== Start of Code ====
fillarray:
mov r14, rdi ;backs up incoming data, r14 is the array
mov r15, rsi ;r15 is # of cells

xor r13, r13 ;places a 0 within register r13, acts as index; when r13 == 15, array is full

begin:
cmp r13, r15
je done ;if r13 > r15, exit

mov rax, 0
mov rdi, floatform
push qword 0
mov rsi, rsp
call scanf
pop r8

;check for CTRL+D first, places -1 in eax
cdqe ;rax will fill with whatever is in eax, does NOT have parameters
cmp rax, -1
je done ;jumps ONLY if equal to "done"

;pop rbx ;causes a seg fault when included, for some reason?
mov [r14 + r13*8], r8 ;8 represents one cell

inc r13

jmp begin

done:
mov rax, r13 ;rax is the only register that can move an integer back to caller

ret
; ==== End of Code ====