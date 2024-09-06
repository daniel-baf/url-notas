Funcionan de la misma forma que una pila. 

Si tenemos un archivo normal, vamos leyendo bytes por byte se almacena de la siguiente forma

| L1  | LEN           | L2  | LEN             | L3  | LEN            |
| --- | ------------- | --- | --------------- | --- | -------------- |
| 7   | 7 Bytes carne | 15  | 15 bytes apell. | 7   | 7 Bytes nombre |

Los archivos apilados van guardando en ese orden, longitud -> bytes reservados.

El problema de este tipo de archivos, es que tenemos que recorrer todo el archivo para llegar al ultimo, es decir, tiene una complejidad

$$
	O_n = N
$$

Usamos punteros para manejar este tipo de archivo.