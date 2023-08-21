# PL - Programación lineal

Es una asignación inteligente de recursos que busca alcanzar un objetivo.
Se le llama programación lineal porque las variables están a potencia 1.

- Objetivo
	- Maximizar: 
	- Minimizar:  
- Soluciones
	- Factible: Cumple con restricciones, entendiendo restricción como un limitante, ya sea límite monetario, horarios de horas extras, de materia prima, de capacidad de producción debido a maquinaria...
	- Optimo: El caso ideal
- MODELO: se usará un modelo matemático que debe contar con 
	- Relación (signos): >= <= =
	- Operaciones
	- FORMATO: la P.L. tiene un formato
		- Función objetivo: ¿qué busco en ese problema? ¿maximizar o minimizar?, 
		- Restricciones: ¿qué restricciones tengo?
		- No negatividad: buscamos una mejora, no entorpecimiento.

## ¿Cómo obtengo una solución?

Tengo que resolver para tener una solución, la puedo resolver de las siguientes formas:

- GRÁFICA: cuando hay variables cuantificables, ej. 3 variables como x1, x2, x3 … xn
- ANALÍTICA: haciendo uso de
	- Álgebra
	- Matrices
- SOFTWARE: programa que internamente tiene un modelo, y dicho software usará sus metodologías para resolver un problema
	- EXCEL
	- SOLVER
	- WIN QSB   \[recomendado por el ingeniero\]

# EJERCICIOS
### SOLUCIONES EN VÉRTICES

0.5x1 + 0.5x2 >= 30
x1 + 5x2 >= 250
0.25x1 + 0.5x2 <= 50
x1, x2 >= 0

-> calculamos los siguientes valores igualando x1 a 0 y despejando y luego igualndo x2 a 0 y despejando de las ecuaciones

x1 =  60   x2=0   |   x1 =  0   x2 = 60
x1 = 250  x2=0   |   x1 = 0    x2 = 50
x1 = 200  x2=0   |   x1 = 0    x2 = 100

![[Pasted image 20230817122336.png]]

_**Region factible es ese espacio que contiene soluciones factibles**_
![[Pasted image 20230817122504.png]]

-> calculemos las intersecciones
SECC1
0.5x1 + 0.5x2 >= 30
x1 + 5x2 >= 250

SECC2
x1 + 5x2 >= 250
0.25x1 + 0.5x2 <=50

P1(12.5, 47.5)

P2(166.67, 16.67) <- se calcula resolviendo los sistemas de ecuaciones

![[Pasted image 20230817123102.png]]

## EJERCICIO 2

Maximizar `z = 5x + 5x2`
S.A. (_sujeto a_)
	`x1 <= 100`
	`x2 <= 80`

`2x1 + 4x2 <= 400`

`x1, x2 >= 0` <- no negatividad


x1 = 200  x2 = 0
x1 = 0      x2 = 100

![[Pasted image 20230817124521.png]]

Z(0,0)       =   5(0) + 5(0)   =           0 | esto es una solución factible pero no óptima
Z(0,80)     =   5(0) + 5(80) =       400 | es factible y mayor que 0
Z(100,50) =   5(100) + 5(50) =   750 | es factible y mayor que 0
Z(100,0)   =   500
Z(40,80)   =   600


Como el mayor valor es `750` entonces la solución óptima es de 100,50.

### TRABAJO EN CLASE 

Resuelva en forma de
a. Gráfica
b. solución de vértices
c. solución óptima

Maximizar `X = 5x + 2x2`
S.A.
`x1 - 2x2 <= 420`
`2x + 3x2 <= 610`
`6x - x2 <= 125`

`x1, x2 >= 0`

,



