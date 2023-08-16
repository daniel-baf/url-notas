# Niveles de aislamiento en la BD

El aislamiento determina cómo la integridad de una transacción es visible para otros usuarios y sistemas. Un nivel de aislamiento más baja aumenta la capacidad de muchos. 
Un nivel de aislamiento más bajo aumenta la capacidad de muchos usuarios para acceder a los mismos datos al mismo tiempo, pero aumenta el número de efectos de simultaneidad (lecturas sucias o actualizaciones perdidas) que pueden encontrar los usurarios. Por lo contrario, un nivel de aislamiento alto reduce los tipos de efectos de simultaneidad que pueden encontrar los usuarios, pero requiere más recursos del sistema y aumenta las posibilidades de que una transacción bloquee otra.

El aislamiento define típicamente a nivel de BD el cómo o cuándo los cambios realizados por una operación se vuelven visibles para otras.

- En los sistemas de un solo nivel se pueden usar alternativas como tablas temporales. 
- En los sistemas de dos niveles, se requiere un administrador de procesamiento de transacciones (TP) para mantener el aislamiento. 
- En los sistemas de n niveles (como sitios web intentando reservar el último asientos del cine), se requiere de una combinación de procedimientos almacenados y gestión de transacciones para confirmar la reserva y enviar la confirmación al cliente.

El aislamiento es una de las cuatro propiedades del ACID, junto con la 
atomicidad, consistencia y durabilidad.

Podemos resumir los niveles de la siguiente forma

| Nivel de aislamiento | Lectura de datos sucios | Lectura no repetible | Fantasma |
|-|-|-|-|
| Lectura no confirmada | sí| sí |sí |
| Lectura confirmada | no | sí| sí|
| Lectura repetible | no| no| sí|
| Instantánea | no| no| no|
| Serializable | no | no | no |


## Serializable

Es el nivel de aislamiento más alto que se puede establecer. Este nivel garantiza que una transacción recuperará exactamente los datos cada vez que repita una operación de lectura.  
En esta, dos transacciones están 100% aisladas, y cada transacción tiene su propio "mundo".
## Lecturas repetibles

Es el modo predeterminado de MySQL, cada transacción tiene su propio "mundo", excepto en un caso, si una transacción ejecuta con éxito y se agregan datos nuevos, los datos son visibles para otras transacciones en curso, sin embargo, si la transacción modificó con éxito un dato, el resultado de la modificación no será visible para la transacción en ejecución.

## Lecturas comprometidas

Predeterminado para Oracle, PostgreSQL y SQL server. Si la transacción A lee los datos D, y luego los datos D son modificados (o eliminados) y confirmados por la transacción B, el cambio (o eliminación) de los datos es visible cuando la transacción A lee los datos D nuevamente

## Lecturas no confirmada

El nivel más bajo de aislamiento es una lectura comprometida + un nuevo avance de aislamiento. Si la transacción A lee los datos D, los datos D son modificados por la transacción B (pero no confirmada, y la transacción B todavía se está ejecutando). Cuando la transacción A lee los datos D nuevamente, la modificación de los datos es visible. Si la transacción B retrocede, los datos D leídos por la transacción A por segunda vez no tienen sentido, porque es una modificación que la transacción B nunca ha realizado (se ha retrotraído)

# Problemas de lecturas

Los problemas de lectura son situaciones que pueden surgir en sistemas de bases de datos multiusuario cuando las transacciones concurrentes acceden y modifican los mismos datos. Estos problemas pueden surgir debido a los diferentes niveles de aislamiento de las transacciones. 

## Lecturas sucias 

Las lecturas sucias (Dirty Reads) son un problema que puede ocurrir en sistemas de bases de datos cuando una transacción lee datos que han sido modificados por otra transacción que aún no ha sido confirmada (comprometida). En otras palabras, una transacción está leyendo datos que podrían revertirse si la transacción que realizó las modificaciones se deshace antes de confirmarse. Esto puede llevar a información incorrecta y resultados inconsistentes en la base de datos.

## Lecturas fantasmas

Las lecturas fantasmas (Phantom Reads) son un problema que puede ocurrir en sistemas de bases de datos cuando una transacción realiza una consulta para un conjunto de filas que cumplen cierta condición, pero entre dos consultas consecutivas, otra transacción agrega o elimina filas que cumplen esa misma condición. Como resultado, la primera transacción experimenta "fantasmas" que aparecen o desaparecen repentinamente en las consultas, lo que puede llevar a resultados incoherentes y errores en la toma de decisiones.

## Lecturas no repetibles

Las lecturas no repetibles (Non-Repeatable Reads) son un problema que puede ocurrir en sistemas de bases de datos cuando una transacción realiza dos lecturas consecutivas de los mismos datos y encuentra que los datos han cambiado entre las dos lecturas debido a las modificaciones realizadas por otra transacción.

# EJEMPLIFICACIÓN

[EJEMPLO EN BARD](https://g.co/bard/share/6a2de3c815a2)

### Trabajo grupal 
- Daniel Bautista 2121323
- Juan Marroquín 1689821
- Pablo Cotí 1653221