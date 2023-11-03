echo    "-------- FILE: VYSE --------"

echo    "-------- BORRANDO ARCHIVOS VIEJOS --------"
rm -rf  *.pas *.o *.e

echo    "-------- GENERANDO TOKENS --------"
plex    VYSElex.l
echo    "-------- GENERANDO PARSER --------"
pyacc   VYSEyac.y
echo    "-------- GENERANDO EXE --------"
fpc     -oVYSEyac.e VYSEyac.pas
echo    "-------- CORRIENDO EXE --------"
./VYSEyac.e