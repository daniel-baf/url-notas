# Informe de Experimentos sobre Interbloqueo y Semáforos en Linux

## Parte 1: Interbloqueo en Linux

### Descripción del experimento

Inicialmente, intentamos generar un interbloqueo utilizando los siguientes scripts, pero descubrimos que la práctica no bloqueaba los archivos como se esperaba. Después de ajustar los comandos y ejecutar dos scripts (`r1.sh` y `r2.sh`) en terminales separadas, logramos reproducir el interbloqueo correctamente.

#### Scripts utilizados:

##### `r1.sh`

```sh
#!/bin/bash
exec 3>archivo1.txt
exec 4>archivo2.txt

flock 3
echo "Proceso 1 bloqueó archivo1.txt"

sleep 5  # Simula trabajo antes de intentar el otro bloqueo

flock 4  # Aquí se quedará esperando si r2.sh ya bloqueó archivo2.txt
echo "Proceso 1 bloqueó archivo2.txt"
```

##### `r2.sh`

```sh
#!/bin/bash
exec 3>archivo2.txt
exec 4>archivo1.txt

flock 3
echo "Proceso 2 bloqueó archivo2.txt"

sleep 5  # Simula trabajo antes de intentar el otro bloqueo

flock 4  # Aquí se quedará esperando si r1.sh ya bloqueó archivo1.txt
echo "Proceso 2 bloqueó archivo1.txt"
```

### Capturas de pantalla

![[Pasted image 20250313115627.png]]

![[Pasted image 20250313120954.png]]

![[Pasted image 20250313121034.png]]

### Análisis del interbloqueo

El interbloqueo ocurre porque cada proceso bloquea un recurso (archivo) y luego intenta acceder a un segundo recurso que ya está bloqueado por el otro proceso. Como ambos están esperando indefinidamente, ningún proceso puede avanzar.

### Conclusiones y prevención del interbloqueo

El interbloqueo es similar a una situación donde dos personas intercambian computadoras de trabajo y se quedan esperando a que el otro libere la suya.

Para evitar el interbloqueo, se pueden implementar estrategias como:

- **Orden de bloqueo fijo:** Asegurar que todos los procesos adquieran los bloqueos en el mismo orden.
- **Tiempo de espera (timeout):** Usar tiempos límite para evitar bloqueos indefinidos.
- **Desbloqueo jerárquico:** Asignar prioridad a ciertos procesos para desbloquear recursos de forma controlada.


La práctica si demuestra como se bloquean, en resumen es como si 2 personas reservaran sus propias computadoras y luego se las intercambiaran mutuamente, por ende, nunca van a poder avanzar porque ya han prestado su material de trabajo, solamente tuvimos que cambiar el script para poder demostrar prácticamente.
La falla en el script original es que el "sleep 30" se corre en una misma termina, por ende espera los 30 segundos para poder bloquear el del proceso 2, y nunca se daba el inter bloqueo.
La solución pudo haber sido, abrir 4 terminales, y bloquear los archivos manualmente durante los 30 segundos de **trabajo**, o simplemente correr el comando **exec** desde un archivo .sh para poder abrir otra terminal, exec solamente es como usar **tmux**, correidno corriendo en segundo plano con terminales virtuales.

---

## Parte 2: Uso de Semáforos

### Descripción del experimento

Para esta parte, utilizamos un script de Bash que automatiza la creación, listado y eliminación de semáforos en Linux.

#### Script utilizado:


```sh
#!/bin/bash

echo "🔵 Creando un semáforo..."
ipcmk -S 1

if [ $? -ne 0 ]; then
    echo "❌ Error al crear el semáforo."
    exit 1
fi
echo "✅ Semáforo creado exitosamente."

echo "🔵 Listando semáforos actuales..."
ipcs -s

read -p "🟡 Ingrese el ID del semáforo a eliminar: " SEMAPH_ID

echo "🔵 Eliminando el semáforo con ID $SEMAPH_ID..."
ipcrm -s "$SEMAPH_ID"

if [ $? -eq 0 ]; then
    echo "✅ Semáforo con ID $SEMAPH_ID eliminado."
else
    echo "❌ Error al eliminar el semáforo."
fi

echo "🔵 Listando semáforos después de la eliminación..."
ipcs -s

echo "✅ Proceso completado."
```

### Capturas de pantalla

![[Pasted image 20250313122555.png]]
![[Pasted image 20250313122620.png]]


### Funcionalidad de los semáforos

Los semáforos son utilizados para coordinar el acceso a recursos compartidos y evitar condiciones de carrera o interbloqueo.

### Conclusiones sobre los semáforos

El uso de semáforos es esencial en entornos multiusuario y multiproceso para evitar problemas de sincronización. Algunas recomendaciones para evitar bloqueos con semáforos incluyen:

- **Uso adecuado de señales de espera y liberación** para garantizar que los procesos no queden atascados.
- **Implementación de prioridades** para permitir que ciertos procesos avancen primero.
- **Control de tiempo de espera** para evitar que procesos esperen indefinidamente por recursos bloqueados.

---

## Parte 3: Conclusión General

Estos experimentos han demostrado la importancia del manejo de concurrencia en sistemas operativos Linux. Mientras que el interbloqueo es un problema crítico que puede hacer que los sistemas queden inoperables, los semáforos proporcionan una solución efectiva para gestionar accesos concurrentes de forma controlada.

El interbloqueo puede generar fallos que afecten el rendimiento del sistema, causando tiempos de espera prolongados y bloqueos en la ejecución de programas. Para mitigar estos problemas, es importante diseñar los sistemas de manera que eviten condiciones de espera circular y establecer protocolos de sincronización eficientes.

Por otro lado, los semáforos representan una herramienta poderosa para gestionar la concurrencia de procesos. Su uso adecuado garantiza que los recursos se utilicen de manera eficiente, minimizando el riesgo de interbloqueos y mejorando el rendimiento general del sistema. Sin embargo, una mala implementación de semáforos puede generar problemas de inanición, donde ciertos procesos nunca obtienen acceso a los recursos que necesitan.

En conclusión, la correcta administración de recursos compartidos mediante estrategias de sincronización adecuadas es fundamental para el diseño de sistemas operativos robustos y eficientes. El conocimiento y aplicación de estos conceptos es clave para cualquier ingeniero en sistemas que busque optimizar la ejecución de procesos en entornos concurrentes.




# Herramientas SysInternals

## Process explorer

Primero vamos a instalar el programa, bueno, en realidad ejecutar el portable.

![[Pasted image 20250313220141.png]]

![[Pasted image 20250313220234.png]]Listando los procesos
![[Pasted image 20250313220357.png]]

