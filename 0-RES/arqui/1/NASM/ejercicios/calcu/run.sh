echo "COMPILANDO .ASM"
nasm -f elf Calculadora.asm
echo "CREANDO OBJETO"
ld -m elf_i386 Calculadora.o -o Calculadora
echo "EJECUTANDO"
./Calculadora 