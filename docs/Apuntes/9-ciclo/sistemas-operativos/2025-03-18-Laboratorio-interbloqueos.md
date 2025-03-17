
DANIEL EDUARDO BAUTISTA FUENTES
2121323

# 7.1 

**VEA LA FIGURA 7.9**
![[Pasted image 20250318120110.png]]

**a) demuestre que las 4 condiciones necesarias para el interbloqueo se cumplan**

| CONDICION          | DESCRIPCION                                                                                                                                                                                                                                                                                                                                                     |
| ------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| exclusión mutua    | Todas las filas requieren pasar, pero para poder pasar, necesitan que el otro se mueva, asi que cumple la parte del inter bloqueo, están intentando acceder a recursos bloqueados. Cumple si todos los carros necesitan avanzar pero no pueden hacerlo simultáneamente                                                                                          |
| espera circular    | Si tratamos los orígenes del cuadrado como C1, C2, C3, C4, donde C1 es el carro negro abajo a la derecha y rotamos en sentido contrario a las manecillas del reloj, podemos concluir que C1 requiere que C2 se mueva, pero para que C2 se mueva, se tiene que mover C3, y C3 requiere que se mueva C1, asi que cumplimos con las condiciones del inter bloqueo. |
| retención y espera | Un carro que ya tiene algo (por ejemplo, el control de un carril o un recurso) sigue esperando otros recursos sin liberar los que ya posee. En este contexto, un carro podría estar esperando a que otros carros se muevan para liberar el paso, pero mientras tanto no libera el recurso que posee (el espacio en el carril o la posición en la cola).         |
| no preemción       | Los carros están bloqueados debido a que no pueden ser movidos sin una acción voluntaria de los otros carros. Esto implica que no se puede interrumpir o reubicar a los carros sin una acción previa de estos.                                                                                                                                                  |

**b) regla simple para evitar los interbloqueos en este sistema**

Un carro no se puede detener en un lugar donde bloquee el paso a otros vehículos (como el cruce con X), donde teóricamente nadie se puede quedar en la X.
# 7.2 **Considere la situación de inter-bloqueo, podría producirse el problema de la cena de los filósofos, cuando cada uno toma un platillo a la vez, explique cómo se pueden cumplir las 4 condiciones necesarias para el inter-bloqueos. Explique cómo podría evitarse impidiendo que se cumpla una cualquiera de las cuatro condiciones.**


En el **problema de la cena de los filósofos**, varios filósofos se sientan alrededor de una mesa y necesitan dos tenedores para comer, pero hay un solo tenedor entre cada par de filósofos. El problema de interbloqueo podría surgir si las condiciones necesarias para el interbloqueo se cumplen.

### Las 4 condiciones necesarias para el interbloqueo en este contexto:

1. **Condición de Exclusión Mutua**:
    - Cada tenedor es un recurso exclusivo, ya que un solo filósofo puede usar un tenedor a la vez. Si un filósofo está usando un tenedor, otro no puede usarlo al mismo tiempo. De esta forma, se cumple la condición de exclusión mutua, ya que los tenedores no pueden ser compartidos.
2. **Condición de Espera Circular**:
    - Si cada filósofo toma un tenedor, pero todos esperan el segundo tenedor para poder comer, puede formarse una espera circular. Por ejemplo, si el filósofo 1 tiene el tenedor izquierdo pero está esperando el derecho del filósofo 2, el filósofo 2 tiene el tenedor derecho pero está esperando el izquierdo del filósofo 1, y así sucesivamente con los demás filósofos. Esto crea un ciclo de espera entre todos.
3. **Condición de Retención y Espera**:
    - Cada filósofo retiene el tenedor que ha tomado (por ejemplo, el izquierdo) y espera el segundo tenedor (derecho). El filósofo no libera el tenedor izquierdo mientras espera el derecho, lo que cumple con la condición de retención y espera.
