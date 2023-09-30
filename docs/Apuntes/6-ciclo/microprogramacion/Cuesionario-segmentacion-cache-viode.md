DANIEL EDUARDO BAUTISTA FUENTES – 2121323 

PABLO ANDRÉS COTÍ ARREDONDO - 1653221 

ARQUITECTURAS 

1. ¿Qué significan las siglas CISC? 
    

Complex instruction set computing (conjunto de instrucciones computacionales complejas) 

2. ¿Qué características tienen los procesadores CISC? 
    

Tiene un SET de instrucciones muy amplios que permiten operaciones complejas entre operandos situados en la memoria o en los registros internos. 

3. ¿Cuál es el mayor problema de CISC en el alto rendimiento? 
    

La arquitectura dificulta el paralelismo entre instrucciones. Haciendo que se lleve un tiempo y dificultad para subdividir una instrucción en varias instrucciones. 

4. ¿Qué acciones se tomaron contra la dificultad de paralelismo en el CISC de alto rendimiento? 
    

Se implementó un sistema que convierte instrucciones complejas en varias instrucciones simples de tipo RISC. 

5. ¿Qué nombre reciben las instrucciones convertidas de CISC a RISC? 
    

Microinstrucciones. 

6. ¿Qué significan las siglas RISC? 
    

Reduced instruction set computer (Computadora con conjunto de instrucciones reducido) 

7. ¿Cuáles son las dos características que tiene RISC? 
    

Sus instrucciones son de tamaño fijo y presentan un número reducido de formatos 

8. ¿Cuál es el objetivo de diseñar máquinas con arquitectura RISC? 
    

Posibilitar la segmentación y el paralelismo en la ejecución de instrucciones y reducir los accesos a memoria. 

9. ¿Cuál es el procesador basado en RISC que popularizó el uso de este? 
    

ARM. 

10. ¿Qué es un conjunto de instrucciones? 
    

Es una especificación que detalla las instrucciones que una ALU puede atender y ejecutar, es un conjunto de comandos implementados por un diseño en particular de una CPU. 

11. ¿Cuál es la filosofía de RISC? 
    

Muchas de las características incluidas en el diseño tradicional de un CPU para aumentar la velocidad eran ignoradas por programas que no las necesitaban. Además, la velocidad del procesador en relación con la memoria de la computadora que accedía era cada vez más alta. Esto llevó a buscar métodos para reducir el tiempo de procesamiento, así que preferían crear instrucciones livianas para no estar cargando funciones complejas cuando no se requerían. 

12. ¿Cuál es la mayor complicación con RISC? 
    

Programar en RISC es laborioso, y los compiladores son poco flexibles, además de tener menos funciones que los compiladores para CISC. 

Los compiladores tendían a ser demasiado tontos en términos de las características que usaban, un efecto colateral del intento por hacerlos pequeños. El mercado se estaba moviendo hacia un uso más generalizado de los compiladores, diluyendo aún más la utilidad de los modelos ortogonales. 

13. ¿Cuál es la paradoja con RISC? 
    

En la búsqueda de minimizar tiempos agregando funciones, se crearon tantas funciones que los programadores no daban abasto para optimizarlas, y había muchas funciones de RISC que ni se utilizaban porque eran demasiado lentas. Ejemplo: VAX INDEX. 

14. ¿Por qué las CPU comenzaron a correr a velocidades mayores que las de la memoria? 
    

Las CPU comenzaron a correr a velocidades mayores que las de la memoria porque se esperaba que la brecha entre la velocidad de la CPU y la memoria continuara aumentando, al menos durante la siguiente década, lo que hacía que los avances en la optimización del direccionamiento de memoria fueran insuficientes. 

15. ¿Por qué se sugiere que las constantes deberían almacenarse en los bits sin utilizar de otras instrucciones en el diseño RISC? 
    

Se sugiere que las constantes deberían almacenarse en los bits sin utilizar de otras instrucciones en el diseño RISC para disminuir el número de accesos a memoria y acelerar el proceso. 

