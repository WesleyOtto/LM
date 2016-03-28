;********************************
; Exercicio
;  R = F + (A * E) - (D * B)
; a=10 b=8 d=1 e=3 f=2 r=24
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
  mov bx,[e]
  mul bx
  add eax,[f]

  mov ecx,eax

  mov ax,[d]
  mov bx,[b]
  mul bx
  sub ecx,eax

  mov ebx,ecx
  mov eax,1       ; exit command to kernel
  int 0x80        ; interrupt 80hex, call kernel
