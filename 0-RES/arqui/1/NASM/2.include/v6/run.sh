echo "COMPILANDO .ASM"
nasm -f elf hola-v6.asm
echo "CREANDO OBJETO"
ld -m elf_i386 hola-v6.o -o hola-v6
echo "EJECUTANDO"
./hola-v6 
echo "EJECUTANDO 2"
./hola-v6 pato con helado
echo "EJECUTANDO 3"
./hola-v6 "quiero comer un helado" "con otro" elemento