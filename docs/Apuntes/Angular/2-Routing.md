 Permite navegar entre paginas, en resumen son componentes, porque todo es compilado a uno final.

En versiones anteriores se debe configurar manualmente el routing en app.routing generando un modulo.

`ng g module app-routing`

1. Importamos Routes, y RouterModule desd e Angular/router
2. Definimos las rutas


Agregamos las rutas configurando Routes ,y agregar` <router-outlet>` en el index (app.comoponent. usamos la sintaxis :ID si queremos pasar parámetros después del /, al igual que en express

```ts
import Router from @angular/Router

private router: Router

export const routes: Routes = [
	{
		path: '',
		component: HomeComponentComponent,
	},
	{
		path: 'test',
		component: TestingComponent,
	},
];
```

Si queremos **movernos a una vista distinta** usamos algo parecido a
```ts
agregar() {
	this.router.navigate(['endpoint' ])
}
```

```ts
(ngSubmit)="f.form.valid && method()" // podemos usar esto en el html para validar un formulario, el formulario debe tener la referencia local #f ="ngForm"
```


# Pasar parámetros

dentro de un `<a>` o algún elemento, usamos un **routerLink**, tambien puede usarse como property binding **\[routerlink\]="\['endpoint', parameters\]**

La clase que vaya a recibir el parámetro, debe implementar el servicio de Route

```ts
export class ... implements onInit {

	attrLink: any;

	constructor(... private route: ActivatedRoute) {
	}

...

	ngOnInit() {
		this.attrLink = this.route.snapshot.params['PARAM_ID'];
		... code
	}

	agregar() {
		this.router.navigate(['endpoint' ])
	}

}
```

## Query PARAMS

Si queremos mandar un componente, no como un parámetro, en el sentido `/:id` en el Router, sino como si fuera la sintaxis, `endpoint?param=...` lo que debemos hacer es agregarqueryParameteres

**IMPORTAR ROUTERMODULE en el TS**

```html
...

<a
	[routerLink]=['endpoint', paramVariable] <!-- ID es el valor del /endpoint/:param -->
	[queryParams]=[nombreQueryParam:'valor']   
>
...
</a>
```

y lo recuperamos en el TS de la siguiente manera

```ts
export class ... implements onInit {

	attrLink: any;

	constructor(... private route: ActivatedRoute) {
	}

...

	ngOnInit() {
		this.attrLink = this.route.snapshot.params['PARAM_ID'];
		this.paramAttr = this.route.snapshot.queryParams['nombreQueryParam']
		... code
	}

	agregar() {
		this.router.navigate(['endpoint' ])
	}

}
```

y ya a posteriori generamos valores, lo casteamos...

# Child Routes

Simplemente modificamos las rutas y agregamos el paraemtro children: {}

**ANTES**
```ts
export const routes: Routes = [
	{
		path: '',
		component: HomeComponentComponent,
	},
	{
		path: 'test',
		component: TestingComponent,
	},
];

```

**DESPUES**

```ts
export const routes: Routes = [
	{
		path: '',
		component: HomeComponentComponent,
		children: {
			{path: '...', component: COMPONENT}
			{path: "...", component: COMPONENT}
			
		}
	},
	{
		path: 'test',
		component: TestingComponent,
	},
];
```

pero en el router outlet debemos decidir en donde mostrar la información del hijo.
Así que debemos agregar nuevamente `<router-outlet>` en la vista que pertenezca al nuevo "padre" relativo

Si queremos **ocultar el contenido del padre relativo**, podemos hacer algo como esto.

```ts

import { Component } from '@angular/core';
import { Router, NavigationEnd } from '@angular/router';

@Component({
  selector: 'app-relative',
  templateUrl: './relative.component.html',
})
export class RelativeComponent {
  showContent = true;  // Flag to control the visibility of parent content

  constructor(private router: Router) {
    this.router.events.subscribe((event) => {
      if (event instanceof NavigationEnd) {
        // Check if the current URL contains the child route
        this.showContent = !this.router.url.includes('ruta-hija'); // Ruta hija específica
      }
    });
  }
}

```


# COMPONENTE DE ERROR (404)

Si queremos generar un componente para cualquier ruta que no exista, simplemente debemos agregar `**` como path en el vector de rutas.


PARA INJECATR EL DOCUMENTo
```ts
import { DOCUMENT } from '@angular/common';

import { Component, Inject } from '@angular/core';

import { Router } from '@angular/router';

  

@Component({

	selector: 'app-header',
	
	standalone: true,
	
	imports: [],
	
	templateUrl: './header.component.html',
	
	styleUrl: './header.component.css',
	
	})
	
export class HeaderComponent {
	
	constructor(
		private router: Router,
		@Inject(DOCUMENT) private document: Document
	
	) {}
	
	  
	returnPage() {
		let referer = this.document.referrer;
	}
	
}
```

