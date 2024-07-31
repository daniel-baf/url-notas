Para calcular el tamaño de un archivo .csv, tenemos que calcular el no. de caracteres, y por cada carácter debemos.
Si leemos un archivo, tenemos 2 tamaños, el tamaño del archivo, que es la suma de los caracteres, y el otro tamaño hace referencia a _**segmentos/sector o cluster**_, no podemos aprovechar al 100% el disco, porque estamos usando segmentos de `4KB` para cada elemento.

Si quiero calcular el tamaño del .csv en binario.

El almacenamiento tiende a ser `flash NAND`, el cual se queda inutilizada después de una cantidad de lectura y escritura. Un flash drive USB tiene memoria FLASH como soporte, y han reemplazado los `disquetes` o `cd` como medio portátil. 

Hay muchos estándares de `tarjetas de memoria`, hay que tener en cuenta la velocidad de las tarjetas. 
Los _SSD_ son más rápidos, y acceden a cualquier parte del disco duro en una complejidad 1, en cambio un disco magnético tiene una complejidad n. Estos no necesitan des-fragmentarse.