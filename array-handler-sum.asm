;Array Handler - Sum
;Katherine Joy Guardiano, 240-3

; ==== Code Area Start ====
global sumarray
extern scanf ;for calling the function scanf
extern printf ;for calling the function printf

segment .data
; ==== Message Declarations ====
startmsg db "Successfully reached start of sum section.", 10, 0
endmsg db "Successfully reached end of sum section.", 10, 0
;decmsg db "r13 is currently %lf.", 10, 0
totalmsg db "Current total is %lf.", 10, 0
loopmsg db "Reached loop of sum section.", 10, 0
checkmsg db "r13 is current %lf.", 10, 0

; ==== Format Declarations ====

floatform db "%lf", 0 ;8-byte float format
stringform db "%s", 0 ;string format

segment .bss
align 64
number_input resq 8
backuparea resb 832


segment .text
; ==== Start of Code ====
sumarray:
mov r14, rdi ;r14 is the array
mov r15, rsi ;r15 is the count of valid numbers in array

mov rdi, startmsg
push rax
call printf
pop rax

xor r13, r13 ;r13 as index

sumstart:
cmp r13, r15
jge sumdone ;jumps ONLY if equal to "done"

mov rdi, loopmsg
push rax
call printf
pop rax

; [TODO] addition here
addsd xmm15, [r14 + 8*r13]
; [TODO] addition here
inc r13
jmp sumstart

sumdone:
movsd xmm0, xmm15

mov rdi, totalmsg
push rax
call printf
pop rax

mov rdi, endmsg
push rax
call printf
pop rax

ret
; ==== End of Code ====