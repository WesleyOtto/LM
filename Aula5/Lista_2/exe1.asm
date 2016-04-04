; Exe1. Escreva um programa em Assembly que declare uma estrutura de memória de 4 posições
;inicializando­as com o valor 1. Em seguida, realize as seguintes transferências de memória:
;• Valor 2 para a segunda posição da estrutura;
;• Valor 4 para a terceira posição da estrutura;
;• Valor 8 para a última posição da estrutura.
;Retorne como saída do programa a soma de todas as posições do vetor.
;Utilize as intruções INC e ADD.

    SECTION .data ; data section

vet: TIMES 4 DB 1 ; inicia o vet de quatro posições com 1

   SECTION .text

   global _start

   ;Program entry point
   _start:

    xor ebx, ebx
    mov eax,vet
    mov byte [eax],1 ; coloca-se byte para especificar o tamanho do imediato
    inc eax   ; anda uma pos do vet
    mov byte [eax],2
    inc eax
    mov byte [eax],4
    inc eax
    mov byte [eax],8

    mov eax,vet ;volta para a primeira posicao (voltei para o vet[0])
    mov bx, 0
    add bx,[eax]
    inc eax
    add bx,[eax]
    inc eax
    add bx,[eax]
    inc eax
    add bx,[eax]

    mov eax,1       ; exit command to kernel
    int 0x80        ; interrupt 80hex, call kernel
