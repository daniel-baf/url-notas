

yes > /dev/null &

top


**Preguntas para los estudiantes:**
**• ¿Cuál es el porcentaje de CPU utilizado por el proceso?**
esta usando el 90% del CPU y tiende a subir al 6%, pero el ventilador y temperatura no estan subiendo, todo se mantiene normal

**• ¿Cómo cambia en diferentes sistemas operativos?**

renice 19 -p $(pidof yes)

**¿El uso de CPU cambió?**

Se mantuvo igual, no se sintio diferencia alguna


taskset -c 0 yes > /dev/null &


**¿El proceso tardó más en ejecutarse?**
Se tardo lo mismo, simlemente se encendieron mis ventiladores, pero el % de uso de CPU sigue siendo el 6%

**¿Qué sucede con la carga de CPU en cada núcleo?**

El CPU 1 al 5 estaban usando el 100% mientras que del 5 al 16 solo el 2%

# Análisis y Conclusión

Después de experimentar, discutir en grupo:

• ¿Qué diferencias encontraron entre Windows y Linux?

No se si sea la computadora, pero en ambos me corrio fluido, nunca se trabo, en windows usaba el 8% del CPU por cada proceso, asi que en este caso, linux lo manejó mejor.

• ¿Qué sistema operativo permite más control sobre la planificación de CPU?

Ambas, sin embargo es mas practico en linux, los comandos son mas cortos

• ¿Cómo pueden optimizarse los procesos en entornos multitarea?

Habilitando tareas por tiempos iguales, sin las prioridades.