SECTION .data ; data section

frase: DB ' Isto é uma frase de teste '
SIZE:  EQU  27

prefixo: DB   10, 'RESULTADO: <'
sufixo:  DB   ' >',10,10

SPACE:   EQU 32
SECTION .text

global _start

;Program entry point
_start:

;***** prefixo

    mov eax, 4
    mov ebx, 1
    mov edx, 13
    mov ecx ,prefixo

; inicialização

      mov edi, frase
      add edi, SIZE
      mov esi, SIZE


loopExt:  ; lopp externo ( para cada palavra)
loop:     ; lopp interno ( ate achar proximo espaco/palavra)

    dec edi
    cmp BYTE [edi], SPACE
    jne loop

    mov ecx,edi

    ;***** exibição****************


loopshow:
          mov eax,4
          mov ebx,1
          mov edx,1
          int 0x80
          inc ecx
          dec esi
          cmp BYTE [ecx],SPACE
          jne loopshow

    ;*****************************

    ; condição de parada - fim de frase

    cmp esi,0
    jg loopExt


    ;****sufixo************

    mov eax,4
    mov ebx,1
    mov edx,1
    mov ecx, sufixo
    int 0x80

    mov eax,1   ;exit command to kernel
    int 0x80    ;interrupt 80hex, call kermel
