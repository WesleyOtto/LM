;3. Escreva um programa em Assembly que:  inicialize duas posições de memória com
;conteúdo bytes, rótulos “base” e “expo” e retorne o resultado de base  expo .
;a.) Utilizando apenas somas


    SECTION .data ; data section

b:   DB    5
e:   DB    2


    SECTION .text

global _start

;Program entry point
_start:

      mov eax,1
      mov ebx,[b]
      mov ecx,[e]

loop:
      cmp cl,0 ; lopp externo deve executado sl vezes (expoente)
      je fim
      ; cada loop interno ( loopm deve multiplica o valor corrente (eax)pela base(ebx))
      ;logo, deve somar o valor corrente (eax) ebx vezes

      mov edi,0   ; valor temporario da multiplicação
      mov edx,ebx ;inicia fator 1 edx = base
                  ; fator 2 ja está inicializado (eax)

;multiplicação fator 1 x fator2

loopm:
      cmp dl,0
      je fimm
      add edi,eax
      dec dl;
      jmp loopm

fimm:
      mov eax,edi
      dec ecx
      jmp loop

fim:
      mov ebx,eax
      mov eax,1   ;exit command to kernel
      int 0x80    ;interrupt 80hex, call kermel
