*TRANSACCIÓN:* Una colección de operaciones que forman una única unidad lógica de trabajo.

Al crear tablas, debemos usar el motor InnoDB para poder manejar transacciones. 

Una transacción debe contar con las siguientes 4 propiedades
- Atomicidad
	- Todas las operaciones de la transacción se realizan adecuadamente en la base de datos o ninguna de ellas. Si al menos una operación falla, se debe volver a realizar todo el proceso.
- Consistencia
	- La ejecución aislada de la transacción, sin otra que se ejecute concurrentemente. Esta conserva la consistencia de la BD
		- Si Tenemos de la siguiente forma

| Producto | Stock|
| ---|---|
| A | 20|
| B | 12|

Si dos personas solicitan el producto A, uno pide 12 y el otro 18, se deben hacer validaciones siempre para evitar que la cantidad de productos no sea menor. Pues si 2 transacciones son consecutivas, entonces estaremos haciendo que no se valide, si Juan y Pepe piden al mismo tiempo, ambos programas cuentan con un inventario temporal en el escritorio pero la BD no.
Se debe crear una _lista de espera_ para que no se validen todas directamente.

* Aislamiento
	* Aunque se ejecuten varias transacciones concurrentemente, el sistema garantiza que para cada par de transacciones, no se entrelacen en su ejecución.
	
	Bloqueará las consultas hasta que se haya finalizado una consulta previa.
	El proceso de la transacción inicia hasta que presionamos "GUARDAR"

* Durabilidad
	* Guardar los datos en la BD y que estos no se alteren, tras finalizar con éxito una transacción, los cambios realizados en la BD permanecen, incluso si hay fallos en el sistema.

## ACCESO A LA BASE DE DATOS

Tenemos dos acciones, lectura y escritura. 

*MEMORIA INTERMEDIA*: la memoria RAM es la memoria intermedia, cualquier lectura o escritura en la BD será ejecutada mediante la memoria RAM.
¿Cómo puedo verificar esto?, si tengo 2 productos, el producto A y el producto B
  
SQL SENTENCE -> WRITE -> RAM -> BD.

Las transacciones tienen como problema el hecho de guardar en RAM temporalmente las cosas, y en caso de fallo, no revierte ciertos parámetros, como es el caso del atributo AI, que si el ID actual es 2 y falla, sube a 3 y la futura acción tendrá el ID 4

| ID | value |
|-|-|
|1| a|

-> insert (b)

RAM

| ID | value |
|-|-|
|1| a|
| 2 | b|

-> -> ERROR

| ID | value |
|-|-|
|1| a|

-> -> -> insert(c)

| ID | value |
|-|-|
|1| a|
| 3 | c|


## Modelos de almacenamiento

### Volátil
Falta de energía eléctrica implica pérdida de información en ella.
### No volátil
No se pierde la información por pérdida de energía eléctrica
Discos duros, CDs, etc.
### Permanente
No importa lo que pase siempre se dispondrá de la información.
Múltiples copias. No nos referimos a un backup, nos referimos a otra computadora en la que si 1 falla, se conecta a la otra y seguirá funcionando. A esto le llamaremos "Alta volatibilidad".

## Procesamiento
Existen los procesamientos concurrentes y paralelos, por lo general el procesador lo hace de forma concurrente.

Concurrente: Se da cuando varios procesos corren al mismo tiempo
Paralelo: Sistema operativo maneja recursos de un sistema y guarda la información en bloques (sectores)

## Bloque y buffer


Bloque: es la unidad de almacenamiento secundario

Buffer: Es la unidad de transferencia de información entre el almacenamiento primario y secundario, es la unidad de almacenamiento primario.

### Modelo de transacción

Una transacción que termina su operación con éxito, se dice que está "comprometida", comprometida implica que ya está en la base de datos y ya no se puede modificar. 
Una transacción comprometida que haya hecho modificaciones transforma la base de datos llevándola a una nuevo estado de consistencia. 

#### ¿qué pasa si no termina?

La transacción que no finaliza por algún fallo es una transacción abortada.  Cualquier cambio que se haya hecho dentro de la base de datos deben ser revertidas. Una vez hechos los cambios de una transacción abortada se dice que _la transacción se ha retrocedido_

Hay casos puntuales, en los que la transacción abortada se puede revertir parcialmente. Ej. una venta en la que se crea un cliente y falla la venta, revertimos el inventario pero no la creación del cliente.

## TERMINOLOGÍA

COMMIT: La operación fué exitosa y pasará a ser una operación comprometida
ROLLBACK: La operación falló.

En una transacción siempre habrá un rollback o un commit.