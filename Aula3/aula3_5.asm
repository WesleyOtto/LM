SECTION .data        ;data section

; test : DB 'X'
msg:     DB 'AD'

SECTION .text         ; code section

global _start

;Program entry point

_start:

;mov ebx,msg
mov ebx,[msg]


mov eax,1       ; exit command to kernel
int 0x80        ; interrupt 80hex, call kernel
