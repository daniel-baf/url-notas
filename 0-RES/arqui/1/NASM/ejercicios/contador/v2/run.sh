echo "COMPILANDO .ASM"
nasm -f elf contadorStr.asm
echo "CREANDO OBJETO"
ld -m elf_i386 contadorStr.o -o contadorStr
echo "EJECUTANDO"
./contadorStr 
