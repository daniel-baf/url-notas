
En este archivo exploreremos la serie de fibonacci
# FIBONACCII

LENGUAJES DE PROGRAMACIÓN DE DISTINTOS PARADIGMAS PARA PROGRAMAR FIBONACCI

## JavaScript

**En forma de loop**

```
// javascript

function _fibonnacci(_base) {
    let _start_value = 0;
    let _next_value = 1;

    for(let i = 0; i < _base; i ++) {
        let _backup = _start_value;
        _start_value = _next_value; 
        _next_value = _backup + _next_value;
        console.log((i + 1) + ": " + _backup);
    }   
}

_fibonnacci(10)

```

***Recursivo***

```
function recursiveFibonacci(_iterations, _current = 0, _next = 1, _count = 0) {
  if (_count >= _iterations) {
    return;
  }

  console.log(_current);

  // Llamamos a la función recursivamente con los siguientes números de Fibonacci
  recursiveFibonacci(_iterations, _next, _current + _next, _count + 1);
}

// Llamamos a la función e indicamos cuántos números de Fibonacci queremos imprimir (por ejemplo, 10)
recursiveFibonacci(20);
```

## C++

***Usando ciclos***

```
#include <iostream>

void printFibonacci(int _iterations) {
  int current = 0;
  int next = 1;

  for (int i = 0; i < _iterations; i++) {
    std::cout << current << std::endl;
    int temp = current;
    current = next;
    next = temp + next;
  }
}

int main() {
  // Llamamos a la función e indicamos cuántos números de Fibonacci queremos imprimir (por ejemplo, 10)
  int iterations = 10;
  printFibonacci(iterations);

  return 0;
}
```

***Recursivo no. 1***

```
#include <iostream>

// Función para calcular el número Fibonacci en la posición n
int fibonacci(int n) {
    if (n == 0) {
        return 0;
    } else if (n == 1) {
        return 1;
    } else {
        int a = 0;
        int b = 1;
        int result = 0;
        
        for (int i = 2; i <= n; ++i) {
            result = a + b;
            a = b;
            b = result;
        }
        
        return result;
    }
}

int main() {
    int n;
    std::cout << "Ingrese el valor de n: ";
    std::cin >> n;

    std::cout << "La secuencia de Fibonacci hasta el término " << n << " es:" << std::endl;
    for (int i = 0; i <= n; ++i) {
        std::cout << fibonacci(i) << " ";
    }

    return 0;
}
```

***Recursivo no. 2***

```
#include <iostream>

void printFibonacciRecursive(int _iterations, int current = 0, int next = 1, int count = 0) {
  if (count >= _iterations) {
    return;
  }

  std::cout << current << std::endl;

  // Llamamos a la función recursivamente con los siguientes números de Fibonacci
  printFibonacciRecursive(_iterations, next, current + next, count + 1);
}

int main() {
  // Llamamos a la función e indicamos cuántos números de Fibonacci queremos imprimir (por ejemplo, 10)
  int iterations = 80;
  printFibonacciRecursive(iterations);

  return 0;
}

```
# Fase 2, información sobre el lenguaje

## C++

### **Características principales del lenguaje:**

- **Lenguaje de programación de alto nivel:** C++ es un lenguaje de programación de alto nivel que permite a los programadores escribir código más fácilmente comprensible y mantenible en comparación con lenguajes de bajo nivel como el lenguaje ensamblador.

- **Orientación a objetos:** C++ es un lenguaje orientado a objetos, lo que significa que permite la creación de clases y objetos para modelar problemas del mundo real, lo que facilita la organización y reutilización del código.

- **Rendimiento:** C++ se utiliza en aplicaciones que requieren un alto rendimiento, como juegos, sistemas operativos y aplicaciones de tiempo real, gracias a su capacidad para trabajar a nivel de hardware y optimización.

- **Librerías estándar:** C++ tiene una amplia librería estándar que proporciona muchas funciones y estructuras de datos predefinidas para simplificar el desarrollo de software.

### **Ventajas y desventajas:**

**Ventajas:**

- Alto rendimiento y control de recursos.
- Versatilidad en el desarrollo de aplicaciones, incluidas aplicaciones de sistemas y juegos.
- Amplia comunidad y soporte.
- Orientación a objetos que facilita la reutilización de código.

