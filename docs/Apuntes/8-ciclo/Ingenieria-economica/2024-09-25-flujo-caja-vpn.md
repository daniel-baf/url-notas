Son indicadores de selección y ordenamiento de alternativas de inversion.

Los indicadores pueden ser
- Valor presente neto
- Tasa interna de retorno
-  Relacion costo/beneficio
- Costo anual equivalente
- Periodo de pago (paycheck)


EL FACTOR QUE NOS DICE SI DEBEMOS SELECCIONAR UN PLAN O SOLAMENTE ORDENARLO ES **CUANDO LA EMPRESA O PERSONA INVERSIONISTA NOS DAN UN PARÁMETRO** ESPECIFICO (EJEMPLO CUANDO NOS PIDEN UN RETORNO MÍNIMO)

Tratamos de igualar las cifras para poder tomar decisiones.

Aunque todos los indicadores tienen el mismo propósito, se debe observar que son complementario entre si.
Aunque todos llevan una misma respuesta, cada uno lo hace con técnicas diferentes y con variables distintas.

# Valor presente neto

Es el valor de la moneda hoy, t = 0, que se obtiene al sumar todos los flujos positivos y negativos asociados a un proyecto de inversion.

Se necesita ademas un una tasa de interes.

## Diagrama de flujo efectivo de un VPN

NO es un flujo constante, cada mes puede ser distinto.

```
							|
			|		|		|
	|	|	|	|	|	|	|	|
-------------------------------------------------------
|

```

$$
VPN(TD=i\%)= -X_0 + \frac{x_1}{(1+i)^1}+\frac{x_1}{(1+i)^2}...
$$

$$
VPN(TD=i\%)= \sum_{i=0}^{n}{a\frac{x_i}{(1+i\%)^n}}
$$


### EJEMPLO

Suponga un proyecto con el flujo de caja esperado, se presentan 3 alternativas de inversion.

TD = 5%, 9%, 15% por periodo

_**TD SIGNIFICA TASA DE DESCUENTO, INTERES, O TASA DE INTERES DE OPORTUNIDAD**_

| FC 0     | FC 1  | FC 2  | FC 3  | FC 4    |
| -------- | ----- | ----- | ----- | ------- |
| -1000000 | 90000 | 90000 | 90000 | 1090000 |
$$
VPN(TD=i\%)= \sum_{i=0}^{n}{a\frac{x_i}{(1+i\%)^n}}
$$
$$
VPN(TD=i\%)_{5\%}= -1000000 +\frac{90000}{(1+0.05)^1}+\frac{90000}{(1+0.05)^2}+\frac{90000}{(1+0.05)^3} +\frac{1090000}{(1+0.05)^4}
$$
$$
VPN(TD=i\%)_{5\%}= 141829
$$
$$
VPN(TD=i\%)_{9\%}= 0
$$
$$
VPN(TD=i\%)_{15\%}= -171298.70
$$

__ELEGIMOS LA OPCIÓN A POR TENER UN VPN MAYOR__

#### OBSERVACIONES

Es una funcion directa, estamos comparando el FC esperado con la tasa de descuento
- A mayor flujo de caja, mayor VPN
- A mayor tasa de interes
- El VPN debe ser 
	- En principio positivo
	- Igual a 0
	- Negativo

$$
VP_n = \frac{FE}{i} *\left[1 - \frac{1}{(1+i)^n}\right]
$$