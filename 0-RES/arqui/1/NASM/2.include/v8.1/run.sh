echo "COMPILANDO .ASM"
nasm -f elf hola-v8.1.asm
echo "CREANDO OBJETO"
ld -m elf_i386 hola-v8.1.o -o hola-v8.1
echo "EJECUTANDO"
./hola-v8.1 
