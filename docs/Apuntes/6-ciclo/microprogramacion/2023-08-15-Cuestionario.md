## Von Neumann

**1. ¿Cuáles son las cinco partes que forman la computadora Von Neumann?**

- ALU
- Unidad de control  (Ordena, le dice a la ALU qué tipo de operaciones realizar, codifica y decodifica instrucciones. Coordina el resto de unidades)
- Memoria  (Almacena datos e instrucciones)
- Dispositivo de entrada y salida  (Son los puertos donde se intercambia información con el exterior, ya sea enviando o recibiendo datos)
- Bus de datos  (vías en las que se transmiten los datos y trasladan la información)

**2. ¿Qué pasos emula una computadora con la arquitectura Von Neumann?**

- paso 1
	- Enciende la computadora  
	- Obtiene la instrucción en la dirección de memoria indicada.  
	- Lo guarda en el registro de instrucción.  
	- Aumenta el contador del programa  
- paso 2: aumenta el contador del programa
- paso 3:
	- Decodifica la instrucción.  
	- Coordina los componentes para hacer la función.  
- paso 4:
	- Ejecuta la instrucción.  
	- La computadora toma “decisiones”.  

**3. ¿En qué se basó Von Neumann para diseñar su arquitectura?**

El concepto de programas almacenados.    

**4. ¿Qué es un programa almacenado?**  
Un programa almacenado es un set de instrucciones almacenadas en la memoria que se comunican con el sistema a través de instrucciones que los programas pueden invocar.  
   
**5. ¿Cuál es la ventaja de tener un programa almacenado?**  

Una unidad de memoria que evita tener que reestructurar la computadora para cada modificación en el software. También da la posibilidad de modificar los programas durante la ejecución.  

**6. ¿Cuál fue el motivo principal para la creación de un programa almacenado?**  

La necesidad de un programa que incrementa o modifica las direcciones de memoria de algunas instrucciones que debían ser hechas manualmente en los primeros diseños.  

**7. ¿Cuál es el inconveniente con el diseño de Von Neumann?** 

Un mal funcionamiento del programa puede dañar parcial o completamente el computador y se podían generar modificaciones accidentales o maliciosas de programas.  

**8. ¿Qué es un cuello de botella?**  
Situación en la que un componente limita el rendimiento general del sistema o la conexión de un sistema.  

**9. ¿Qué caracteriza el cuello de botella de Von Neumann?**  

- Que los cambios en la memoria eran por medio de empujar la información en la memoria a un lado y trabajando un proceso a la vez en vez de trabajar varios procesos en simultáneo.  
- Limitación entre del rendimiento del procesador debido a la limitación entre la comunicación de la memoria y el procesador.

**10. ¿Cómo se redujo el problema de las altas latencias?**  
Introduciendo la memoria caché entre el CPU y la memoria principal.  
# ALU

**1. ¿qué significa las letras A, B, F, D y R en un ALU?**

A y B son operandos
R es salida
F es la entrada de la unidad de control
D es un estado de salida

**2. ¿Cuál es la función de la ALU?**

Calcular operaciones aritméticas como suma, resta, multiplicación y división, asimismo como operaciones lógicas como "si, y, o, no"

**3. ¿De qué se compone un ALU?**

- Un circuito operacional
- Registro de entrada
- Registro acumulador
- Registro de estados

**3. ¿Cuáles son las operaciones que un ALU básico puede realizar?**

- Operaciones aritméticas de números enteros
- Operaciones lógicas de bits
- Operaciones de desplazamiento de bits (desplazar o rotar una palabra en un numero específico de bits a la izquierda o derecha.)

**4. ¿Qué es un ALU de cálculo en un solo ciclo de reloj?**

Un ALU que calcula la raíz cuadrada de cualquier número en un solo paso.

**5. ¿Qué sucede con la salida de un ALU?**

Es el resultado de cómputo de otra operación, así que será usada por otro ALU para tomar una decisión

**6. ¿Qué es un FPU?**

Una unidad de coma flotante, es básicamente lo mismo que un ALU pero que usa decimales para efectuar las operaciones

**7. ¿Qué es un cálculo interactivo en una ALU?**

Es un ALU complejo que realiza los cálculos de raíces cuadradas en cualquier número de un solo paso.

**8. ¿Qué son las entradas en un ALU?**

Son los operandos

**9. ¿Qué alternativas hay para el cálculo de raíces en los FPU?**

No implementarlo a nivel hardware y hacer que los programadores implementen _librerías_(bibliotecas de software) para cumplir con esta acción 

**10. ¿Cuáles son las cuatro características que toda ALU debe tener?**

- Que la ALU sea capaz de calcular cualquier operación entre cualquier tipo de números enteros.
- Que calcule con varios pasos, cálculo interactivo.
- Que sea simple en el procesador y que tenga un coprocesador
- Emular la existencia del coprocesador, que siempre un programa intente hacer el cálculo por medio del sistema operativo
- Dar feedback del estado del coprocesador para el posible uso de bibliotecas de software