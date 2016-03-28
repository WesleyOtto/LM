;********************************
; Exercicio
;  R = ( a -b )* ( d + e) - f
; a=10 b=8 d=1 e=3 f=2 r=6
;********************************

SECTION .data        ;data section

a:   db  10
b:   db  8
d:   db  1
e:   db  3
f:   db  2

SECTION .text         ; code section

global _start

;Program entry point

_start:

  xor eax,eax
  mov ax,[a]
  sub ax,[b]
  mov bx,[d]
  add bx,[e]
  mul bx
  sub eax,[f] 


  mov ebx,eax
  mov eax,1       ; exit command to kernel
  int 0x80        ; interrupt 80hex, call kernel
