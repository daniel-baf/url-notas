asasLas lecturas repetibles permiten lecturas fantasmas
Las lecturas comprometidas permite lecturas no repetibles
Lecturas no comprometidas es el nivel mas bao de aislamiento (lectura sucias)
Serializable: todas las transacciones se ejecutan 1 tras otra.

Para poder visualizar el nivel de aislamiento.

`SHOW VARIABLE LIKE 'txt_isolation'`

Como cambiar el nivel de aislamiento

SET {GLOBAL | SESSION} TRANSACTION ISOLATION LEVEL {}

## Lectura fantasma

Son datos que aparecen pero luego dejan de aparecer. 

## Lectura no repetible

Es la consulta en la que no aparecen los mismo datos en todo momento. 