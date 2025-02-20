# Sistemas operativos

### ¿Qué es un sistema operativo?

Un **sistema operativo (SO)** es un conjunto de programas que administran los recursos de hardware y software de una computadora. El SO actúa como un intermediario entre los usuarios y el hardware del dispositivo. Su función principal es gestionar los recursos (como la CPU, memoria, almacenamiento y dispositivos de entrada/salida) y proporcionar servicios para que las aplicaciones y programas puedan ejecutarse sin tener que interactuar directamente con el hardware. Los sistemas operativos permiten que el hardware se utilice de manera eficiente y proporcionan una interfaz para los usuarios para interactuar con la máquina.

### ¿Cómo funcionan los sistemas operativos?

Los sistemas operativos funcionan a través de varias funciones clave:

1. **Gestión de procesos:** El SO controla la ejecución de programas y procesos. Esto incluye la creación, programación, sincronización y terminación de procesos.
2. **Gestión de memoria:** El SO maneja la memoria del sistema, asignando y liberando espacios de memoria para los programas en ejecución. También se encarga de la memoria virtual, que permite usar el disco duro como extensión de la RAM.
3. **Gestión de almacenamiento:** El SO organiza y controla el acceso a los dispositivos de almacenamiento (como discos duros o SSDs), permitiendo guardar y recuperar datos.
4. **Gestión de dispositivos de entrada/salida (E/S):** El SO facilita la comunicación con dispositivos como teclados, ratones, pantallas, impresoras y otros periféricos, a través de controladores y protocolos.
5. **Interfaz de usuario:** Muchos SO proporcionan interfaces gráficas o de línea de comandos para que los usuarios interactúen con la máquina de manera intuitiva.

Además, los SO incluyen mecanismos de seguridad (como la autenticación y la protección de datos) y gestionan las comunicaciones en redes, lo que permite que los dispositivos se conecten a otras máquinas o servicios a través de internet.

### Tipos de sistemas operativos

Los sistemas operativos se pueden clasificar según diversos criterios. Aquí te dejo algunos tipos comunes:

1. **Sistemas operativos de tiempo compartido (Multitarea):** Permiten que múltiples usuarios o procesos compartan el mismo sistema al mismo tiempo. Ejemplos: **Linux**, **Unix**, **Windows**.
2. **Sistemas operativos de tiempo real (RTOS):** Están diseñados para responder a eventos o inputs dentro de un tiempo específico, lo cual es crucial para aplicaciones como sistemas embebidos o control de maquinaria industrial. Ejemplos: **FreeRTOS**, **VxWorks**.
3. **Sistemas operativos monolíticos:** Son aquellos en los que todos los servicios del sistema operativo funcionan en el mismo espacio de memoria. Ejemplos: **Linux** y **Unix** (en su forma tradicional).
4. **Sistemas operativos microkernel:** Estos sistemas operativos tienen un núcleo más pequeño y modular, y los servicios adicionales como la gestión de dispositivos y la comunicación se implementan como procesos separados. Ejemplos: **Minix**, **QNX**.
5. **Sistemas operativos de red:** Son aquellos diseñados para gestionar redes de computadoras y proporcionar servicios de red. Ejemplo: **Novell NetWare**.
6. **Sistemas operativos de disco:** Se centran en la gestión de la memoria y la administración del almacenamiento. Ejemplos: **MS-DOS**, **CP/M**.
7. **Sistemas operativos móviles:** Están diseñados para dispositivos portátiles, como teléfonos inteligentes y tabletas. Ejemplos: **Android**, **iOS**.

### Diferencias entre los tipos de sistemas operativos

