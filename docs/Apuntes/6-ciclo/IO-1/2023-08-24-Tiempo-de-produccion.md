# EJERCICIO 1

ESTANDAR    X1
LUJO             X2

MAX Z = 10x1 + 9x2

S.A.

CONT T |  0.7x1 + x2        <= 630
COST     |  0.5x1 + 0.83x2 <= 600
TERM     |  x1 + 0.67x2     <= 708
INSP. E   | 0.1x1 + 0.25x2 <= 135
x1, x2 >= 0

![[Pasted image 20230824123425.png]]

a) 
xi = ?
x2 = ?


x1 = 538.42 bolsas estándar 
x2 = 253.11 bolsas de lujo

b)
z = ?

z = 7662.15

c) 

| | PROGRAMAR | HOLGURA |
|-|-|-|
|CONT | | |
|COST | | |
|TERM | | |
|INSP | | |

| | PROGRAMAR | HOLGURA |
|-|-|-|
|CONT | 630| 0|
|COST |479.29 | 120.71|
|TERM | 708| 0|
|INSP |117.12 | 17.88|

Dando como resultado una holgura total de `138.59`

`La estandarización de un proceso implica tener estudios contantes y recrear`

d)

Al tipo de trabajo donde se tiene que fraccionar se le llama "especialización", en el area de producción hay especialidades, algunos hacen x tarea y otros "z" tarea. 

La _diversificación de trabajo_ sirve para atajar cuando hay "excedente de trabajos", un departamento ayuda a otros. Ampliar donde no hay holgura. 
Es por esto que en algunos requerimientos al aplicar a un trabajo se coloca la cualidad "colaborativo". Si la producción tiene cierto límite y excedo el límite, puedo tener comisión por excedente. 

# EJERCICIO 2

![[Pasted image 20230824124738.png]]

MADERA.    = X1
ALUMINIO  = X2

Z = 180x1 + 90x2

S.A.

MARCO MADERA   x1 <= 6
MARCO ALUMINIO x2 <= 4
6x1 + 8x2 <= 48

x1, x2 >= 0


![[Pasted image 20230824130257.png]]


x1 = 6
x2 = 1.5
Z = 1215

| | PROGRAMAR | HOLGURA |
|-|-|-|
| MARCO MADERA | 6| 0|
|MARCO ALUMINIO | 4| 2.50|
|PIES VIDRIO| 48| 0|

No podemos hacer 1.5 ventanas, podemos sugerir que se hagan 2, pero al hacer 2 tendremos un excedente con la produccion de vidrio, así que el tiempo restante (de 2 a 4), ayudaría a producir más vidrio.

b) 

![[Pasted image 20230824124808.png]]

Z = 120x1 + 90x2

![[Pasted image 20230824131359.png]]

c) MAX z = 60x1 + 90x2

![[Pasted image 20230824131443.png]]

# EJERCICIO 3

![[Pasted image 20230824131545.png]]

2 productos
2 materiales (metal y componentes eléctricos)

producto 1 = x1
producto 2 = x2

Z = x1 + 2x2

S.A.
								 x2 <= 60
		metal:   1x1 + 3x2 <= 200
comp.elec.:    2x1 + xx2 <= 300

x1, x2 >= 0