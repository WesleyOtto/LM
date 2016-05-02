; Exercicio L3 -4b -- exp simples


    SECTION .data ; data section

b:   DB    2
e:   DB    4


    SECTION .text

global _start

;Program entry point
_start:

      mov eax,1
      mov ebx,[b]
      mov ecx,[e]
loop:
      cmp cl,0
      je fim
      mul ebx
      dec ecx
      jmp loop

fim:
      mov ebx,eax
      mov eax,1   ;exit command to kernel
      int 0x80    ;interrupt 80hex, call kermel