1. **Multitarea vs. Tiempo real:** Los sistemas multitarea permiten que varios procesos se ejecuten de manera concurrente, mientras que los de tiempo real deben responder en un plazo fijo ante eventos o entradas. Los RTOS están diseñados para sistemas donde el tiempo de respuesta es crítico.
2. **Monolítico vs. Microkernel:** Los SO monolíticos tienen un núcleo que incluye todos los servicios necesarios, lo que los hace más rápidos pero menos flexibles. Los microkernels, por otro lado, son más modulares y permiten un mejor aislamiento y mantenimiento, pero pueden ser más lentos debido a la comunicación entre los módulos.
3. **Sistemas operativos de red:** Mientras que los SO tradicionales se enfocan en la gestión local de la computadora, los sistemas operativos de red están optimizados para administrar y facilitar la comunicación entre varias máquinas en una red.
4. **Móviles vs. de escritorio:** Los sistemas operativos móviles están optimizados para la interacción táctil, la eficiencia energética y el trabajo con hardware limitado, mientras que los sistemas operativos de escritorio están diseñados para ofrecer una mayor potencia y capacidad de personalización, pero a costa de un mayor consumo de recursos.

### Resumen:

Los sistemas operativos son el núcleo que permite la interacción entre el hardware y el software en una computadora. Funcionan gestionando recursos y proporcionando una interfaz para que los usuarios y programas puedan interactuar con el sistema. Existen diferentes tipos, como multitarea, tiempo real, monolíticos, microkernel, y específicos para redes o dispositivos móviles, cada uno con sus características particulares según el entorno y los requerimientos de uso.


# **Preguntas y respuestas sobre Sistemas Operativos (Explicadas a fondo)**

## **1. ¿Cuál es la diferencia entre el modo usuario y el modo kernel en una CPU?**

✔ **El modo usuario restringe el acceso al hardware, mientras que el modo kernel tiene control total sobre los recursos del sistema.**

### **Explicación detallada:**

Los procesadores modernos tienen al menos dos modos de ejecución:

- **Modo usuario** (User Mode):
    
    - Se usa para ejecutar aplicaciones y software de usuario.
    - No puede acceder directamente al hardware ni ejecutar instrucciones privilegiadas.
    - Si un programa necesita acceder a hardware (como leer un archivo o usar la red), debe hacerlo a través de **llamadas al sistema** (system calls).
- **Modo kernel** (Kernel Mode):
    
    - Se usa para ejecutar el núcleo del sistema operativo y controladores de dispositivos.
    - Tiene acceso completo a la memoria, CPU y dispositivos de hardware.
    - Permite modificar estructuras críticas del sistema, como la tabla de procesos y la memoria virtual.

**Ejemplo:**  
Cuando una aplicación en modo usuario quiere leer un archivo, no puede acceder directamente al disco. En su lugar, realiza una llamada al sistema `read()`, la cual cambia el control al modo kernel, accede al disco y devuelve los datos al modo usuario.

---

## **2. ¿Qué es la memoria virtual y cómo funciona?**

✔ **La memoria virtual es una técnica que permite ejecutar programas más grandes que la memoria física, usando espacio en el disco como una extensión de la RAM.**

### **Explicación detallada:**

- Permite que los procesos tengan la **ilusión de disponer de más memoria** de la que realmente tiene el sistema.
    
- Se implementa mediante:
    
    - **Paginación**: Divide la memoria en bloques de tamaño fijo llamados **páginas** y las asigna a marcos en la memoria física.
    - **Segmentación**: Divide la memoria en segmentos de tamaño variable según la estructura lógica del programa.
- Usa una **tabla de páginas** para mapear direcciones lógicas en direcciones físicas.
    

**Ejemplo:**  
Si una computadora tiene 8 GB de RAM y se ejecutan programas que requieren 16 GB, el sistema operativo mueve las partes inactivas de los procesos al **archivo de paginación** en el disco duro, permitiendo que los programas sigan ejecutándose sin error.

---

## **3. ¿Qué es una llamada al sistema y cuál es su propósito?**

✔ **Una llamada al sistema (system call) permite que los programas en modo usuario soliciten servicios al sistema operativo en modo kernel.**

### **Explicación detallada:**

- Las aplicaciones no pueden acceder directamente al hardware, por lo que deben usar llamadas al sistema para interactuar con la CPU, memoria y dispositivos.
- Estas llamadas permiten realizar operaciones como:
    - **Crear y gestionar procesos** (`fork()`, `exec()`)
    - **Leer y escribir archivos** (`read()`, `write()`, `open()`)
    - **Administrar memoria** (`mmap()`)
    - **Comunicación entre procesos** (`pipe()`, `socket()`)

