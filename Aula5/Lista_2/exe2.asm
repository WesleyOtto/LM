;2. Transcreva as expressões numéricas abaixo para um programa em Assembly:
;a) X= A + (B *C) – (D * F) + G – H
;b) X=H -­ B *(­D) + (­C) * G + A
;Retorne o valor de X para o sistema operacional. Atribua às incógnitas A..H a classificação
;da respectiva letra no alfabeto. Por exemplo, o resultado da primeira expressão deve ser ­18
;e deve retornar 238 (Por quê?).

SECTION .data ; data section

A: db 1
B: db 2
C: db 3
D: db 4
E: db 5
F: db 6
G: db 7
H: db 8

SECTION .text

global _start

;Program entry point
_start:

  ;xor eax,eax ;a) X= A + (B *C) – (D * F) + G – H
  ;mov al,[B]
  ;mov bl,[C]
  ;mul bl
  ;add ax,[A]

  ;mov cx,ax

  ;mov al,[D]
  ;mov bl,[F]
  ;mul bl
  ;sub cx,ax
  ;add cx,[G]
  ;sub cx, [H]

;b) X= H -­ B *(-­D) + (­-C) * G + A

  mov al,[B]
  mov bl,[D]
  not bl
  add bl,1
  mul bl

  mov cl,[H]
  sub cl,al

  mov ax,[G]
  mov bx,[C]
  not bx
  add bx,1
  mul bx
  add ax,[A]
  add cx,ax

  mov ebx,ecx
  mov eax,1       ; exit command to kernel
  int 0x80        ; interrupt 80hex, call kernel
