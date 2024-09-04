## REGLAS DE SINTAXIS DE LOS LENGUAJES DE PROGRAMACIÓN

Cada elemento en un código programado, es conocido como Token.
- **identifier**: es una etiqueta que el programador usa para marcar cosas
- **keyword**: el nombre de algunas instrucciones que el lenguaje interpreta y ejecuta
- **separator**: caracteres de puntuación
- **operator**: símbolos que usamos para producir resultados
- **literal**: expresiones numéricas, lógicas o textuales con un valor
- **comments**: un bloque que sirve para expresar las ideas del desarrollador.
## Creación de instrucciones de programas

Cada instrucción contiene un grupo de lógica, algunas veces conocido como _statement_, o declaraciones.

Cada instrucción se ejecuta secuencial-mente, y cada sentencia, tiene que terminar en algún punto.
- Muchos lenguajes usan ;, otros usan el salto de linea con el retorno de carácter

Todo programa necesita ser estructurado, para mejorar la legibilidad, encontrar errores y promover la re-usabilidad.

Acá es donde usamos el concepto de **bloque**, dependiendo del lenguaje, los delimitadores de los bloques permiten separar instrucciones en tareas mas pequeñas.

```
	LENGUAJES DE LA FAMILIA ALGOL, como Ada, PL/SQL.. usan sintaxis como

	begin
		outer block
		begin
			inner block
		end
		outer block
	end

	LENGUAJES DE LA FAMILIA C, como C++, C#, Java... usan sintaxis como
	{
		outer block
		{
			inner block
		}
		outer block
	}
	
	LENGUAJES RELACIONADOS A ABD, como Python o YAML usan la sintaxis como
	outer block
		inner block
	outer block

	NOTA: podemos definir el uso de tabuladores como https://en.wikipedia.org/wiki/Unintended_consequences
```

## Derivar el flujo del programa

Podemos alterar el flujo del programa haciendo uso de instrucciones como `if` o `switch`

### Repetir el flujo del programa

Podemos repetir el flujo usando sentencias como `while`, `do/while`  o incluso `for`.

## Definición de operaciones
Los procedimientos o funciones, son rutinas, sub programas, sub rutinas, métodos u operaciones.

- Una secuencia o programa, permite ejecutar una tarea en específico
- Empaqueta instrucciones bajo un nombre
- Podría aceptar parámetros/argumentos
- Podría devolver/retornar un valor
- Debe ser invocada