16. ¿Por qué los sistemas operativos diseñados para microprocesadores CISC contemplaban la capacidad de subdividir un microprocesador en varios? 
    

Los sistemas operativos diseñados para microprocesadores CISC contemplaban la capacidad de subdividir un microprocesador en varios para reducir el número de instrucciones redundantes por cada instancia y permitir la ejecución de varias tareas en un mismo ciclo de reloj. 

17. ¿Qué relación existe entre la arquitectura del software optimizada y la ejecución de varias tareas en un mismo ciclo de reloj en plataformas CISC? 
    

Una arquitectura del software optimizada permite la ejecución de varias tareas en un mismo ciclo de reloj en plataformas CISC al reducir la cantidad de instrucciones redundantes y optimizar la asignación de memoria RAM a cada instancia del microprocesador. 

18. ¿Qué es un ciclo de procesador? 
    

Es un impulso electromagnético generado por un cristal de cuarzo.  

Segmentación y paralelismo 

19. ¿Qué diferencia fundamental existe entre la multitarea en arquitecturas CISC y RISC? 
    

En las arquitecturas CISC, la multitarea es aparente y se basa en prioridades, mientras que, en las arquitecturas RISC, la multitarea es real y se puede ejecutar simultáneamente.  RISC se enfoca en disponer de un conjunto de instrucciones pequeño que el programador tiene que saber manejar para poder facilitar el paralelismo de instrucciones. 

20. ¿Cómo se logra la multitarea en un microprocesador CISC tradicional? 
    

En un microprocesador CISC tradicional, se logra la multitarea asignando prioridades a las tareas y atendiendo una tarea instanciada en la RAM en cada ciclo de reloj, utilizando una cola FIFO para datos generados por el procesador y una cola LIFO para interrupciones de usuario. 

21. ¿Cómo funcionan los microprocesadores actuales en términos de multitarea? 
    

Los microprocesadores actuales son híbridos y permiten cierta multitarea real. La capa final al usuario se comporta como un CISC tradicional, pero las tareas que el usuario deja pendientes pueden traducirse (si el software es compatible) de CISC a RISC para ejecutarse a bajo nivel. Las tareas incompatibles con esta traducción se atienden en el tradicional pipeline o en tareas de bajo nivel. 

22. ¿Qué es un pipe line? Son los conjuntos de micro-instrucciones en las que se divide una tarea grande.  
    

23. ¿Qué es el TLP? Thread Level Parallelism   
    

24. ¿Cuáles son las dos metodologías para implementar el LTP? Multithreading, Permite que múltiples hilos se ejecuten en paralelo en un solo procesador. Multiprocesamiento, Utiliza múltiples procesadores para ejecutar múltiples hilos en paralelo.  
    

25. ¿Qué es un conjunto de instrucciones? Un conjunto de instrucciones es una especificación detallada de las instrucciones que una CPU de un ordenador puede entender y ejecutar.  
    

26. ¿Cuáles son los tipos de conjuntos de instrucciones que existen? CISC (Complex Instruction Set Computer), RISC (Reduced Instruction Set Computer) y SISC (Simple Instruction Set Computing).  
    

27. ¿Qué es un ciclo de CPU? Es un pulso electromagnético que genera el oscilador de cuarzo presente en todo procesador o microprocesador de computadora.  
    

28. ¿Qué determina la velocidad de funcionamiento el microprocesador? Es determinado por el ritmo de impulsos de su reloj.  
    

29. ¿Es la comparación de velocidad entre procesadores decisiva? No porque la velocidad del procesador es influenciada por otros parámetros como la memoria caché, etc.  
    

30. ¿Por qué el período de la frecuencia de reloj debe ser más largo que el tiempo que toma una señal moverse? Porque, de lo contrario, genera un retardo en el sistema.   
    

31. ¿Las meojras arquitectónicas por sí solas solucionan las desventajas de CPUs globalmente síncronas? No  
    

32. ¿Qué es el clock gating? Es un método para tratar la conmutación de componentes innecesarios.  
    

33. ¿Cómo funciona el clock gating? Implica apagar la señal del reloj a los componentes innecesarios, desactivándolos.  
    

