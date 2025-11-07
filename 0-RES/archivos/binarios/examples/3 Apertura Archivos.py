import os

# Propiedades específicas por OS
fs = os.path.sep
line_sep = os.linesep
print('File separator:', fs)
for caracter in line_sep:
    print('Line separator:', ord(caracter))
line_sep_win='\r\n'
for caracter in line_sep_win:
    print('Line separator:', ord(caracter))


# Apertura de un archivo
# read_file = open('./Archivo1.txt', 'r') Linux/Mac (u otro basado en UNIX)
# read_file = open('.\Archivo1.txt', 'r') Windows/MS-DOS
read_file = open('.'+fs+'Archivo2.txt','r')

lineas = read_file.readlines()
contador = 0
for linea in lineas:
    contador+=1
    print('L'+str(contador), linea)
