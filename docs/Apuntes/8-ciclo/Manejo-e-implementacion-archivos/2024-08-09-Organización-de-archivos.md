Cada sistema operativo organiza de distintas maneras las carpetas.

Linux hace algo parecido a 

```
	/home
    /boot
/	/efi
	...
	/snap

```

Linux, almacena los datos almacenados en `/bin` están los datos de los programas que el usuario puede ejecutar. ej. `cat Passwd ls ...`

`/sbin`, almacena las instrucciones que son relacionados al sistema.

la carpeta `/boot`,  almacena lo relacionado con el arranque del sistema.

Los **archivos lógicos** son representaciones del sistema operativo. Todos los dispositivos representados son archivos, estos esta guardados en `/dev/`

La ruta `/etc` guarda configuraciones generales.

`/home` almacena la información de los usuarios

Los puntos de montaje se guardan en `/media`, en ella están los dispositivos externos.

`/proc` sirve para guardar la información de los procesos existentes y que se abren mientra el OS esta corriendo.


`/environ` es la ruta en la que se guardan las variables de entorno, que serán utilizadas para todo en la computadora, ejemplo, el buffer por defecto.

La carpeta `/root` sirve para guardar la información del administrador del sistema. 

La carpeta `/srv` guarda documentos relacionados a los servidores, ej. Nginx, FTP... todo lo que levantemos en la computadora.

La carpeta `/tmp` guarda archivos temporales

`/var` me sirve para guardar información de como han ido los distintos programas, ej. errores al abrir aplicaciones, logs al levantar un servidor...c


## Variables de entorno

Los elementos que queremos configurar para alguna instrucción, pero que puede cambiar, estas son las variables de entorno.