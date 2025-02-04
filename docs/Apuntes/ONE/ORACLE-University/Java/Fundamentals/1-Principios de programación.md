Un programa(software) es un conjunto de instrucciones que intentan cumplir un propósito.
Una computadora(hardware) ejecuta programas siguiendo las instrucciones que este da.

## Historia
Las primeras computadoras fueron tabletas perforadas, un mecanismo que controlaba el funcionamiento de una maquina para hacer algo. Formaban parte de un loop, uniendo la ultima tarjeta con la primera, es algo parecido a binarios si lo pensamos de la misma manera.
Cada forma de representar los bites, eran una _instrucción_, originalmente, estas sirvieron para crear patrones en telas.
Esto solo eran los inicios, no eran capaces de hacer operaciones complejas.

Hoy en día, las computadoras pueden hacer de todo, procesar texto, correr juegos, reproducir música...

### Tipos y propósitos de las computadoras
Cada computadora tiene objetivos distintos a cumplir, aunque puedan realizar un poco de todo, servidores, laptops, teléfonos, impresoras...
Pero los programas también tienen diferentes propósitos.

La computadora funciona interpretando 0 y 1, todas las computadoras usan una CPU para interpretar estos bits y ejecutar la instrucción que represente. ***a veces los programas pueden ser corridos en distintas plataformas sin modificar el código**

## Funcionamiento

Las computadoras leen instrucciones, que son 0 y 1, pero a mayor complejidad del lenguaje, la computadora menos logra entender la instrucción.
Tienen mecanismos simples que procesan los datos, usando transistores para saber si transmitir o no una señal, con estas cosas simples, podemos crear mecanismos complejos.

## Cómo se produce un código?
La computadora entiende instrucciones binarias, pero no es algo legible para nosotros como humanos, por eso hemos creado lenguajes de programación.
Compilador o interprete, tomará las instrucciones que hemos escrito legibles y las convertirá en instrucciones que la computadora logra entender.

# Lenguaje alto nivel y bajo nivel
Un lenguaje de bajo nivel representa el **mnemonic** que la computadora entiende, permite escribir instrucciones realmente optimizadas para cada tipo de arquitectura. Pero NO son _cross platform_

Un lenguaje de alto nivel, es interpretable por el humano, y permite escribir instrucciones para diferentes tipos de computadoras. Y pueden o no ser multi plataforma.

### Lenguajes especializados vs lenguajes de uso general
Los lenguajes especializados, son los que son creados para algo en especifico, sea HTML, SQL...
- Tienen un propósito
- Fueron optimizados para una tarea en específico
- No sirven fuera del dominio para el que fueron creados

Los lenguajes de uso general, son lo contrario.
- Diseñados para resolver distintos problemas
- Son flexibles, pero no están optimizados para algo en específico.
- Tiene un rango de dominio grande, puede ser usado para muchas cosas.

## Mezclar lenguajes en una aplicación
Las aplicaciones a veces usan muchos lenguajes para ejecutarse, los navegadores están hechos en C++, pero interpreter y genera se renderiza con HTML y la lógica corre con JavaScript.

### ¿Qué es un programa?

Es un conjunto de instrucciones que la computadora ejecuta, los programadores producen código de alto nivel que luego es interpretado o compilado a lenguaje de bajo nivel.

Tenemos 2 formas de correr un programa, mediante archivos compilados o interpretados.
- El archivo compilado es la producción binaria más optimizada de todo el programa
- Un archivo interpretado es un programa que internamente genera un archivo binario temporal e inmediatamente lo corre mientras se va ejecutando el código.
## Elementos de un programa de computador
- Datos
- Lógica
- Flujo de las instrucciones

Funciona como una cinta transportadora, donde las cajas son la información, la lógica es el orden en el que las cajas van llegando, y el flujo es cómo un operario o maquina va manipulando las cajas para clasificaras.

### Organización de la memoria del programa
La memoria de un programa contiene tanto lo datos, como el mismo programa en sí.
La memoria es organizada usando variables, haciendo referencia a unidades de almacenamiento. 
El CPU, necesita saber en dónde se encuentra cada archivo y su instrucción asociada, el CPU obtiene la información desde la memoria y actúa según la instrucción que tenga.