**Ejemplo:**  
En Linux, al abrir un archivo en C:

```c
int fd = open("archivo.txt", O_RDONLY);
```

`open()` es una llamada al sistema que solicita al SO acceso al archivo.

---

## **4. ¿Qué es la jerarquía de memoria y por qué es importante?**

✔ **Es la organización de diferentes niveles de almacenamiento según velocidad, costo y capacidad.**

### **Explicación detallada:**

La memoria de un sistema se divide en niveles para optimizar rendimiento y costo:

1. **Registros** (dentro de la CPU) → Más rápidos y pequeños.
2. **Caché** (L1, L2, L3) → Almacena datos usados frecuentemente para acceso rápido.
3. **Memoria principal (RAM)** → Almacena datos de ejecución temporal.
4. **Almacenamiento secundario (SSD/HDD)** → Para almacenamiento persistente.
5. **Almacenamiento remoto o en la nube** → Más lento, pero accesible desde cualquier lugar.

📌 **Objetivo:** Minimizar los accesos a la memoria más lenta y costosa.

**Ejemplo:**  
Cuando abres una aplicación, sus datos primero se cargan en RAM. Si la CPU necesita acceder repetidamente a ciertos datos, los guarda en caché para acelerar su acceso.

---

## **5. ¿Cuál de las siguientes estructuras de sistemas operativos es la más tradicional y está compuesta por un solo bloque de código que se ejecuta en modo kernel?**

✔ **c) Estructura Monolítica**

### **Explicación detallada:**

Los sistemas operativos pueden estructurarse de diferentes maneras:

- **Monolítico** (Ejemplo: Linux, MS-DOS)
    
    - Todo el SO es un solo bloque de código ejecutándose en modo kernel.
    - Alto rendimiento, pero difícil de modificar.
- **Microkernel** (Ejemplo: MINIX, QNX)
    
    - Solo las funciones básicas están en el kernel.
    - El resto (sistema de archivos, drivers) se ejecuta en modo usuario.
    - Más seguro, pero menos eficiente.
- **Estructura en capas** (Ejemplo: THE system)
    
    - Se divide en niveles donde cada capa solo interactúa con la inferior.
    - Facilita mantenimiento, pero puede ser más lento.
- **Exokernel**
    
    - Elimina la abstracción de hardware, permitiendo que las aplicaciones gestionen directamente los recursos.

**Ejemplo:**  
Linux es monolítico, por lo que el núcleo tiene control total del hardware y permite cargar módulos dinámicamente.

---

## **6. ¿Qué ventaja ofrece la estructura en capas de un SO?**

✔ **b) Facilita el mantenimiento y la modificación del sistema.**

### **Explicación detallada:**

- Divide el sistema en **capas jerárquicas**, donde cada una tiene una función específica.
- Si hay un error en una capa, las demás no se ven afectadas.

📌 **Ejemplo de capas en un SO:**

6. **Capa de hardware**
7. **Capa de controladores de dispositivo**
8. **Capa del kernel**
9. **Capa de sistema de archivos**
10. **Capa de aplicaciones de usuario**

**Desventaja:** Puede generar sobrecarga en la comunicación entre capas, reduciendo rendimiento.

---

## **7. ¿Ejemplo clásico de un sistema monolítico?**

✔ **b) MS-DOS**

📌 **MS-DOS es un sistema operativo monolítico porque:**

- Todo el código corre en un único bloque en modo kernel.
- No tiene protección de memoria ni multitarea real.

Ejemplos de otros sistemas monolíticos:

- **Linux** (aunque soporta módulos).
- **UNIX clásico**.

---

## **8. ¿Qué caracteriza a un microkernel?**

✔ **b) Solo contiene las funciones esenciales, como gestión de procesos e IPC.**

📌 **Características clave:**

- Reduce el código en el kernel, moviendo servicios a espacio de usuario.
- Mejora la estabilidad y seguridad.
- Puede ser más lento por la comunicación entre procesos.

Ejemplo: **MINIX**, diseñado por Andrew Tanenbaum para educación.

---

## **9. ¿Qué sistema operativo fue desarrollado por Tanenbaum y sirvió de inspiración para Linux?**

