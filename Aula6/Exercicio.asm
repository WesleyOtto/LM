; if a<b then
;       c = 3*a
; else
;       c=4*b
;return c
;**********************************************
;first cases;
; a = 3, b = 2; c=4*b=8
; a = 2; b = 3; c =3*a=6
; a =10; b =20;c =3*a=30
;a=25, b=15, c=4*b=60

SECTION .data ; data section

a:  db  25
b:  db  12
c:  db  0

vet: TIMES 4 DB 1 ; inicia o vet de quatro posições com 1


SECTION .text

global _start

;Program entry point
_start:


int 0x80

mov ebx, 0      ;exit code, 0=normal
mov eax,1       ;exit command to kernel
int 0x80        ;interrupt 80hex, call kermel
