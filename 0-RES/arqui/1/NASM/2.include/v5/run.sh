echo "COMPILANDO .ASM"
nasm -f elf hola-v4-include-1.asm
echo "CREANDO OBJETO"
ld -m elf_i386 hola-v4-include-1.o -o hola-v4-include-1
echo "EJECUTANDO"
./hola-v4-include-1