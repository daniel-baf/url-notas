echo "COMPILANDO .ASM"
nasm -f elf espansi.asm
echo "CREANDO OBJETO"
ld -m elf_i386 espansi.o -o espansi
echo "EJECUTANDO"
./espansi 