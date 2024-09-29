
Pruebas de validación, pueden ser alfa y beta.

## ALFA

Se hacen pruebas orientadas en un ambiente controlado

## BETA

Se hacen fuera del ambiente controlado y el cliente las hace

# Pruebas de Validación

**Validación** es ver que se haya implementado lo que el cliente esperaba
**Verificación** es ver que todo este funcionando correctamente


# Pruebas del sistema

Cuando ocurre un error en el sistema, es común que los desarrolladores se culpen unos a otros, se deben anticipar los potenciales problemas de interfaz y sistema.

- Diseñar rutas de manejo de errores que prueben toda la información proveniente de otros elementos del sistema
- Realizar una serie de pruebas que simulen los datos


Cada prueba tiene un propósito diferente pero sirven para que **todo se pueda verificar**.

# Pruebas de recuperación

Si la recuperación es automática, se evalúa el reinicio, los mecanismos de puntos de verificación, la recuperación de datos y reanudación correspondiente.

Si la recuperación requiere intervención humana, se evalúa el tiempo medio de recuperación.


# Pruebas de seguridad

Durante la prueba, el diseñador del software debe hacer que el esfuerzo para penetrar un sistema sea mucho mayor que el valor de los datos obtenidos.

# Prueba de esfuerzo

Ejecuta el sistema en forma que demanda recursos en cantidad frecuencia o volumen anormales.


# Pruebas de rendimiento

El objetivo de la prueba, es determinar el rendimiento del sistema bajo una carga de trabajo definida.

las **pruebas funcionales** son un tipo de prueba que buscan establecer si cada característica de la aplicación funcionan según los requisitos de software. Cada función se compara con el requisito correspondiente para determinar si su resultado se ajusta a la expectativa del usuario final.


## Prueba de carga

Evalúa cómo actúa el sistema con una carga variable del usuario pero dentro de los niveles esperados de la aplicación


## Prueba de estrés

Evalúa el sistema sometiéndolo a una carga creciente hasta que este falle. Esta prueba permitirá identificar cuellos de botella, y reconocer qué carga máxima admitida por la aplicación hasta que esta empiece con problemas de rendimiento.

# Pruebas de despliegue

PRUEBA DE CONFIGURACIÓN, ejecuta el software en cada entorno que debe operar. Examina todos los procedimientos de instalación y 


## CARACTERÍSTICAS PRUEBAS

- Tiene alta probabilidad de encontrar un error
- No es redundante
- Debe ser "la mayor de la camada". Debe usarse  la prueba que tenga mayor probabilidad de descubrir errores
- Una prueba no debe ser demasiado simple o demasiado compleja