✔ **b) MINIX**

### **Explicación detallada:**

- **MINIX** es un sistema operativo basado en UNIX, desarrollado por **Andrew Tanenbaum** en 1987.
- Diseñado con un **microkernel**, lo que significa que solo las funciones esenciales están en el núcleo, mientras que el resto se ejecuta en el espacio de usuario.
- Fue desarrollado con fines educativos y utilizado en la enseñanza de sistemas operativos.

📌 **Relación con Linux:**

- Linus Torvalds, creador de **Linux**, se inspiró en MINIX para desarrollar su propio kernel en 1991.
- Aunque Linux es monolítico, adoptó varias ideas de diseño de MINIX.

**Ejemplo de comando en MINIX:**

```bash
ps -e   # Lista procesos en ejecución
```

---

## **10. ¿Qué generación de computadoras introdujo los transistores y el procesamiento por lotes?**

✔ **b) Segunda generación**

### **Explicación detallada:**

- **Primera generación (1940-1956)**
    
    - Usaba **tubos de vacío**.
    - Programación con cables y switches.
- **Segunda generación (1956-1964)**
    
    - Introdujo los **transistores**, más eficientes que los tubos de vacío.
    - Aparece el **procesamiento por lotes** (_batch processing_), donde múltiples tareas se agrupan y ejecutan sin intervención del usuario.
- **Tercera generación (1964-1971)**
    
    - Se introduce el **multiprogramación**, permitiendo que varios programas compartan la CPU.

📌 **Ejemplo de procesamiento por lotes:**

```bash
#!/bin/bash
cp archivo1.txt destino/
mv archivo2.txt destino/
rm archivo3.txt
```

Este script ejecuta varias operaciones sin intervención del usuario.

---

## **11. ¿Qué es un proceso y cuáles son sus estados principales?**

✔ **Un proceso es un programa en ejecución.**  
✔ **Estados:** **Nuevo, Listo, Ejecutando, Bloqueado, Terminado**.

### **Explicación detallada:**

Un proceso pasa por diferentes estados:

1. **Nuevo**: Se ha creado, pero aún no se ejecuta.
2. **Listo**: Espera que la CPU lo asigne para ejecutarse.
3. **Ejecutando**: Se está ejecutando en la CPU.
4. **Bloqueado**: Está esperando un recurso (I/O, memoria).
5. **Terminado**: Ha finalizado su ejecución.

📌 **Ejemplo en Linux:**

```bash
ps aux  # Muestra procesos en ejecución
kill -9 PID  # Finaliza un proceso
```

---

## **12. Diferencia entre fragmentación externa e interna**

✔ **Externa:** Espacio libre disperso, no contiguo.  
✔ **Interna:** Bloques asignados más grandes de lo necesario.

📌 **Ejemplo de fragmentación interna:**

Si un SO asigna bloques de 4 KB y un archivo ocupa 3 KB, **1 KB se desperdicia**.

📌 **Ejemplo de fragmentación externa:**

Si hay varios bloques de memoria libres pero no contiguos, un proceso grande no puede ejecutarse, aunque haya suficiente memoria total.

🔹 **Solución:** **Compactación, paginación o segmentación.**

---

## **13. ¿Qué es un sistema de archivos y sus componentes?**

✔ **Organiza y gestiona archivos en el almacenamiento.**  
✔ **Componentes:** Estructura de directorios, metadatos, tabla de asignación.

📌 **Ejemplo de sistemas de archivos:**

- **FAT32** (compatible pero con límite de 4 GB por archivo).
- **NTFS** (Windows, soporta permisos y compresión).
- **EXT4** (Linux, más eficiente en disco grande).

📌 **Ejemplo de comandos para manipular archivos:**

```bash
ls -l  # Listar archivos con detalles
touch nuevo.txt  # Crear un archivo vacío
rm archivo.txt  # Eliminar un archivo
```

---

## **14. ¿Qué es la planificación de procesos y sus algoritmos comunes?**

✔ **Distribuye el uso de la CPU entre procesos.**  
✔ **Algoritmos:** FCFS, SJF, Round Robin, Prioridad, Multinivel.

📌 **Explicación de los algoritmos:**

