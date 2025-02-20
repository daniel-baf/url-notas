import os
fs = os.path.sep
line_sep = os.linesep
line_sep_win='\r\n' #CRLF

separador_lineas=line_sep_win
lineas = ['Esto'+separador_lineas,
            'es'+separador_lineas,
            'una'+separador_lineas,
            'prueba'+separador_lineas,
            'de'+separador_lineas,
            'escritura'+separador_lineas,
            'de'+separador_lineas,
            'un'+separador_lineas,
            'archivo'+separador_lineas
        ] 

# archivo = open('./Archivo2.txt', 'r') Linux/Mac (u otro basado en UNIX)
# archivo = open('.\Archivo2.txt', 'r') Windows/MS-DOS
archivo = open('.'+fs+'Archivo1.txt','a') # x, w, a
archivo.writelines(lineas)
archivo.close()