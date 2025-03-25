**INFORME DE LABORATORIO: MONITOREO Y GESTIÓN DE MEMORIA EN WINDOWS Y LINUX**

**Facultad de Ingeniería - Ingeniería en Informática y Sistemas**

**1. Introducción** Este informe tiene como objetivo analizar el uso de la memoria RAM y virtual en sistemas operativos Windows y Linux. Se realizaron monitoreos mediante herramientas avanzadas y simulaciones con Python para evaluar el comportamiento del sistema ante distintos escenarios de consumo de memoria.

---

# **2. Análisis General del Uso de Memoria**

**Monitoreo con herramientas avanzadas:**

- **Windows:** Se utilizaron herramientas como System Information, Performance Monitor, Resource Monitor y Process Explorer.
    
- **Linux:** Se ejecutaron comandos como `free -m`, `cat /proc/meminfo`, `htop`, `vmstat 1 10` y `smem -t`.



1. Ir a memory 
![[Pasted image 20250325105615.png]]

2. performance monitor
![[Pasted image 20250325105647.png]]

![[Pasted image 20250325110043.png]]

3. resmon

![[Pasted image 20250325110134.png]]

4. process explorer

![[Pasted image 20250325110555.png]]


**Simulación con Python:**

```python
import psutil

memoria = psutil.virtual_memory()
swap = psutil.swap_memory()

print(f"  Memoria Total: {memoria.total / (1024**3):.2f} GB")
print(f"  Memoria Disponible: {memoria.available / (1024**3):.2f} GB")
print(f"  Uso de Memoria: {memoria.percent}%")
print(f"  Uso de SWAP: {swap.percent}%")
```


![[Pasted image 20250325110538.png]]

![[Pasted image 20250325110949.png]]


---

# **3. Monitoreo de Procesos que Más Memoria Consumen**

**Monitoreo con herramientas avanzadas:**

- **Windows:** Task Manager y Process Explorer.
    
- **Linux:** `ps aux --sort=-%mem | head -10` y `htop`.



**TASK MANAGER**

![[Pasted image 20250325111043.png]]


**PROCESS EXPLORER**


![[Pasted image 20250325111220.png]]



**Simulación con Python:**

```python
procesos = sorted(psutil.process_iter(attrs=['pid', 'name', 'memory_info']), key=lambda p: p.info['memory_info'].rss, reverse=True)
print("    Top 10 procesos que más memoria consumen:")
for proceso in procesos[:10]:
    print(f"PID: {proceso.info['pid']} | {proceso.info['name']} | Memoria: {proceso.info['memory_info'].rss / (1024 ** 2):.2f} MB")
```

![[Pasted image 20250325111337.png]]


---

# **4. Simulación de Alto Consumo de Memoria**

**Monitoreo con herramientas avanzadas:**

- **Windows:** Resource Monitor y Performance Monitor.
    
- **Linux:** `htop` y `iotop`.

**MONITOREO CON RESMON**

![[Pasted image 20250325111422.png]]

**PERFMON**

![[Pasted image 20250325111656.png]]



**Simulación con Python:**

```python
import time
print("        Reservando 500 MB de memoria...")
memoria = [0] * (500 * 1024 * 1024 // 4)
input("   Memoria reservada. Presiona Enter para liberarla...")
memoria = None
print("   Memoria liberada.")
time.sleep(2)
```


![[Pasted image 20250325111746.png]]


---

# **5. Simulación de Fuga de Memoria**

**Monitoreo con herramientas avanzadas:**

- **Windows:** Process Explorer y Performance Monitor.
    
- **Linux:** `htop` y `valgrind --tool=massif python script.py`.



![[Pasted image 20250325111832.png]]


**MONITOREANDO PRIVATE BYTES**


![[Pasted image 20250325112051.png]]


**Simulación con Python:**

```python
import time
lista = []
print("    Simulando fuga de memoria...")
for _ in range(1000):
    lista.append([0] * (1024 * 1024))
    time.sleep(0.1)
print("  Fin del programa.")
```


![[Pasted image 20250325112208.png]]


---

# **6. Análisis de Swapping (Memoria Virtual)**

**Monitoreo con herramientas avanzadas:**

- **Windows:** Task Manager y Process Explorer.
    
- **Linux:** `vmstat 1 10` y `swapon -s`.
    

![[Pasted image 20250325112427.png]]

![[Pasted image 20250325112721.png]]



**Simulación con Python:**

```python
print("    Forzando uso de swap...")
memoria = []
for _ in range(5):
    memoria.append(bytearray(500 * 1024 * 1024))
    time.sleep(2)
print("   Swap en uso.")
input("Presiona Enter para liberar la memoria...")
memoria = None
```

**FORZANDO CON PYTHON**

![[Pasted image 20250325112550.png]]

![[Pasted image 20250325112600.png]]


---

**7. Análisis de Páginas de Memoria**

**Monitoreo con herramientas avanzadas:**

- **Windows:** Performance Monitor y Resource Monitor.
    
- **Linux:** `vmstat 1 10` y `cat /proc/vmstat | grep pgfault`.
    

---

**8. Conclusiones** Tras la realización de este laboratorio, se logró:

El presente laboratorio permitió comprender a profundidad cómo los sistemas operativos administran la memoria RAM y virtual, facilitando la identificación de problemas de rendimiento y posibles cuellos de botella en el uso de los recursos. A través del monitoreo con herramientas avanzadas, se pudo examinar el estado inicial del sistema, identificar los procesos con mayor consumo y analizar cómo estos afectan el desempeño del equipo.

Las simulaciones en Python fueron fundamentales para observar en tiempo real el comportamiento de la memoria ante distintos escenarios. Se logró simular situaciones de alto consumo, fugas de memoria y uso excesivo del swapping, demostrando cómo estos fenómenos pueden afectar la estabilidad del sistema y su rendimiento general. En particular, la simulación de swapping evidenció la importancia de contar con una adecuada configuración de memoria virtual para evitar ralentizaciones significativas.

El análisis de fallos de página permitió conocer cómo el sistema gestiona la memoria en ejecución y cómo el uso eficiente de la RAM puede minimizar el impacto en el rendimiento. Se constató que la optimización de los procesos y la detección temprana de problemas de memoria son esenciales para garantizar un funcionamiento eficiente y estable.

En conclusión, la aplicación de estas técnicas de monitoreo y simulación es clave en la administración de sistemas informáticos en entornos de producción. Se recomienda su uso frecuente para la prevención de problemas de rendimiento, optimización del consumo de memoria y mejora en la estabilidad de los sistemas operativos, tanto en entornos personales como empresariales.


**DESPUES DE HABER CERRADO TODO**

![[Pasted image 20250325112800.png]]




