echo    "-------- FILE: arith --------"

echo    "-------- BORRANDO ARCHIVOS VIEJOS --------"
rm -rf  *.pas *.o *.e

echo    "-------- GENERANDO TOKENS --------"
plex    arithlex.l
echo    "-------- GENERANDO PARSER --------"
pyacc   arithyac.y
echo    "-------- GENERANDO EXE --------"
fpc     -oarithyac.e arithyac.pas
echo    "-------- CORRIENDO EXE --------"
./arithyac.e