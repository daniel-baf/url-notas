# Preguntas y Respuestas sobre Interbloqueos

## 1. ¿Qué es un interbloqueo en un sistema operativo?
> Un interbloqueo es una situación en la que un conjunto de procesos está esperando indefinidamente a que se liberen recursos ocupados por otros procesos del mismo conjunto.

## 2. ¿Cuáles son las condiciones necesarias para que ocurra un interbloqueo?
> - **Exclusión mutua**: Solo un proceso puede usar un recurso a la vez.  
> - **Retención y espera**: Un proceso que tiene recursos asignados puede solicitar más sin liberar los que ya posee.  
> - **Sin desalojo**: Un recurso no puede ser forzado a liberarse de un proceso.  
> - **Espera circular**: Existe una cadena de procesos en la que cada uno espera un recurso retenido por el siguiente.

## 3. ¿Cómo se representa gráficamente un interbloqueo?
> Mediante un **grafo de asignación de recursos**, donde los nodos representan procesos y recursos, y las aristas indican solicitudes y asignaciones.

## 4. ¿Cuáles son los métodos principales para tratar los interbloqueos?
> - **Prevención de interbloqueos**: Se asegura que al menos una de las cuatro condiciones necesarias no se cumpla.  
> - **Evasión de interbloqueos**: Se toma en cuenta el estado del sistema para evitar caer en un estado no seguro.  
> - **Detección de interbloqueos**: Se emplean algoritmos para identificar interbloqueos cuando ocurren.  
> - **Recuperación de interbloqueos**: Se liberan recursos para resolver el interbloqueo, generalmente abortando procesos.

## 5. ¿Cómo se puede prevenir un interbloqueo mediante la exclusión mutua?
> Se permite el acceso compartido a ciertos recursos cuando sea posible, eliminando la condición de exclusión mutua.

## 6. ¿Cómo se puede evitar un interbloqueo mediante la retención y espera?
> Se requiere que los procesos soliciten y asignen todos los recursos que necesitan de una sola vez, en lugar de ir solicitándolos progresivamente.

## 7. ¿Qué estrategia se puede usar para prevenir el interbloqueo eliminando la espera circular?
> Se impone un orden total en la solicitud de recursos, asegurando que los procesos los pidan en una secuencia específica.

## 8. ¿Qué es el estado seguro en la evasión de interbloqueos?
> Un estado seguro es aquel en el que el sistema puede asignar recursos a los procesos de manera que siempre pueda evitar un interbloqueo.

## 9. ¿Qué algoritmo se usa comúnmente para la evasión de interbloqueos?
> El **algoritmo del banquero**, que evalúa si la asignación de un recurso puede llevar a un estado seguro antes de concederlo.

## 10. ¿Cómo se detecta un interbloqueo en un sistema con un solo recurso por tipo?
> Se puede usar un **grafo de asignación de recursos** y buscar ciclos en el grafo; si hay un ciclo, hay un interbloqueo.

## 11. ¿Cómo se puede recuperar el sistema de un interbloqueo?
> - Finalizando uno o más procesos involucrados en el interbloqueo.  
> - Desasignando recursos de los procesos involucrados.  
> - Reiniciando el sistema si no hay otra opción viable.

## 12. ¿Cómo se decide qué proceso terminar en una recuperación de interbloqueo?
> Se pueden considerar criterios como la prioridad del proceso, el tiempo de ejecución acumulado y la cantidad de recursos que usa.

## 13. ¿Por qué no es siempre recomendable la detección y recuperación de interbloqueos?
> Porque puede ser costoso en términos de rendimiento y porque la finalización de procesos puede llevar a pérdida de datos o inconsistencias.

## 14. ¿Cuál es la diferencia entre prevención y evasión de interbloqueos?
> - **Prevención**: Se evita que ocurra el interbloqueo eliminando una de las condiciones necesarias.  
> - **Evasión**: Se permite que las condiciones existan, pero se controla el estado del sistema para evitar caer en un interbloqueo.
