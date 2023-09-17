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
decmsg db "r13 is currently %lf.", 10, 0
totalmsg db "Current total is %lf.", 10, 0

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
; ==== Start of Backup ====
;push       rbp                                              ;Save a copy of the stack base pointer
;mov        rbp, rsp                                         ;We do this in order to be 100% compatible with C and C++.
;push       rbx                                              ;Back up rbx
;push       rcx                                              ;Back up rcx
;push       rdx                                              ;Back up rdx
;push       rsi                                              ;Back up rsi
;push       rdi                                              ;Back up rdi
;push       r8                                               ;Back up r8
;push       r9                                               ;Back up r9
;push       r10                                              ;Back up r10
;push       r11                                              ;Back up r11
;push       r12                                              ;Back up r12
;push       r13                                              ;Back up r13
;push       r14                                              ;Back up r14
;push       r15                                              ;Back up r15
;pushf                                                       ;Back up rflags
; ==== End of Backup ====
mov r14, rdi ;r14 is the array
mov r15, rsi ;r15 is the count of valid numbers in array

mov rax, 0
mov rdi, startmsg
push rax
call printf
pop rax

mov [number_input], r14
mov rcx, number_input ;to point to current element
mov rdx, 0 ;to store sum

sumstart:
cmp r13, -1
je sumdone ;jumps ONLY if equal to "done"


; [TODO] addition here
movsd xmm0, [r14 + r13*8]
add rdx, rcx
; [TODO] addition here

dec r13

mov rax, rdx
mov rdi, totalmsg
push rdx
call printf
pop rdx
jmp sumstart

sumdone:
mov rax, 0
mov rdi, endmsg
push rax
call printf
pop rax

; ==== End of Code ====
ret