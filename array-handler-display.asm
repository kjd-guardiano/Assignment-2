;Array Handler - Display
;Katherine Joy Guardiano, 240-3

; ==== Code Area Start ====
global display
extern scanf ;for calling the function scanf
extern printf ;for calling the function printf

segment .data
; ==== Data Declarations ====
msg db "Enter float numbers separated by white space. After last number, enter white space followed by CTRL+D.", 10, 0
receivemsg db "Number received: %lf", 10, 0
startofdisplaymsg db "Reached start of display.", 10, 0
endofdisplaymsg db "Reached end of display.", 10, 0

; ==== Format Declarations ====
floatform db "%lf", 0 ;8-byte float format

segment .bss
;example only
align 64
;backup resb 832
;number_input resq 8

segment .text
; ==== Start of Code ====
display:
mov r14, rdi ;r14 is the array
mov r15, rsi ;r15 is the count of valid numbers in array

mov rdi, startofdisplaymsg
push rax
call printf
pop rax

xor r13, r13 ;places a 0 within register r13, acts as index; when r13 == 15, array is full

begindisplay:
cmp r13, r15
je donedisplay ;if r13 > r15, exit

;block used for checking array filling
mov rax, [r14 + r13*8]
mov rdi, receivemsg
push rax
call printf
pop rax

inc r13

jmp begindisplay

donedisplay:
mov rax, r14 ;rax is the only register that can move an integer back to caller

mov rax, 0
mov rdi, endofdisplaymsg
push rax
call printf
pop rax

ret

; ==== End of Code ====