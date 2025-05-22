echo "COMPILANDO .ASM"
nasm -f elf contadoriprint.asm
echo "CREANDO OBJETO"
ld -m elf_i386 contadoriprint.o -o contadoriprint
echo "EJECUTANDO"
./contadoriprint 
