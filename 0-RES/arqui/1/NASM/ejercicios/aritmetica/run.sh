echo "COMPILANDO .ASM"
nasm -f elf aritmetica.asm
echo "CREANDO OBJETO"
ld -m elf_i386 aritmetica.o -o aritmetica
echo "EJECUTANDO"
./aritmetica 