- **FCFS (First-Come, First-Served)**: El primero en llegar es el primero en ejecutarse.
- **SJF (Shortest Job First)**: Se ejecuta primero el proceso más corto.
- **Round Robin**: Asigna un tiempo fijo a cada proceso y los rota.
- **Prioridad**: Ejecuta procesos según su prioridad.
- **Multinivel**: Divide procesos en diferentes colas según su tipo.

📌 **Ejemplo de `ps` en Linux:**

```bash
ps -eo pid,cmd,%cpu,%mem --sort=-%cpu  # Ordena por uso de CPU
```

---

## **15. ¿Qué es la comunicación entre procesos (IPC) y métodos comunes?**

✔ **La comunicación entre procesos (IPC, Inter-Process Communication) permite que múltiples procesos intercambien información, incluso si están en diferentes espacios de memoria.**

Los procesos pueden necesitar comunicarse para compartir datos, sincronizar acciones o coordinar tareas. Existen varios métodos de IPC:

### **1. Memoria Compartida**

- Permite que múltiples procesos accedan a una misma región de memoria.
- Es eficiente porque evita el intercambio de datos mediante copias.
- **Ejemplo en C (usando `shmget`)**:
    
    ```c
    #include <stdio.h>
    #include <sys/ipc.h>
    #include <sys/shm.h>
    #include <string.h>
    
    int main() {
        key_t key = 1234;
        int shmid = shmget(key, 1024, 0666 | IPC_CREAT);
        char *data = (char *)shmat(shmid, (void *)0, 0);
    
        strcpy(data, "Hola desde la memoria compartida");
        printf("Escrito en memoria: %s\n", data);
    
        shmdt(data);
        return 0;
    }
    ```
    
    - Un proceso puede escribir en esta memoria y otro puede leerla, sincronizando su acceso mediante semáforos.

### **2. Pipes (Tuberías)**

- Son canales de comunicación unidireccionales entre procesos.
    
- Se dividen en:
    
    - **Pipes anónimos**: Solo sirven entre procesos padre e hijo.
    - **Named pipes (FIFO)**: Permiten comunicación entre procesos no relacionados.
- **Ejemplo de un pipe en C:**
    
    ```c
    #include <stdio.h>
    #include <unistd.h>
    
    int main() {
        int fd[2];
        pipe(fd);
        char buffer[20];
    
        if (fork() == 0) {
            close(fd[0]); // Cierra lectura
            write(fd[1], "Mensaje IPC", 12);
            close(fd[1]);
        } else {
            close(fd[1]); // Cierra escritura
            read(fd[0], buffer, 12);
            printf("Padre recibió: %s\n", buffer);
            close(fd[0]);
        }
        return 0;
    }
    ```
    
    - Se usa para comunicación entre procesos relacionados (padre e hijo).

### **3. Mensajes (Message Queues)**

- Un sistema de colas donde los procesos pueden enviar y recibir mensajes.
- Permiten una comunicación estructurada sin necesidad de memoria compartida.
- **Ejemplo en C (usando `msgsnd` y `msgrcv`)**:
    
    ```c
    struct msg_buffer {
        long msg_type;
        char msg_text[100];
    };
    ```
    
    - Un proceso puede escribir mensajes en una cola y otro proceso puede leerlos.

### **4. Semáforos**

- Se utilizan para sincronizar procesos y evitar condiciones de carrera (cuando dos procesos acceden a un recurso al mismo tiempo sin control adecuado).
- Existen **semáforos binarios (mutex)** y **semáforos contadores**.
- **Ejemplo en C (usando `sem_init` y `sem_wait`)**:
    
    ```c
    #include <pthread.h>
    #include <semaphore.h>
    #include <stdio.h>
    
    sem_t sem;
    
    void* proceso(void* arg) {
        sem_wait(&sem);  // Disminuye el semáforo (bloquea)
        printf("Proceso en ejecución...\n");
        sem_post(&sem);  // Libera el semáforo
    }
    
    int main() {
        sem_init(&sem, 0, 1);
        pthread_t t1, t2;
        pthread_create(&t1, NULL, proceso, NULL);
        pthread_create(&t2, NULL, proceso, NULL);
        pthread_join(t1, NULL);
        pthread_join(t2, NULL);
        sem_destroy(&sem);
        return 0;
    }
    ```
    
    - Los semáforos garantizan que solo un proceso acceda a un recurso a la vez.

