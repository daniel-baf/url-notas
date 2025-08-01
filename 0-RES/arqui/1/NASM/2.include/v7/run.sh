echo "COMPILANDO .ASM"
nasm -f elf hola-v7.asm
echo "CREANDO OBJETO"
ld -m elf_i386 hola-v7.o -o hola-v7
echo "EJECUTANDO"
./hola-v7 
