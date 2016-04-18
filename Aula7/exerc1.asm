;1.) Escreva um programa em Assembly que determine a possibilidade ou obrigatoriedade
;de voto de acordo com a idade  do eleitor:
;idade < 16
; O cidadão não pode votar!
;Idade >= 16 e idade < 18 ou idade >= 70
;O voto é facultativo.
;Idade >= 18 e idade < 70
;O cidadão é obrigado a votar.

    SECTION .data ; data section

msg1:   DB    "O cidadao nao pode votar",24
msg2:   DB    "O voto eh facultativo",21
msg3:   DB    "O cidadao eh obrigado a votar",29
adultAge:DB   18
minAge: DB    16
maxAge: DB    70
idade:  DB    65

    SECTION .text

global _start

;Program entry point
_start:

        mov al,[idade]
        mov bl,[minAge]
        cmp al,bl
        jl menor ; se idade for menor que minAge

        mov bl,[adultAge]
        cmp al,bl
        jl facultativo

        mov bl,[maxAge]
        cmp al,bl
        jae facultativo

        mov bl,[adultAge]
        cmp al,bl
        jae obrig


menor: mov ecx,msg1
       mov edx,24 ;tamanho
       jmp fim

facultativo: mov ecx,msg2
             mov edx,21 ;tamanho
             jmp fim

obrig: mov ecx,msg3
       mov edx,29 ;tamanho


fim:    mov ebx,1       ;arg1, where to write , screen
        mov eax,4       ;write sysout command to int 80 hex
        int 0x80

        mov ebx, 0
        mov eax,1   ;exit command to kernel
        int 0x80    ;interrupt 80hex, call kermel
