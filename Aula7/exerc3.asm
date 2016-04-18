;3.) Crie um programa em Assembly onde são definidas 3 posições de memória que
;representam comprimentos de segmentos de reta. Verifique se os segmentos podem formar
;um triângulo (um lado não pode ser maior que a soma dos outros dois) e retorne qual o
;tipo de triângulo formado (equilátero, isósceles ou escaleno).

SECTION .data ; data section


ladoA:      DB  5
ladoB:      DB  5
ladoC:      DB  5
erro:       DB  "Nao forma triangulo  ", 21
equilatero: DB  "Triangulo equilatero  ", 22
isosceles:  DB  "Triangulo isosceles  ", 21
escaleno:   DB  "Triangulo escaleno  ", 20

erro_len equ $ - erro
equilatero_len equ $ - equilatero
isosceles_len equ $ - isosceles
escaleno_len equ $ - escaleno

SECTION .text

global _start

;Program entry point
_start:

      ; IF (A > B+C)
      mov al, [ladoA]
      mov bl, [ladoB]
      add bl, [ladoC]
      cmp al, bl
      ja lerro

      ; IF (B > A+C)
      mov al, [ladoB]
      mov bl, [ladoA]
      add bl, [ladoC]
      cmp al, bl
      ja lerro

      ; IF (C > A+B)
      mov al, [ladoC]
      mov bl, [ladoA]
      add bl, [ladoB]
      cmp al, bl
      ja lerro

      mov bl, [ladoA]
      cmp al, bl
      je eq_iso

lescaleno: mov bl, [ladoB]
           cmp al, bl
           je lisosceles
           mov ecx, escaleno
           mov edx, escaleno_len
           jmp fim

eq_iso: mov bl, [ladoB]
        cmp al, bl
        jne lisosceles
        mov ecx, equilatero
        mov edx, equilatero_len
        jmp fim

lisosceles: mov ecx, isosceles
            mov edx, isosceles_len
            jmp fim

lerro: mov ecx, erro
       mov edx, erro_len

fim:    mov ebx,1       ;arg1, where to write , screen
        mov eax,4       ;write sysout command to int 80 hex
        int 0x80

        mov ebx, 0
        mov eax,1   ;exit command to kernel
        int 0x80    ;interrupt 80hex, call kermel
