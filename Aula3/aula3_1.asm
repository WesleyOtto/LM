      SECTION .data        ;data section

char:   db 'A' ; the string to print
;char   db 0x41; the string to print
;char   db 41h; the string to print
;char   db 65; the string to print


      SECTION .text         ; code section

    global_start

;Program entry point

    _start:

    mov edx,1       ;
    mov ebx,1       ; arg1, where to write, screen
    mov ecx,char    ; arg2 pointer to string 
    mov eax,4       ; write syout command to int 80 hex
    int 0x40        ; interrupt 80 hex, call kernel

    mov ebx,0       ; exit code, 0 = normal
    mov eax,1       ; exit command to kernel
    int 0x80        ; interrupt 80hex, call kernel