**Desventajas:**

- Mayor complejidad en comparación con algunos lenguajes de programación más modernos.
- Mayor riesgo de errores de programación debido a la gestión manual de memoria.
- Curva de aprendizaje más empinada para principiantes.

#### **Usos más comunes del lenguaje:**

- Desarrollo de juegos.
- Programación de sistemas y control de hardware.
- Aplicaciones de tiempo real, como sistemas de control y robótica.
- Aplicaciones científicas y matemáticas.

### **Ejemplos de casos ideales para el lenguaje:**

- Creación de un motor de juegos para un videojuego de alto rendimiento.
- Programación de un sistema operativo o controladores de dispositivo.
- Desarrollo de software para aplicaciones de simulación científica.

## JavaScript

### **Características principales del lenguaje:**

- **Lenguaje de scripting:** JavaScript es un lenguaje de scripting que se ejecuta en el navegador web del cliente, lo que lo hace ideal para el desarrollo web.

- **Lenguaje de alto nivel:** JavaScript es un lenguaje de alto nivel con una sintaxis sencilla que facilita la escritura de código.

- **Orientación a objetos:** Aunque JavaScript es multiparadigma, se utiliza comúnmente para programación orientada a objetos, lo que permite la creación de objetos y prototipos.

- **Interacción con el DOM:** JavaScript se utiliza para manipular el Document Object Model (DOM) en las páginas web, lo que permite crear páginas web dinámicas e interactivas.

### **Ventajas y desventajas:**

**Ventajas:**

- Ampliamente utilizado en el desarrollo web, lo que lo hace esencial para crear sitios web interactivos.
- Fácil de aprender y utilizar para tareas en el lado del cliente.
- Comunidad activa y muchas bibliotecas y marcos de trabajo disponibles.

**Desventajas:**

- Limitado al entorno del navegador para el lado del cliente.
- Rendimiento más lento en comparación con lenguajes compilados.
- Dificultades de seguridad en el lado del cliente si no se maneja adecuadamente.

#### **Usos más comunes del lenguaje:**

- Desarrollo web (front-end): Creación de sitios web dinámicos e interactivos.
- Desarrollo web (back-end): Uso de Node.js para construir servidores y aplicaciones del lado del servidor.
- Aplicaciones de servidor en tiempo real, como aplicaciones de chat en tiempo real.

### **Ejemplos de casos ideales para el lenguaje:**

- Creación de una aplicación web interactiva que responde a eventos del usuario.
- Desarrollo de un sitio web de comercio electrónico con funcionalidades de carrito de compras y pagos en línea.
- Construcción de una aplicación de chat en tiempo real utilizando Node.js y WebSocket.

# Tabla comparativa

Esta tabla proporciona una comparación rápida de los aspectos clave de C++ y JavaScript en términos de características, ventajas, desventajas, usos comunes y ejemplos de casos ideales.

| Aspecto                   | C++                                                                                                  | JavaScript                                                                                          |
|---------------------------|------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------|
| **Características Principales** | - Lenguaje de alto nivel - Orientación a objetos - Rendimiento - Librerías estándar                 | - Lenguaje de scripting - Lenguaje de alto nivel - Orientación a objetos - Interacción con el DOM  |
| **Ventajas**              | - Alto rendimiento y control de recursos - Versatilidad en desarrollo - Amplia comunidad y soporte - Orientación a objetos  | - Ampliamente utilizado en desarrollo web - Fácil de aprender - Comunidad activa - Interacción con el DOM |
| **Desventajas**           | - Mayor complejidad - Mayor riesgo de errores - Curva de aprendizaje empinada                         | - Limitado al entorno del navegador - Rendimiento más lento - Desafíos de seguridad                  |
| **Usos Comunes**          | - Desarrollo de juegos - Programación de sistemas - Aplicaciones de tiempo real - Aplicaciones científicas  | - Desarrollo web (front-end) - Desarrollo web (back-end) - Aplicaciones de servidor en tiempo real   |
| **Ejemplos de Casos Ideales** | - Motor de juegos de alto rendimiento - Sistemas operativos y controladores - Simulación científica | - Aplicación web interactiva - Sitio web de comercio electrónico - Aplicación de chat en tiempo real |

