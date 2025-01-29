Las llamadas de sistema hacen un cambio entre  modo usuario y modo kernel

- **Interfaz kernel - usuario**: proveen acceso seguro y controlado a los servicios del sistema operativo, memoria, procesos...
- **Modo privilegiado**, las llamadas permiten cambiar privilegios en un usuario


## Interrupciones

En sistemas UNIX/Linux se puede llamar a syscall o int 0x80, en windows systener o int 0X2E. las llamadas al sistema usan interrupciones para transferir el control al kernel.

1. **Comunicación entre procesos**
2. **Gestion de dispostiivos**
3. **Gestión de memoria**

Flujo de una llamada a sistema

1. Invocación -> invoca una funcion, ej. read()
	1. Interrupción -> usa la instrucción especifica
		1. Ejecucion en el kernel
			1. Retorno

## WIN API

- Capa de abstraccón
- Modularidad
- Compatiblidad
- Amplitud
- **GESTION DE VENTANAS DE USUARIO**
- redes, winsock


**ESTRUCTURA DE WINAPI**

| biblioteca   | descripcion                                                             |
| ------------ | ----------------------------------------------------------------------- |
| kernel32.dll | Funciones basicas del SO como gestion de procesos, archivos, memoria... |
| user32.dll   | UI del usuario y ventana                                                |
| gdi32.dll    | Graficos y dispositivos de salida                                       |

...