34. ¿Qué es el paralelismo? Es un proceso que eficienta el procesamiento por parte del CPU operando varias instrucciones al mismo tiempo, en paralelo.  
    

35. ¿Qué tipoos de paralelistmos existen? Existe el paralelismo a nivel de instrucción y el paralelismo a nivel de hilo de ejecución.  
    

36. ¿Qué es el paralelismo a nivel de instrucción? Busca aumentar la tasa en la cual las instrucciones son ejecutadas dentro de un CPU.  
    

37. ¿Qué es el paralelismo a nivel de hilo de ejecución? Se propone incrementar el número de hilos que un CPU puede ejecutar simultáneamente.  
    

38. ¿Qué es la arquitectura superescalar? Es la arquitectura que ejecuta dos o más instrucciones por ciclo de reloj.  
    

39. ¿Qué niveles de paralelismo existen? Sub-escalar, escalar y super-escalar.  
    

40. ¿Qué es la arquitectura sub escalar? Es aquella a la que le toma más de un ciclo de reloj ejecutar una instrucción.  
    

41. ¿Qué es la arquitectura esclar? Es aquella que le toma un ciclo de reloj realizar una instrucción.  
    

MEMORIA CACHÉ 

42. ¿Qué es la memoria caché? Es una clase de memoria RAM estática (SRAM) de alta velocidad situada entre el microprocesador y la RAM.  
    

43. ¿Cuáles son los niveles de la memoria caché? Existen tres niveles de la memoria caché. L1, L2 y L3.  
    

44. ¿Cuál es la diferencia entre cada nivel? Cada nivel tiene un nivel de frecuencia mayor, ante mayor frecuencia mayor precio de producción. El nivel más alto, L1, funciona a la misma frecuencia del procesador; el segundo nivel, L2, funciona a la mitad de frecuencia del procesador y la última, L3 , a la mitad de frecuencia que L2.  
    

45. ¿Cuántas memorias tiene el procesador? Cada procesador viene con las memorias L1, L2, L3. Si un procesador tiene N núcleos, cada uno de los procesadores tendrá sus segmentos de caché.  
    

46. ¿Cuál es el objetivo de la memoria caché? El objetivo de la memoria caché es el de optimizar el proceso de datos e instrucciones y reducir el tiempo de acceso al espacio de memoria desde el CPU.  
    

47. ¿Qué tipos de caché existen? Existe el caché de hardware y el caché funcional.  
    

48. Desde el punto de caché de hardware, ¿Qué tipos de caché existen? Existe la caché interna y la caché externa.  
    

49. ¿Qué es la chacé interna? La caché interna, también denominada “caché principal” o “L1”. Son dos memorias caché, cada una con una misión específica. Una para datos y una para instrucciones.  
    

50. ¿Qué es la caché externa? También conocida como “caché secundaria" o "L2”. Es una memoria de acceso rápido incluida en la placa base, dispone de su propio bus y controlador que intercepta las llamadas a memoria entre el CPU y la RAM.  
    

51. ¿Qué es la caché de disco? Es un caché ubicado en la RAM, también llamada “caché funcional”. Es una caché destinada a contener los datos de disco que serán necesitados en un futuro próximo.   
    

52. ¿Qué es el sistema de memoria virtual? Es un mecanismo similar al de caché de disco, pero funciona en sentido inverso. Aloja en disco los datos que no pueden ser almacenados en la memoria RAM.  
    

53. ¿Cómo funciona el caché de disco? Se basa en dos esquemas “Read-ahead” y “Write-behind”. La primera anticipa lo que se necesitará de forma inmediata para traerlo a la caché, la segunda mantiene los datos en caché hasta que se desocupe el sistema de disco, mantienen los datos en memoria volátil.  
    

54. ¿Cuáles son las ventajas de la memoria caché? Acelera el procesamiento de las instrucciones de memoria en la CPU. Esto porque los ordenadores utilizan instrucciones y datos repetidamente. La caché contiene las instrucciones más usadas.  
    

