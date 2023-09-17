;Array Handler - Manage
;Katherine Joy Guardiano, 240-3

; ==== Code Area Start ====
global manage
extern fillarray
extern sumarray
extern display
extern scanf ;for calling the function scanf
extern printf ;for calling the function printf

segment .data
; ==== Data Declarations ====
max_size equ 8 ;8 cells in the array

; ==== Format Declarations ====

floatform db "%lf", 0 ;8-byte float format
stringform db "%s", 0 ;string format

segment .bss
nicearray resq max_size ;max_size acts as a constant

align 64
backuparea resb 832 

segment .text
; ==== Start of Code ====
manage:
; ==== Start of Backup ====
push       rbp                                              ;Save a copy of the stack base pointer
mov        rbp, rsp                                         ;We do this in order to be 100% compatible with C and C++.
push       rbx                                              ;Back up rbx
push       rcx                                              ;Back up rcx
push       rdx                                              ;Back up rdx
push       rsi                                              ;Back up rsi
push       rdi                                              ;Back up rdi
push       r8                                               ;Back up r8
push       r9                                               ;Back up r9
push       r10                                              ;Back up r10
push       r11                                              ;Back up r11
push       r12                                              ;Back up r12
push       r13                                              ;Back up r13
push       r14                                              ;Back up r14
push       r15                                              ;Back up r15
pushf                                                       ;Back up rflags
; ==== End of Backup ====

;block to call fill array
mov rax, 0
mov rsi, max_size ;gives maximum size for array
mov rdi, nicearray ;gives address of array
call fillarray
mov rbx, rax ;store num elements read in rbx

mov rdi, nicearray
mov rsi, rbx
call display


;call sumarray
ret
; ==== End of Code ====