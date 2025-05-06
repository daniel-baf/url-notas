echo    "-------- FILE: word --------"

echo    "-------- BORRANDO ARCHIVOS VIEJOS --------"
rm -rf  *.pas *.o *.e

echo    "-------- GENERANDO TOKENS --------"
plex    wordlex.l
fpc     wordlex.pas
./wordlex