# CISC y RISC

La arquitectura es un conjunto de instrucciones, entre ellas CISC y RISC son las más comunes. 
Cada arquitectura tiene ventajas y desventajas, ya sea un cuello de botella o latencias altas. 
- CISC
- RICS

`NOTA: Arduino implementa la arquitectura harvard, y tiene todo lo necesario para considerarse una computadora.`

Implementar la tecnología a grandes escalas, es complicado. Permite llevar a cabo instrucciones paralelas en 64 bits es difícil porque _tener buses para 64 bits requiere que el CPU sea más grande_ y el aumento de tamaño trae más complicaciones, entre ellas las altas temperaturas

Las personas que observan las debilidades de Von Neumann plantean problemas con la tecnología RICS. Entonces surge **"CISC"**, plantean en no tener un conjunto de instrucciones que puedan hacer todo y mejor con un conjunto pequeña de instrucciones el programador _se las arregle_. 

| CISC | RISC |
|-|-|
|CISC es más ligero |RISC es mas rápido que CISC
|CISC no puede tener paralelismo debido a las instrucciones simples|Divide una tarea en multiples tareas, permitiendo paralelismo|
|EJ: 7\*4 se dividiria en una instruccion 7 + 7 + 7 + 7|EJ: 7 \* 4 en RICS tendria la instruccion MULT|
|CISC emula multitasking|RISC permite multitasking|

##### `NOTA: CISC se usa en paralelismo con con Harvard en los microcontroladores`
# Segmentación de instrucciones

Para que el paralelismo sea posible, las instrucciones tienen que poder segmentarse (dividirse). CISC es dificil de segmentar por las instrucciones son complejas. Como en RISC la filosofía es _instrucciones simples_ la segmentación es más fácil.

EJ: 

```
OPCION 1: Si quiero abrir un car wash. Se puede utilizar una máquina de las que hacen todo, colocan agua, jabón y espacio grande, pero para esto, necesitamos hacer una inversión monetaria alta, y para poder atender un nuevo carro primero debe terminar con el carro actual.

OPCION 2: combrar dos hidrolabadoras, un trapo, y contratar operarios, así 1 aplica el jabón, otro restriega el jabón y así sucesibamente. La ventaja de esta es que una vez se acumulan vehiculos, se pueden alternar tareas, uno lava el carro mientras otro lo enjabona.

CISC sería como comprar una maquina para hacerlo todo, al ser algo tan complejo, nos complica la segmentación de tareas.

RISC sería como la opción 2, al dividir en varias tareas, podemos ejecutar varias tareas de manera simultanea.
```

# Paralelismo

