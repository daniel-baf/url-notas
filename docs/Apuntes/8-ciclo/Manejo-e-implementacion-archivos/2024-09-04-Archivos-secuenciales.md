El problema con los archivos apilados, es que si la información es mayor a 256 bytes, ¿Cómo solucionamos para manejarlo como información de un único tipo de dato?

Los archivos secuenciales no manejan punteros, sino que avanzan hasta encontrar un separador.

| D1  | separador | D2  | separador | D3  |
| --- | --------- | --- | --------- | --- |
|     |           |     |           |     |
