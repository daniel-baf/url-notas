-debug
-**a100**
	INICIA EL PROGRAMA DEBUG en la linea 100

-**h <DIR_MEM_FIN> <DIR_MEM_INI>**
	Devuelve el espacio que ocupa nuestro programa, suma <MEM_FIN> con <MEM_INI>
	y devuelve la suma y resta

-**n \<NAME>\.\<EXTENSION\>**
	Nombra un archivo
-**rcx \<SIZE\>**
	Guardar el archivo, solicita el espacio
-**w**
	Guarda los cambios

-**n \<FILE_NAME\>.\<EXTENSION\>**
-**l**
**-u \<DIR_INICIO\> \<DIR_FIN\>**
	DESENSAMBLA, si no conozco el inicio y fin tenemos que usar el tama;o del 
	archivo

-**e \<MEM_POS\>**
	Indica que se va guardar un dato en espacio de memoria


NOTA: USAR $ como caracter de fin de cadena
	LF	line feed	\[10\]
	CR	car return	\[13\]

EJ para imprimir "Hola arqui II"
	-> 13 caracteres + 1 caracter de fin de cadena
	-> 13 + LF + CR
		-> 16 caracteres de espacio de memoria

	en [100] esta el inicio pero no podemos iniciar el valor del caracter en [100] porque va creer que es una instruccion
	Asi que [100] deberia ser un <JUMP_TO>

	100 + <SIZE> + <SIZE_1ST_JUMP>
		-> 114

	JMP 114
	-e 'Hola arqui II' 0d 0a '$' ; 0d = LF 0a = CR, si quiero imprimir "'" debo usar el 0x (ejemplo) que corresponde a "'"
	
	-a114
		-> IMPRIMIR 24 VECES EL MENSAJE 'Hola arqui II' guardado en memoria 102
		-> STDOUT = salida estandar, pantalla
		-> STDIN = entrada estandar, teclado

Podemos ver ejemplos de los códigos aquí
![[CICLOS.odt]]
