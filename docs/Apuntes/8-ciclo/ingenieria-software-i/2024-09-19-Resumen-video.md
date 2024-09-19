Realmente funcionan bien los componentes cuando interaccionan juntos?

El orden de la integración de los componentes se basa en la arquitectura.

Desarrollo de software iterativo, la integración de software es continua conforme se van generando los componentes.

- Primeo se seleccionan los componentes a integrar. 
- Preparar el ambiente de pruebas

Hay 2 esquemas funadmanetales
- Big Bang
- Incrementales
	- Ascendentes 
	- Descendentes
	- Híbridas


```

	B	D
A
	C	E

```

El big bang, nos dice que cada modulo a integrar han sido pasadas, y pasa a ser una unidad cada modulo. Se prueba todo el programa, y el problema es que si algo falla, no se sabe en dónde ha fallado. En stes caso, si algo falla, todo el esquema se va.

Las pruebas de integración ascendentes definen **drivers** para poder hacer pruebas sobre cada unidad. Y se ejecuta cada prueba modulo por modulo ascendiendo en niveles. Se prueba primero un driver para D,E luego uno para B,C y por ulitmo para a

Las pruebas de integración descendente definen **stubs** para ir probando hacia abajo los módulos. En este caso, primero A, luego B,C luego D,E. No debe existir el modulo de abajo, simplemente inyecta valores y prueba valores que se consideran correctos.
	Se puede mover por altura o anchura
		ALTURA:: A AC, AC,E
		ANCHURA: A, AC, ACB, ACBE...


