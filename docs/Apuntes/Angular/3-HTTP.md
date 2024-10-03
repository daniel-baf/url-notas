Si queremos hacer peticiones HTTP, tenemos que consumir un API, ya sea una BD, un sistema externo...

# POST y PUT

Para hacer una peticion, debemos hacerlo mediante los servicios

```ts
import { HttpClient } from '@angular/common/http'

@Injectable()
export class DataService {
	constructor(private httpClient: HttpClient) {
	}

	guardarObjeto(personas: Object[]) {
		this.httpClient.post('URL', data); // data deberia ser un JSON
	}
}
```


EJEMPLO

```ts
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ApiService {

  private apiUrl = 'https://example.com/api/users';  // URL de la API

  constructor(private http: HttpClient) {}

  // Método para enviar datos con POST
  createUser(userData: { name: string, email: string, password: string }): Observable<any> {
    return this.http.post(this.apiUrl, userData);
  }
}
```

```ts
import { Component } from '@angular/core';
import { ApiService } from './api.service';

@Component({
  selector: 'app-user-form',
  templateUrl: './user-form.component.html'
})
export class UserFormComponent {

  constructor(private apiService: ApiService) {}

  onSubmit() {
    // Datos que se enviarán en la petición POST
    const newUser = {
      name: 'John Doe',
      email: 'johndoe@example.com',
      password: '123456'
    };

    // Llamada al servicio para crear un usuario
    this.apiService.createUser(newUser).subscribe(
      (response) => {
        console.log('Usuario creado:', response);
      },
      (error) => {
        console.error('Error al crear el usuario:', error);
      }
    );
  }
}

```