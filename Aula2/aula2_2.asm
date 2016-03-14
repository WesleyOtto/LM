; **************************************
;         Primeiro exemplo de Programa
;**************************************

    section .test

    global _start

; Program entry point

    _start:

    mov ebx, 15

    mov eax, 1
    int 0x80
