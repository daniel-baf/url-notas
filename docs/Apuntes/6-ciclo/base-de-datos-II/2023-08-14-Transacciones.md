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
	* 