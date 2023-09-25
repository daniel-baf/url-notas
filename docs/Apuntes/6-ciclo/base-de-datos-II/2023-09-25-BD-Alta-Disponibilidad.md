
# Bases de datos en espera

Si tenemos una base de datos y esta BD está funcionando, podemos tener diferentes clientes conectados a esta BD, pero el problema es que si esta BD cae, todos los clientes van a dejar de acceder al servicio.

Buscamos que el tiempo de caída sea más bajo, una base de datos en espera es una réplica de la BD principal.

- Provee de alta disponibilidad
- Protege contra la corrupción de datos (que se borren datos)
- Tenemos una BD para consultas

Su  esquema sería el siguiente:

`NOTA: La BD en espera solo puede ser utilizada para consultar datos, pero no pra realizar inserts o updates`


## Configuraciones

1. Transferencia de bitácora

Debe haber alguien que haga manualmente la copia de BD primaria a la BD en espera.

2. Automático

BDP: base de datos primaria
BDE: base de datos en espera

La bitácora no se hace manual, se pasa todos los días de manera automática. En esta la bitácora de la BD primaria se pasa de la BDP a BitacoraBDP y luego a BitácoraBDE y luego a BDE.

----------------------------------------

# Replica de BD

Utilizar los métodos de replicación se resumen en replicar las transaccioes de una base de datos primaria, donde se encuentran conectados los ususarios de un sistema.

No vamos a replicar toda la BD si o sí, podemos replicar una tabla, un esquema, una vista, un grupo de réplicas o si lo deseamos, toda la base de datos.

BDM \[Base d datos maestra\] -> BDE \[Base de datos esclavo\]

Lo más utilizado es replicar tablas y es lo que el ingeniero recomienda. 

## Tipos de replicación

- Maestra
- De instantánea
- Híbrida (multi maestro e instantánea)

### Maestra

Si se cae la localidad maestra, podemos tener la información de los esclavos. Si se llega a arruinar la Maestra, sincronizamos los esclavos y volvemos a tener la información.

Podemos tener múltiples localidades Maestro si deseamos tener aún más alta disponibilidad, se hace uso del multi maestro cuando tenemos una BD muy grande, así se guardan las ventas en un multi maestro, los productos en otro... y a esto se le llama BD distribuida. El problema con esto, es el dinero.

### De instantánea

Contiene una copia completa o parcial de una tabla en un punto de tiempo. Una instantánea puede ser definida para sólo lectura o actualizable. Si tenemos una BD maestra y hay un error, podemos regresar a la instantánea. Es como un punto de restauración.

Luego borramos la instantánea y continuamos con la Maestra.

### En paralelo

Es la más eficiente de los 3 métodos que tenemos. También conocido como un clúster de base de datos. Una BD en paralelo reside en un ambiente en el que se combina el poder de múltiples servidores, operando sobre una BD compartida. 
Un cluster por lo general está comprendido de uno o más servidores, o nodos. La base de datos sobre la que opera cada nodo en el cluster es denominada BD en paralelo o compartida.

NA: nodo administrador
NDN: nodo enésimo

NA -> ND1
	-> ND2
	-> ND3
	...
	-> NDN

Podemos tener un clúster de alta disponibilidad o clúster de alto rendimiento.

### Tipos de cluster
#### Cluster de alto rendimiento

Se reduce el tiempo de una ejecución al combinar los procesadores de múltiples computadores. 

#### Cluster de alta disponibilidad

El contenido de una BD se almacena en distintos servidores para reducir lo sitmepos


### Configuraciones

***N NODOS***

Las transacciones de los clientes son procesadas en cualquier nodo del cluster y las sesiones de los usuarios pueden estar balanceadas en nodoso en particular.

Toda operación se sincroniza de maneara automática.

***Configuración básica de alta disponibilidad***

Funciona casi como una BD en espera, pero el problema con esto, es que todo irá al nodo principal, y si este falla, entraría al segundo nodo, no es muy utilizada porque dependemos de un esclavo.

***Configuración compartida de alta disponibilidad***

Tiene varios nodos en los que se corren módulos separados de aplicación o servicios de aplicación; que comparten una misma base de datos en paralelo. Se pueden separar los módulos, por nodo y diseñar el mecanismo de failover entre un nodo y el otro.

**FAIL OVER**: La aplicación tiene que ser capaz de saber que si un insert en una venta falla, se vaya al cluster de ventas por ejemplo.

