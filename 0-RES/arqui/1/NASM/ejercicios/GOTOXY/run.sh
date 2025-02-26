echo "COMPILANDO .ASM"
nasm -f elf gotoxy.asm
echo "CREANDO OBJETO"
ld -m elf_i386 gotoxy.o -o gotoxy
echo "EJECUTANDO"
./gotoxy 