4. **Condición de No Preempción**:
    - Los tenedores no pueden ser arrebatados de un filósofo que ya los tiene. Si un filósofo está esperando el segundo tenedor pero no lo puede conseguir, el tenedor que ya tiene no puede ser tomado por otro filósofo. Esto cumple la condición de no preempción.

### Cómo evitar el interbloqueo:

1. **Romper la condición de espera circular**:
    
    - **Solución**: Los filósofos solo pueden tomar un tenedor si ambos tenedores están disponibles. Esto evita que se forme una espera circular.
2. **Romper la condición de retención y espera**:
    
    - **Solución**: Si un filósofo no puede obtener ambos tenedores, debe liberar el que tiene y esperar. Esto se puede gestionar con un **timeout** o un algoritmo que fuerce la liberación de los tenedores.
3. **Romper la condición de exclusión mutua**:
    
    - **Solución**: Permitir que los filósofos compartan los tenedores, aunque esto no es lo ideal en el contexto clásico. Alternativamente, se puede usar más de un tenedor por filósofo en lugar de uno exclusivo.
4. **Romper la condición de no preempción**:
    
    - **Solución**: Si un filósofo no consigue ambos tenedores, puede ser forzado a liberar el que tiene para que otro filósofo pueda avanzar.


# 7.3 Comparar el esquema de contención con el de espera circular

| **Característica**            | **Esquema de Contención**                                                                                                       | **Esquema de Espera Circular**                                                                                                             |
| ----------------------------- | ------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| **Definición**                | Los procesos intentan acceder a recursos, pero se bloquean si no están disponibles, esperando hasta que se liberen.             | Los procesos forman un ciclo en el que cada uno espera recursos que están siendo retenidos por otros en un ciclo cerrado.                  |
| **Condición de interbloqueo** | No necesariamente causa interbloqueo, ya que los procesos pueden liberarse si los recursos se gestionan correctamente.          | Causa interbloqueo al formar un ciclo de espera circular entre procesos.                                                                   |
| **Manejo de recursos**        | Los recursos son asignados a los procesos, pero pueden ser retenidos hasta que se liberen.                                      | Los recursos se retienen mientras los procesos esperan el recurso del siguiente proceso en el ciclo.                                       |
| **Soluciones para evitarlo**  | Usualmente se evita mediante **algoritmos de asignación de recursos** o mediante la **preempción**.                             | Se puede evitar evitando que los procesos se bloqueen mutuamente en un ciclo de espera, como con la **asignación jerárquica de recursos**. |
| **Complejidad**               | Menor complejidad en comparación con la espera circular, porque no siempre se forma un ciclo de espera.                         | Alta complejidad, ya que implica un ciclo de espera entre procesos que puede ser difícil de detectar y romper.                             |
| **Impacto en el rendimiento** | Generalmente no afecta tanto al rendimiento, ya que los procesos continúan ejecutándose una vez que el recurso está disponible. | Impacta seriamente el rendimiento, ya que los procesos están atrapados en un ciclo de espera sin progresar.                                |

# 7.4 Comparar lo esquemas de espera circular  con esquemas de evasión de inter bloqueos

Responder respecto a **teimpo de ejecución adicional necesarios** y **tasa de procesamiento de sistema**

|**Característica**|**Esquema de Espera Circular**|**Esquemas de Evasión de Interbloqueo**|
|---|---|---|
|**Definición**|Los procesos forman un ciclo en el que cada uno espera recursos que están siendo retenidos por otros, creando un interbloqueo.|Métodos que intentan evitar la formación de interbloqueos mediante la prevención, detección o resolución de los mismos.|
|**Tiempo de Ejecución Adicional Necesario**|**Alto**: Los procesos permanecen bloqueados indefinidamente en un ciclo de espera. No hay ejecución hasta que se resuelve el ciclo.|**Varía según el esquema**: - **Prevención**: Bajo, ya que evita el interbloqueo desde el inicio. - **Detección y Resolución**: Alto, ya que requiere monitoreo y resolución de ciclos en tiempo real. - **Ajuste de Prioridades (Evasión)**: Medio, dependiendo de cómo se gestionen los recursos y las prioridades.|
|**Tasa de Procesamiento del Sistema**|**Muy Baja**: El sistema se detiene mientras persiste el interbloqueo, lo que lleva a una disminución significativa en la tasa de procesamiento.|**Prevención**: Alta, ya que evita el interbloqueo y mantiene los procesos ejecutándose sin interrupciones. **Detección y Resolución**: Moderada, porque los procesos deben ser detenidos mientras se detectan y resuelven interbloqueos. **Ajuste de Prioridades**: Alta, ya que se busca garantizar que los procesos no entren en interbloqueo mediante una asignación eficiente de recursos.|