55. ¿Qué es VCACHE? Es un controlador para sistemas de 32 bits que se basa en el funcionamiento de “Read-ahead” y “Write-behind”.   
    

56. ¿Qué es un caché oportunista? Es un tipo especial que puede considerar de aplicación. Se relaciona con los problemas de bloqueos de ficheros en entornos multiusuario donde distintas aplicaciones acceden a los mismos datos.  
    

57. ¿Qué es un “oplock”? Significa “Opportunistic locking”.  
    

58. ¿Qué hace el oplock? Es un sistema utilizado para aumentar el rendimiento de una red, este sistema obtiene una copia de la totalidad del fichero que se usa para almacenarlo en caché local para hacer operaciones más rápidas. 
    

Computadora digital 

59. ¿Qué es una computadora digital? Es una combinación de dispositivos y circuitos electrónicos organizados de tal forma que pueden realizar una secuencia programada de operaciones con un mínimo de intervención humana.   
    

60. ¿Cómo se le llama a una secuencia de operaciones? Se le denomina programa.   
    

61. ¿Qué arquitectura es la que usa la mayoría de computadoras? La arquitectura de Van Neuman.   
    

62. ¿Qué unidades forman parte de la arquitectura Von Neuman? 
    

- Procesador 
    
- Unidad de memoria 
    
- Unidad de entrada-salida 
    
- Unidad de control 
    

  

63. ¿Cuáles son los tres tipos de buses hay en el procesador? 
    

- Bus de datos 
    
- Bus de direcciones 
    
- Bus de control   
    

64. ¿Qué es el procesador? Es el dispositivo que ejecuta las instrucciones almacenadas en la memoria. 
    

65. ¿Qué es la unidad de memoria? Es un conjunto o arreglo de registros binarios de longitud definida en los cuales se puede almacenar instrucciones codificadas y datos.  
    

66. ¿Qué es la unidad de entrada-salida? La unidad de entrada-salida o puerto es un dispositivo empleado por la computadora para recibir o enviar datos al mundo exterior.  
    

67. ¿Cuál es la función de la unidad de control? La función de la unidad de control es coordinar la operación de todas las otras unidades.  
    

68. ¿Qué pasos son los que se ejecutan cíclicamente en un procesador? 
    

- Lee la dirección de memoria indicada por el apuntador de instrucciones. 
    
- Actualiza el apuntador de instrucciones para que apunte al siguiente byte. 
    

- Decodifica la instrucción. 
    
- Si es necesario, lee el valor del operando de la dirección de memoria indicada por el apuntador de instrucciones. 
    
- Si es necesario, actualiza el apuntador de instrucciones. 
    
- Ejecuta la instrucción y genera las señales para que: 
    

- La ALU ejecuta las operaciones indicadas por la instrucción. 
    

- Se almacena el resultado en el acumulador. 
    
- Se almacena en el registro de código de condiciones.  
    

69. ¿Cómo se le denomina al conjunto de instrucciones que puede ejecutar un procesador? 
    

Juego de instrucciones 

70. ¿Cuáles son las partes de las instrucciones?  
    

Operación y operandos 

71. ¿Qué es el código de operación? 
    

La codificación que se le hace a la operación que es hecha en secuencia binaria. 

72. ¿Cuál fue el primer avance significativo en la programación?  
    

La invención del lenguaje ensamblador 

73. ¿Qué es un mnemónico?  
    

Es la secuencia de caracteres que van a ser procesados en secuencia binaria.  

8086 

74. ¿Cuál es uno de los propósitos de los lenguajes de alto nivel mencionado en el texto? 
    

Uno de los propósitos de los lenguajes de alto nivel es ocultarle al programador los detalles del hardware de la computadora en la que se ejecutarán los programas que este escribe. 

75. ¿Por qué un programador de ensamblador debe tener un conocimiento más profundo del hardware? 
    

Un programador de ensamblador debe tener un conocimiento más profundo del hardware porque trabaja a un nivel más bajo y necesita comprender cómo funcionan los componentes del hardware, como el microprocesador y la memoria. 

