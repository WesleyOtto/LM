; {
;    int vetor[10] = {10,9,8,7,6,5,4,3,2,1};
;    int tamanho = 10;
;    int aux;
;    for(int i=tamanho-1; i >= 1; i--)
;    {
;        for( int j=0; j < i ; j++)
;        {
;            if(vetor[j]>vetor[j+1])
;            {
;                aux = vetor[j];
;                vetor[j] = vetor[j+1];
;                vetor[j+1] = aux;
;            }
;        }
;    }
;
;    for( int r = 0; r < 10; ++r)
;    {
;        printf("%d\n",vetor[r]);
;    }

    SECTION .data ; data section

array:   db    9,8,7,6,5,4,3,2,1,0
SIZE  EQU 10

    SECTION .text

global _start

;Program entry point
_start:

        xor ecx, ecx ;i
        xor edx,edx  ;j
        mov ecx, SIZE



loop_i:   dec ecx ;
          cmp ecx,1
          jl fim

    lopp_j:
            mov al,[edx]
            cmp al,[ecx]
            jae loop_i ; j >= i
            mov bx,[array+EDX] ; bx[j]
            inc edx
            mov ax,[array+EDX] ; ax[j+1]
            cmp bx,ax
            ja swap , ;bx[j] > ax[j+1]


swap:
            mov [array+EDX],bx ; ax[j+1] = bx[j]
            dec edx
            mov [array+EDX],ax ; bx[j] = ax[j+1]

            jmp lopp_j

fim:
        mov ebx,array
        mov eax,1   ;exit command to kernel
        int 0x80    ;interrupt 80hex, call kermel