### **5. Sockets**

- Permiten la comunicación entre procesos en **diferentes máquinas** mediante protocolos como TCP/IP.
- Se usan en redes, por ejemplo, en aplicaciones cliente-servidor.

---

## **16. ¿Qué es un sistema distribuido y sus características?**

✔ **Un sistema distribuido es un conjunto de computadoras interconectadas que trabajan juntas como si fueran un solo sistema.**

Se usa en bases de datos distribuidas, servicios en la nube y clusters de servidores.

### **Características clave:**

### **1. Transparencia**

- **Los usuarios no notan que están interactuando con múltiples sistemas.**
    
- Tipos:
    
    - **Transparencia de acceso:** No importa en qué máquina está un recurso, siempre se accede de la misma manera.
    - **Transparencia de ubicación:** El usuario no necesita conocer la ubicación física de un archivo o proceso.
    - **Transparencia de replicación:** Si hay múltiples copias de un recurso, el sistema elige la mejor automáticamente.
    
    **Ejemplo:**
    
    - Google Drive: Un usuario accede a sus archivos sin saber en qué servidor están almacenados.

### **2. Concurrencia**

- **Múltiples procesos pueden ejecutarse simultáneamente en diferentes nodos.**
- Se necesita sincronización para evitar inconsistencias en los datos.
- **Ejemplo:** Un sistema bancario donde múltiples usuarios acceden a una cuenta simultáneamente.

### **3. Escalabilidad**

- **El sistema puede crecer agregando más máquinas sin afectar el rendimiento.**
    
- Tipos:
    
    - **Escalabilidad horizontal:** Añadir más nodos (Ejemplo: servidores en un cluster).
    - **Escalabilidad vertical:** Mejorar hardware existente.
    
    **Ejemplo:**
    
    - Amazon AWS puede agregar servidores automáticamente cuando la demanda aumenta.

---

## **17. Mecanismos de seguridad de un Sistema Operativo**

Un sistema operativo implementa múltiples mecanismos de seguridad para proteger la integridad, confidencialidad y disponibilidad de los datos y recursos del sistema. Estos incluyen:

### **1. Control de acceso**

Regula quién puede acceder a qué recursos y qué operaciones puede realizar.  
✔ **Ejemplo en Linux (permisos de archivos)**:

```bash
chmod 700 archivo.txt  # Solo el propietario puede leer, escribir y ejecutar
chown usuario:grupo archivo.txt  # Cambiar el propietario y grupo del archivo
```

✔ **Ejemplo en Windows (ACL - Access Control List):**

```powershell
icacls "C:\Archivo.txt" /grant Usuario:F  # Otorga control total a "Usuario"
```

- **MAC (Mandatory Access Control):** Implementado en SELinux, impone restricciones estrictas.
- **RBAC (Role-Based Access Control):** Acceso basado en roles, útil en empresas.

### **2. Cifrado**

Protege datos en tránsito y en reposo.  
✔ **Ejemplo en Linux (cifrar un archivo con GPG):**

```bash
gpg -c archivo.txt  # Cifra el archivo con una clave
```

✔ **Ejemplo en Windows (BitLocker):**

```powershell
manage-bde -on C:  # Habilita el cifrado en la unidad C:
```

### **3. Firewalls**

Filtran tráfico de red para evitar accesos no autorizados.  
✔ **Ejemplo en Linux (configuración de `iptables`):**

```bash
iptables -A INPUT -p tcp --dport 22 -j DROP  # Bloquea SSH
```

✔ **Ejemplo en Windows:**

```powershell
New-NetFirewallRule -DisplayName "Bloquear HTTP" -Direction Inbound -Protocol TCP -LocalPort 80 -Action Block
```

### **4. Aislamiento de procesos**

Evita que procesos accedan a memoria o recursos de otros.

