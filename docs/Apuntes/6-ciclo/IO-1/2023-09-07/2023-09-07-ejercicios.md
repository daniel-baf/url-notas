
# QUÉ PASA SI

## Aumenta 10% la función objetivo

10% mas en FO

```
MAX Z = 198x1 + 99x2

x1 <= 6
x2 <= 4
6x1 + 8x2 <= 48
x1, x2 >= 0
```

![[Pasted image 20230907125942.png]]

## Aumenta un 15% las restricciones

15% en LD

```
MAX Z = 180x1 + 90x2

x1 <= 6.9
x2 <= 4.6
6x1 + 8x2 <= 55.22
x1, x2 >= 0
```

![[Pasted image 20230907130102.png]]

## Disminuye un 10% las variables del lado izquierdo

10% < LI

```
MAX Z = 180x1 + 90x2

0.9x1 <= 6
0.9x2 <= 4
5.4x1 + 7.2x2 <= 48
x1, x2 >= 0
```

![[Pasted image 20230907130307.png]]


## Realizamos tanto lo del inciso 2 y 3

Disminuye 10% el LI y aumenta un 10% el LD

```
MAX Z = 180x1 + 90x2

0.9x1 <= 69
0.9x2 <= 4.6
5.4x1 + 7.2x2 <= 55.22
x1, x2 >= 0
```

![[Pasted image 20230907130431.png]]

| base | 10% > FO | 15% > LD | 10% < LI | 2 y 3 |
|-|-|-|-| - |
|x1 = 6|6|6.9|6.67|7.67|
|x2 = 1.5|1.5|1.72|1.67|1.92|
|z = $1215|$1336.5|$1397.25|$1350|$1552.50|

