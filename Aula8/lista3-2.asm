; Exercicio l3 -2 -- Fatorial Soma aritimetica


    SECTION .data ; data section

param:   DB    3


    SECTION .text

global _start

;Program entry point
_start:

      mov cl,0 ; contador
      mov bl,0 ; soma
      mov al,1 ;Fatorial

count: inc cl
       and bl,cl
       mul cl
       cmp cl,[param]
       jne count

       xchg al,bl
       sub bl,al

        mov eax,1   ;exit command to kernel
        int 0x80    ;interrupt 80hex, call kermel
