;2.) Um determinado parâmetro x somente é válido for igual a zero ou estiver dentro de dois
;intervalos pré­definidos. Por exemplo, entre 50 e 100 ou entre 150 e 200.
;Escreva um programa em Assembly capaz de verificar se o parâmetro x tem um valor
;válido

SECTION .data ; data section

msg1:   DB    "Parametro Valido  ",18
msg2:   DB    "Parametro invalido  ",20
below1: DB     50
above1: DB     100
below2: DB     150
above2: DB     200
num:    DB     1000

SECTION .text

global _start

;Program entry point
_start:
       mov al,[num]
       xor bl,bl
       cmp al,bl
       je valido

       mov bl,[below1]
       cmp al,bl
       jb invalido

       mov bl,[above1]
       cmp al,bl
       jbe valido

       mov bl,[below2]
       cmp al,bl
       jb invalido

       mov bl,[above2]
       cmp al,bl
       jbe valido

invalido: mov ecx,msg2
          mov edx,20
          jmp fim

valido: mov ecx,msg1
        mov edx,18 ;tamanho

fim:    mov ebx,1       ;arg1, where to write , screen
        mov eax,4       ;write sysout command to int 80 hex
        int 0x80

        mov ebx, 0
        mov eax,1   ;exit command to kernel
        int 0x80    ;interrupt 80hex, call kermel