76. ¿Cuáles son dos de los aspectos clave que debe conocer un programador de ensamblador sobre la computadora en la que se ejecutarán sus programas? 
    

Dos de los aspectos clave que debe conocer un programador de ensamblador son la organización de la memoria y el modelo de programación de su microprocesador. 

77. ¿Cómo se visualiza la memoria principal de una computadora según el texto? 
    

La memoria principal de una computadora se visualiza como una colección de localidades de memoria, cada una de un byte, con su propia dirección. 

78. ¿Cuál es la relación entre el tamaño de una dirección en bits y el número de localidades de memoria que se pueden direccionar? 
    

Una dirección de N bits nos permite direccionar 2N direcciones diferentes. 

79. ¿Qué tipo de información se almacena en la memoria principal de una computadora? 
    

En la memoria principal de una computadora se almacenan tanto los programas como los datos con que operan esos programas. 

80. ¿Por qué es necesario calcular direcciones de memoria durante la ejecución de un programa? 
    

Al estar ejecutando un programa, se requiere calcular las direcciones en las que están almacenadas las instrucciones y datos. 

81. ¿Cuáles son las dos formas en que el microprocesador puede visualizar u organizar la memoria en una computadora, según el texto? 
    

Según el texto, las dos formas en que el microprocesador puede visualizar u organizar la memoria son la memoria lineal y la memoria segmentada. 

82. ¿Qué esquema de memoria se considera el más simple y cuándo se usa generalmente? 
    

El esquema de memoria lineal es el más simple de todos y se usa generalmente en microprocesadores con capacidad de direccionamiento reducido, por lo general aquellos en los que la memoria no excede los 64 KB. 

83. ¿Cómo visualiza el microprocesador la memoria en el esquema de memoria segmentada? 
    

En el esquema de memoria segmentada, el microprocesador visualiza la memoria como dividida en segmentos de memoria y a cada segmento lo visualiza como un arreglo lineal de localidades de memoria de un byte. 

84. ¿Qué es una dirección de segmento y cómo se forma la dirección de una localidad de memoria en este esquema? 
    

Cada segmento tiene una dirección llamada dirección de segmento. La dirección de una localidad de memoria se forma a partir de la dirección del segmento que contiene a la localidad de memoria y al índice de la localidad de memoria dentro del segmento, conocido como desplazamiento. 

85. ¿En qué tipo de microprocesadores se utiliza comúnmente el esquema de memoria segmentada? 
    

El esquema de memoria segmentada se utiliza comúnmente en microprocesadores con capacidad de direccionamiento que excede los 64 KB. 

86. ¿Cuál es la capacidad de direccionamiento del microprocesador 8086 de Intel? 
    

El microprocesador 8086 de Intel permite direccionar 1 MB = 1,048,576 bytes. 

87. ¿Cuáles son las formas de operación del microprocesador 8086 para mantener compatibilidad con versiones anteriores y aprovechar su potencia total? 
    

El microprocesador 8086 tiene dos formas de operación: una que imita al microprocesador 8086 llamado modo real y otra que aprovecha todo el poder del procesador llamado modo protegido. 

88. ¿Cómo visualiza la memoria el microprocesador 8086 en el modo real y cuáles son las características de los segmentos en este modo? 
    

En el modo real, el microprocesador 8086 visualiza la memoria como dividida en segmentos. Algunas características de los segmentos en este modo incluyen que los segmentos no son divisiones físicas, empiezan cada 16 bytes, hay hasta 65,536 segmentos, el número del segmento se conoce como la dirección del segmento, y la dirección real de inicio de un segmento se obtiene multiplicando la dirección del segmento por 16. 

89. ¿Cuál es la capacidad máxima y mínima de los segmentos en el modo real del microprocesador 8086? 
    

En el modo real del microprocesador 8086, los segmentos pueden ser tan pequeños como 16 bytes y tan grandes como 64 KB = 65,536 bytes. 

90. ¿Pueden los segmentos traslaparse en el esquema de memoria segmentada? 
    

Sí, los segmentos pueden traslaparse en el esquema de memoria segmentada.