# 7.5 Computadora y recursos

El algoritmo del banquero es una técnica de **prevención de interbloqueos** que se asegura de que el sistema no entre en un estado inseguro al realizar cambios en los recursos o en los procesos. En este algoritmo, un **estado seguro** es uno en el que existe una secuencia de procesos que pueden ejecutarse sin causar interbloqueos.

### a. **Aumentar el valor de Available**

- **Seguro**: **Sí**, siempre que la cantidad total de recursos del sistema no cambie. Aumentar la disponibilidad de recursos puede permitir que más procesos obtengan los recursos que necesitan, y el algoritmo del banquero continuará evaluando si el sistema permanece en un estado seguro.
- **Justificación**: Aumentar los recursos disponibles **no cambia las demandas de los procesos** y, por lo tanto, no introduce el riesgo de interbloqueos, ya que los procesos pueden seguir solicitando recursos según su capacidad máxima sin cambiar la seguridad del sistema.

### b. **Disminuir el valor de Available**

- **Inseguro**: **No es seguro** en general. Si se disminuye la disponibilidad de recursos sin revaluar el estado del sistema, el algoritmo del banquero podría determinar que el sistema ya no está en un estado seguro, porque puede que los procesos no puedan completar sus ejecuciones con la nueva disponibilidad.
- **Justificación**: Al reducir los recursos disponibles, puede no haber suficientes recursos para satisfacer las **máximas demandas** de los procesos, lo que podría llevar a un interbloqueo.

### c. **Aumentar el valor de max para un proceso**

- **Inseguro**: **No es seguro** en general. Aumentar el valor de `max` (la cantidad máxima de recursos que un proceso puede requerir) puede cambiar el estado de seguridad del sistema.
- **Justificación**: Si el proceso puede requerir más recursos de los que había solicitado inicialmente, esto podría hacer que no haya suficientes recursos para otros procesos, rompiendo la seguridad del sistema si la asignación no se ajusta correctamente según el algoritmo del banquero.

### d. **Disminuir el valor de max para un proceso**

- **Seguro**: **Sí**, **siempre que el proceso no haya solicitado más recursos que los nuevos valores de `max`**. Al disminuir `max`, estás reduciendo la cantidad de recursos que el proceso puede llegar a solicitar, lo que aumenta las probabilidades de que los recursos restantes sean suficientes para los demás procesos.
- **Justificación**: Reducir el valor de `max` no introduce riesgos de interbloqueo, ya que el sistema sigue operando dentro de los límites de los recursos que están disponibles, siempre y cuando las solicitudes actuales no superen el nuevo `max`.

### e. **Aumentar el número de procesos**

- **Inseguro**: **No es seguro** en general. Aumentar el número de procesos podría cambiar la cantidad de recursos necesarios, lo que puede afectar el estado de seguridad del sistema.
- **Justificación**: Si se añaden más procesos, pueden necesitar más recursos, lo que puede hacer que el sistema entre en un estado inseguro si la cantidad total de recursos no es suficiente para garantizar que todos los procesos puedan completarse sin bloquearse mutuamente.

### f. **Disminuir el número de procesos**

