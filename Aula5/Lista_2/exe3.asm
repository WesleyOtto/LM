;3. Considere um byte de memória identificado pelo label “var” e definido pela diretiva DB.
;a.) Escreva um programa em Assembly que calcule e retorne o complemento de 2 do
;valor contido em “var”.
;b.) Escreva um programa em Assembly que calcule e retorne o valor de var*(-­1),
;utilizando instruções de multiplicação.

SECTION .data ; data section

var: db 10  ; inicia o vet de quatro posições com 1

SECTION .text

global _start

;Program entry point
_start:

  ;mov al,[var]
  ;not al
  ;inc al

  mov al,-1
  mov bx,[var]
  mul bx


mov ebx,eax
mov eax,1       ; exit command to kernel
int 0x80        ; interrupt 80hex, call kernel
