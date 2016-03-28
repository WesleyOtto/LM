;********************************
; Multiplicação -- IMUL
;********************************

SECTION .data        ;data section

var1:   db  10h
var2:   db  0xff


SECTION .text         ; code section

global _start

;Program entry point

_start:

  mov ax,[var1]
  mov bx,[var2]
  imul bx  ; ax * bx


  mov ebx,eax
  mov eax,1       ; exit command to kernel
  int 0x80        ; interrupt 80hex, call kernel