- **Seguro**: **Sí**, **siempre que los recursos asignados sean liberados correctamente**. Al reducir el número de procesos, se liberan más recursos para otros procesos, lo que puede mejorar la disponibilidad de recursos para los procesos restantes.
- **Justificación**: Si un proceso se elimina y libera sus recursos, esto puede ayudar a mantener el sistema en un estado seguro, siempre que el algoritmo del banquero se actualice para reflejar estos cambios.

### Resumen

| **Cambio**                                       | **Seguro** |
| ------------------------------------------------ | ---------- |
| **a. Aumentar el valor de Available**            | Sí         |
| **b. Disminuir el valor de Available**           | No         |
| **c. Aumentar el valor de max para un proceso**  | No         |
| **d. Disminuir el valor de max para un proceso** | Sí         |
| **e. Aumentar el número de procesos**            | No         |
| **f. Disminuir el número de procesos**           | Sí         |

# 7.6 Considere un sistema que tiene cuatro recursos del mismo tipo, compartidos entre tres procesos; cada proceso necesita como máximo dos recursos. Demostrar que el sistema está libre de inter-bloqueos.

En este sistema, tenemos **4 recursos del mismo tipo** y **3 procesos**, donde cada proceso necesita como máximo **2 recursos**.

Un interbloqueo ocurre cuando los procesos forman un ciclo de espera, es decir, cada proceso está esperando un recurso que está siendo retenido por otro, creando una situación en la que ninguno puede continuar.

1. **Condición de exclusión mutua**: Los recursos son exclusivos, es decir, un solo proceso puede poseer un recurso a la vez. Esto es válido en el sistema, ya que se trata de recursos compartidos, pero un solo proceso puede tener acceso a un recurso en un momento dado.
2. **Condición de retención y espera**: Los procesos pueden retener algunos recursos mientras esperan por otros. Sin embargo, debido a que cada proceso necesita un máximo de **2 recursos**, y tenemos **4 recursos disponibles** en total, se pueden distribuir de forma que al menos un proceso siempre pueda continuar ejecutándose.
3. **Condición de espera circular**: Para que ocurra un interbloqueo, debe existir una espera circular entre los procesos. Dado que tenemos **4 recursos** y **3 procesos**, es imposible que todos los procesos retengan un recurso y aún así esperen por los recursos de los otros. Incluso en el peor de los casos, si dos procesos tienen cada uno 2 recursos, el tercer proceso aún puede tomar el recurso restante y continuar.
4. **Condición de no preempción**: Como no se mencionan políticas de preempción, asumimos que los procesos no pueden ser forzados a liberar los recursos que ya tienen. Sin embargo, dado que los recursos disponibles son suficientes para evitar la espera circular, no se produce un interbloqueo.

# 7.7.  Considere un sistema que consta de m recursos del mismo tipo, compartidos por in procеsos. Los procesos sólo pueden solicitar y liberar los recursos de uno en uno.

### Condición (a): La necesidad máxima de cada proceso está comprendida entre 1 y mmm recursos.

Esta condición implica que cada proceso necesita al menos un recurso, pero no más que m recursos (el número total de recursos disponibles). Esto significa que no hay procesos que puedan requerir más recursos de los que el sistema tiene disponibles, y que los procesos no pueden pedir recursos que estén fuera del rango permitido por la cantidad total de recursos del sistema. Esto es relevante porque asegura que las demandas de cada proceso son finitas y controladas.

### Condición (b): La suma de todas las necesidades máximas es menor que $m+nm + nm+n$, es decir, $∑i=1nmaxi<m+n\sum_{i=1}^{n} \text{max}_i < m + n∑i=1n​maxi​<m+n$.

Aquí max​ es la cantidad máxima de recursos que puede solicitar el proceso iii, y nnn es el número total de procesos en el sistema. La condición establece que la suma de todas las necesidades máximas de los procesos es menor que $m+n$, lo que significa que no todos los procesos pueden estar esperando los mismos recursos de manera simultánea.

### Demostración de la ausencia de interbloqueos:

