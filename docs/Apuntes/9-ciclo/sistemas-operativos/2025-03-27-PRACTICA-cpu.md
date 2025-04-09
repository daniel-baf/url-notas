
# INFORMACION CPU

Primero obtenemos la información de la CPU

![[Pasted image 20250327110530.png]]

Podemos decir que tengo 9 nucleos disponibles. Veamos la frecuencia

![[Pasted image 20250327110722.png]]

La frecuencia cambia en todo momento.

**Cambiando la frecuencia del procesador**

Primero vemos las frecuencias soportadas
```shell
debf-bian ❯❯ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies

3600000 1500000 

```

Esto implica que mi procesador solo admite escalados de, o 1500000 o 3600000

```shell
debf-bian >> cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor

scheduitl
```

Para no modificar permisos y demas, hare la prectica con 150000


![[Pasted image 20250327111915.png]]

Aunque en este caso sigue lanzando el error, puesto que no he cambiado la forma a `userspace` podemos ver que el procesador siempre corre a esa misma velocidad.
Puedo concluir en este paso, que puedo usar 1.5GHz cuando mis tareas no sean demandantes, y 3.6Ghz cuando requiera mas potencia, asi me ayuda a ahorrar bateria.

# Dispositivos PCI

![[Pasted image 20250327112112.png]]
En este caso, al elegir aleatoriamente uno y buscarlo, vemos que el dispositivo conectado es un disco NVMe marca hynix de 2TB


![[Pasted image 20250327112331.png]]

# Detalles de una interfaz de red

![[Pasted image 20250327112508.png]]

También podemos obtener la MAC

![[Pasted image 20250327112618.png]]

Acá obtenemos el valor de -1 al querer ver la velocidad
![[Pasted image 20250327112813.png]]

La pregunta es, ¿por qué pasa?, la salida `-1` en `/sys/class/net/enp5s0/speed` indica que la interfaz de red **no puede determinar** o **no reporta** su velocidad correctamente. Esto puede deberse a varias razones. Asi que primero veremos el carrier

![[Pasted image 20250327112932.png]]

Aca podemos concluir que el estado es `DOWN` y es porque no está conectado un cable o no hay conexión, y es porque no ando conectado a internet.

# Administración de la enegría

![[Pasted image 20250327113152.png]]


Aca hemos suspendido la computadora

![[Pasted image 20250327113506.png]]

# Ajuste de temperatura de la CPU

