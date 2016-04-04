; Exe2

    SECTION .data ; data section

vet: TIMES 4 DB 1 ; inicia o vet de quatro posições com 1


   SECTION .text

   global _start

   ;Program entry point
   _start:

    mov eax,vet
    mov byte [eax],1 ; coloca-se byte para especificar o tamanho do imediato
    add byte [eax],48 ;asc eh sequencial, soma 48 para mostrar o asc do 1 ( 49)
    inc eax   ; anda uma pos do vet
    mov byte [eax],2
    add byte [eax],48
    inc eax
    mov byte [eax],4
    add byte [eax],48
    inc eax
    mov byte [eax],8
    add byte [eax],48

    mov edx,4       ;TAMANHO DA STRING
    mov ecx,vet     ;O QUE VAI SER ESCRITO
    mov ebx,1       ;CODIGO DA ONDE VAI SER ESCRITO (1TELA)
    mov eax,4       ;write sysout command to int 80 hex
    int 0x80

    mov ebx, 0      ;exit code, 0=normal
    mov eax,1       ;exit command to kernel
    int 0x80        ;interrupt 80hex, call kermel