1. **El sistema tiene suficientes recursos para evitar el interbloqueo**:
    - En un escenario de interbloqueo, debe haber un ciclo de espera, donde cada proceso está esperando un recurso que está siendo retenido por otro proceso, creando una situación en la que ninguno puede continuar.
    - Dado que la **suma de las necesidades máximas** de todos los procesos es menor que m+nm + nm+n, esto implica que no se puede formar un ciclo de espera completo con todos los procesos esperando por recursos. Es decir, siempre hay suficientes recursos disponibles para permitir que al menos un proceso continúe ejecutándose, liberando recursos para los demás.
2. **Estrategia de asignación de recursos**:
    - Si en cualquier momento hay al menos un proceso que no está esperando por todos los recursos que necesita (es decir, que puede seguir adelante porque hay recursos disponibles para él), entonces ese proceso podrá completar su ejecución, liberar los recursos que tiene y permitir que otros procesos avancen.
    - Como la **suma de las demandas máximas** es menor que m+nm + nm+n, no puede ocurrir una situación en la que todos los procesos estén esperando recursos al mismo tiempo, lo que rompería la condición de espera circular necesaria para un interbloqueo.
3. **Absencia de espera circular**:
    - Para que ocurra un interbloqueo, es necesario que se forme una espera circular, en la cual cada proceso esté esperando por un recurso que está retenido por otro proceso dentro del ciclo.
    - Debido a que **la suma de las demandas máximas** es menor que m+nm + nm+n, no es posible que todos los procesos estén esperando recursos simultáneamente, lo que asegura que no se forme un ciclo de espera circular.

# 7.8. Considere el problema de la cena de los filósofos suponiendo que los palillos se colocan en el centro de la mesa y que cualquier filósofo puede usar dos cualesquiera de ellos. Suponga que las solicitudes de palillos se hacen de una en una. Describa una regla simple para determinar si una solicitud concreta podría ser satisfecha sin dar lugar a interbloqueo, dada la asignación actual de palillos a los filósofos.


Una regla simple para determinar si una solicitud de palillos puede ser satisfecha sin dar lugar a interbloqueo es:

**Regla**: Una solicitud de un filósofo para tomar un palillo solo puede ser satisfecha si, al otorgar el palillo solicitado, **el número total de filósofos que pueden comer con los recursos disponibles** (es decir, filósofos que pueden tener ambos palillos) sigue siendo al menos uno.

En términos prácticos:

1. Antes de asignar un palillo, **simula** qué filósofos pueden obtener ambos palillos y comer.
2. Si al satisfacer la solicitud de un filósofo, **al menos un filósofo más** puede obtener ambos palillos y comer, entonces la solicitud es segura.
3. Si no, rechaza la solicitud para evitar que se forme un ciclo de espera, evitando el interbloqueo.

Esto asegura que siempre haya un filósofo que pueda terminar de comer y liberar los palillos para otros, evitando así el interbloqueo.

# 7.9. Considere la misma situación que en el problema anterior y suponga ahora que cada filósofo requiere tres palillos para comer y que cada solicitud de recurso se sigue realizando todavía por separado. Describa algunas reglas simples para determinar si una solicitud concreta podría ser satisfecha sin dar lugar a un interbloqueo, dada la asignación actual de palillos a los filósofos.

1. La solicitud solo puede satisfacerse si hay **al menos tres palillos disponibles**.
2. Simula la asignación para asegurar que al menos un filósofo pueda obtener los tres palillos necesarios para comer.
3. Verifica que la solicitud no forme un **ciclo de espera**, es decir, que al menos un filósofo pueda seguir comiendo.
4. Los filósofos deben liberar los palillos rápidamente si no los necesitan, asegurando que los recursos no se queden bloqueados por mucho tiempo.


# 7.10. Podemos obtener un algoritmo simplificado del banquero para un único tipo de recurso a partir del algoritmo general del banquero, simplemente reduciendo la dimensionalidad de las diversas matrices en 1. Demuestre mediante un ejemplo que el algoritmo del banquero

