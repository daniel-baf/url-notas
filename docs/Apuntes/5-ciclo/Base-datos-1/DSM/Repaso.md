TABLA / ENTIDAD

TABLA 1
|A1|A2|
|-----|--|
|a|b|
|c| d|

TABLA
- Atributos = A1, A2
- Tuplas
	- Valores que contiene
		- T1: a, b
		- T2: c, d

TIPOS DE TABLAS
- Fuerte: tiene control sobre la complementaria
- Debil: Depende de la fuerte

EJ:
USUARIO     [FUERTE]
CONTACTO [DEBIL]

TIPOS DE RELACIONES
- 1:1
- 1:N
- N:M

EJ2:
PERSONA              [DEBIL]
DEPARTAMENTO  [FUERTE]

DSM
SELECT

N: tabla1
|A1 (PK)|A2| A6|
|-----|--|--|
|a|b| x|
|c| d| y|

SELECT \<BUCAMOS\> FROM \<TABLA\> \[TAG\]

SELECT \<BUCAMOS\> FROM \<TABLA\> 
SELECT * FROM tabla1

|A1 (PK)|A2| A6|
|-----|--|--|
|a|b| x|
|c| d| y|


SELECT \<BUCAMOS\> FROM \<TABLA\> \[TAG\]
SELECT t1.* FROM tabla1 AS t1
- tabla1 = t1
|A1 (PK)|A2| A6|
|-----|--|--|
|a|b| x|
|c| d| y|

SELECT \<BUCAMOS\> FROM \<TABLA\> \[TAG\]
SELECT t1.A1 FROM tabla1 AS t1
|A1 (PK)|A2|
|-----|--|
|a||
|c| |

SELECT \<BUCAMOS\> FROM \<TABLA\> 
SELECT t1.A1, t1.A2, t1.A6 FROM tabla1_de_productos AS t1


VARIANTES
SELECT <\BUSCAMOS\> FROM \<DONDE\> \[TAG\] \<CONDICIONALES\>

SELECT <\BUSCAMOS\> \<ALIAS BUSQUEDA\> FROM \<DONDE\> \[TAG\] \<CONDICIONALES\>

CONDICIONALES

SELECT t1.atributo_largo_p AS `attr1`, t1.attr2 FROM tabla1 AS t1 
	WHERE t1.att1 = 8
	AND (t1.atributo_largo_p is not NULL);

SELECT \*, COUNT(tabla1.attr1) tabla1 
	GROUP BY (tabla1.attr1)

SELECT \*, COUNT(tabla1.attr1) tabla1 
	GROUP BY (tabla1.attr1)
		WHERE 

JOIN
- JOIN
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN

TABLA 1
| A1  (pk)|  A2 |  A3 |
|-|-|-|
| 1 | a | z|
| 2 | x | a|

TABLA 2
| a1  (pk)|  a2 (fk tabla1) |
|-|-|
| x | 1 | 
| j | 2 | 

INNER JOIN T1, T2
1. busca todas las tupas de T1
2. Busca en comun de T2 con T1
3. Une T2 con T1 y muestra solo lo que tienen en comun

RIGHT JOIN T1, T2
1. 