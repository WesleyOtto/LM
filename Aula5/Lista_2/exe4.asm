;4. Escreva um programa em Assembly que calcule o valor X = 5! ­- (5+4+3+2+1)

SECTION .data ; data section



SECTION .text

global _start

;Program entry point
_start:

  mov al,5
  mov bl,4
  mul bl

  mov bl,3
  mul bl

  mov bl,2
  mul bl

  xor ecx,ecx
  add cx,5
  add cx,4
  add cx,3
  add cx,2
  add cx,1

  sub ax,cx 


mov ebx,eax
mov eax,1       ; exit command to kernel
int 0x80        ; interrupt 80hex, call kernel
