Se puede usar angular.ng-templates para habilitar el autocompletado de angular

Angular por defecto instala dependencias para uno.

```
src ; corazon de la app
	main.ts -> primer archivo, carga todo en la app
	index.html -> raiz de la app como UI
	app : componente raiz, el componente es el conjunto de specs, css, html...
	
sytels.css: estilos genericos, para todas las vistas
```

## Componente

Importamos Component de @angular/core y usamos el decorator @component
en este caso `selector` es el atributo por el que accedemos en los html

`standalone` es un nuevo tipo de modulo usado en angular par que los componentes se importen de manera local sin tener que hacerlo para todo el archivo, se carga el `componente` por bloques

Todos estos atributos se colocan en el `decorador`. 


`@defer` para hacer una carga cuando el contenido se ve y no desde el inicio y debajo del encapsulado poner `@placeholder` para mostrar algo mientras carga
defer puede ser modificado, algo parecido a `@defer (on viewport) {... componente ...}`