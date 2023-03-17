## SELECT

Para hacer un select usamos la instrucción SELECT \<ATRIBUTO\>  FROM \<SCHEMA\>.

Un ejemplo de esto es SELECT \* FROM Clientes
- \* significa "todos los campos"
- Devolverá todos los atributos de todos los Clientes

SELECT id FROM Clientes WHERE Saldo > 100
- id = solamente el atributo id
- WHERE = indicamos que queremos filtar la busqueda
- Saldo = en altributo de la tabla Clientes
	- Solo se mostraran los id de los Clientes que su saldo sea mayor a 100

SELECT id FROM Clientes WHERE Saldo > 100 AND Activo=1;
- AND = conectivo para una doble condición
	- Tabla AND = solo muestra registros donde x e y son V
- Activo = segundo atributo de la tabla Cliente
|  SALDO  | ACTIVO  |
|---------|---------|
| 0 | 0 |
|0 | 1|
|200 | 0|
|200 | 1 |

En esta tabla solo mostarria el valor \[100,1\] en la consulta

SELECT SUM(Saldo), id FROM Cliente;
| Saldo | cliente|
|-----|-----|
| 400 | Ivan |

Esto esta mal, porque estamos obteniendo un valor para el cliente que quiza no le pertenece a él, lo correcto es no agregar un segundo atributo al usar SUM() 

| Saldo | |
|-----|--|
| 400 ||

SELECT COUNT(id) AS \`Clientes registrados\` FROM Clientes WHERE Activo = 1;
SELECT COUNT(\*) AS \`Clientes registrados\` FROM Clientes WHERE Activo = 1;
- COUNT() se usa para contar el numero de filas
- Si estamos contando un atributo de una tabla, y por x razon obtiene un valor NULL en ese atributo, entonces devolvería numeros incompletos.

|COUNT| |
| ----- |-|
| 4 | |

Si por alguna razón la tabla fuera la siguiente
|  SALDO  | ACTIVO  |
|---------|---------|
| 0 | 0 |
|NULL| 1|
|200 | 0|
|200 | 1 |

Y colocamos la consulta SELECT COUNT(SALDO) FROM Cliente;
Esto devolvería lo siguiente ya que un atributo es NULL
|COUNT| |
| ----- |-|
| 3 | |

