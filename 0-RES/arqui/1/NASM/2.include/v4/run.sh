echo "COMPILANDO .ASM"
nasm -f elf hola-v4-include.asm
echo "CREANDO OBJETO"
ld -m elf_i386 hola-v4-include.o -o hola-v4-include
echo "EJECUTANDO"
./hola-v4-include