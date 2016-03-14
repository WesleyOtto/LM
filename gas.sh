program=$1
as -o $program.o $program.s
ld -o $program $program.o
echo "Processo efetuado com sucesso"