- **Virtualización:** Máquinas virtuales ejecutan procesos en entornos aislados.
- **Contenedores (Docker):** Ejecutan aplicaciones en espacios de usuario separados. ✔ **Ejemplo con Docker:**

```bash
docker run --rm -it --security-opt no-new-privileges ubuntu
```

---

## **18. ¿Qué es la paginación y cómo funciona?**

✔ **La paginación es una técnica de administración de memoria que divide la memoria en bloques pequeños llamados páginas y los asigna a marcos de memoria física.**

### **Funcionamiento**

1. **División de memoria:**
    - La memoria virtual se divide en **páginas** de tamaño fijo (ej. 4 KB).
    - La memoria RAM se divide en **marcos** del mismo tamaño.
2. **Asignación de páginas a marcos:**
    - Un proceso con 16 KB de memoria requerirá **4 páginas** si cada página mide 4 KB.
3. **Tabla de páginas:**
    - Traduce direcciones lógicas (de la CPU) a direcciones físicas (en RAM).

### **Ejemplo práctico**

Supongamos que tenemos un proceso con 3 páginas:

```
| Página | Dirección lógica | Marco asignado | Dirección física |
|--------|----------------|---------------|----------------|
| 0      | 0x0000         | 5             | 0x5000         |
| 1      | 0x1000         | 2             | 0x2000         |
| 2      | 0x2000         | 7             | 0x7000         |
```

Si la CPU busca la dirección lógica `0x1000`, la tabla de páginas traduce `0x1000` a `0x2000` en RAM.

### **Ventajas de la paginación**

✔ **Evita la fragmentación externa** (ya que las páginas son del mismo tamaño).  
✔ **Permite memoria virtual**, usando espacio en disco cuando falta RAM.

✔ **Ejemplo en Linux (ver tabla de páginas con `pagemap`):**

```bash
cat /proc/self/pagemap
```

---

## **19. ¿Qué es un archivo FIFO y para qué se usa?**

✔ **Un archivo FIFO (First In, First Out) es un pipe con nombre que permite la comunicación entre procesos.**

### **Características**

- Permite que procesos **no relacionados** (sin relación padre-hijo) se comuniquen.
- Funciona como una cola: **el primer proceso que escribe es el primero en ser leído.**

### **Ejemplo en Linux**

1️⃣ **Crear el FIFO**:

```bash
mkfifo mi_pipe
```

2️⃣ **Proceso que escribe en el FIFO**:

```bash
echo "Mensaje IPC" > mi_pipe
```

3️⃣ **Proceso que lee desde el FIFO**:

```bash
cat mi_pipe
```

El mensaje "Mensaje IPC" será mostrado en pantalla.

✔ **Ejemplo en C:**

```c
#include <stdio.h>
#include <fcntl.h>
#include <sys/stat.h>
#include <unistd.h>

int main() {
    int fd;
    mkfifo("mi_pipe", 0666);  // Crear FIFO
    fd = open("mi_pipe", O_WRONLY);
    write(fd, "Hola FIFO", 10);
    close(fd);
    return 0;
}
```

---

## **20. Diferencias entre NTFS y FAT32**

|Característica|NTFS|FAT32|
|---|---|---|
|**Seguridad**|Soporta permisos y cifrado|No tiene seguridad integrada|
|**Tamaño máximo de archivo**|16 TB|4 GB|
|**Tamaño máximo de partición**|256 TB|32 GB (Windows), 2 TB (Linux)|
|**Compatibilidad**|Windows, Linux, macOS (solo lectura)|Universal (Windows, Linux, macOS, consolas)|
|**Journaling (registro de cambios)**|Sí|No|
|**Velocidad en dispositivos pequeños**|Ligeramente más lenta|Más rápida en pendrives|

### **¿Cuándo usar cada uno?**

✔ **NTFS:** Para discos duros internos, sistemas con permisos y cifrado.  
✔ **FAT32:** Para pendrives, tarjetas SD, compatibilidad con sistemas antiguos.

✔ **Ejemplo en Windows (formatear un disco en NTFS):**

```powershell
format /FS:NTFS D:
```

✔ **Ejemplo en Linux (formatear en FAT32):**

```bash
mkfs.vfat -F 32 /dev/sdb1
```
