Indiscutiblemente, siempre se quiere el 100% de la disponibilidad de datos. Pero para lograr esto es necesario invertir dinero. 
Los clientes siempre quieren lo mejor pero a un bajo costo, hay una tabla estadística que explica cuánta disponibilidad queremos en nuestro sistema.

Nota: los días significa que durante cada semana el sistema se caerá durante tiempos cortos y sumarán y caerán el tiempo especificado en los días durante todo el año.

| % | Tiempo al año de caída | tiempo en caída a la semana |
|-|-| -|
| 98 | 7.3 días| aprox. 3h 22m|
| 99.9999 | 31.5 seg | 0.6 seg |

TMEF -> tiempo medio entre fallas
TMRF -> tiempo medio de recuperación de la falla
D       -> disponibilidad

`D = TMEF / (TMEF + TMRF) ; D = disponibilidad`

# Tiempo de caída

Debemos tomar en cuenta el tiempo de caída. El tiempo que nos tome hacer que un sistema vuelva a funcionar esl el tiempo de caída.

Porcentajes de fallas

| % | Motivo |
|-|-|
| 15 | personas| 
| 40 | software |
| 5 | ambiente |
| 30 | planeados |
|10 | hardware |

# Costos y riesgos

Qué tan riesgoso es invertir o no en algo, uno de los costos con mayor importancia, es la productividad del sistema.