Que tomamos en cuenta para saber cuanto espacio requerimos para llevar un control de estudiantes de un sistema.
¿Cómo determinamos cuánto espacio necesitamos?
1. Definir los datos que vamos a guardar
	1. Titulo diversificado
	2. DPI
	3. Kardex
	4. Admisión
2. Calcular el espacio para cada elemento


EJEMPLO para almacenamiento de una clínica.
1. Laboratorios
2. Historial de enfermedades
3. DPI
4. Rayos x


EJEMPLO: Constructora
1. Materiales
2. Planos
3. Crono-grama
4. Fotografías
5. Programas

También tenemos que tomar en cuenta, el tipo de archivo a guardar, si es audio, video, imágenes... 
Luego el tamaño máximo de cada archivo
La forma en que debemos organizar los archivos, por ejemplo, por nombre, fechas, tiempo, usuario...
El tiempo que se va tener cada archivo antes de borrarse.
Se deja un % de almacenamiento extra en caso de imprevistos.

Supongamos que un estudiante ocupa 60MB, y hay 31 mil estudiantes, y luego ingresan 5 mil estudiantes cada año aproximadamente, y se desean guardar los datos durante 20 años.

![[Pasted image 20240807112218.png]]

$$
60 * (31,0000 + 5000*20) = 7.86 \text{ TB}
$$

$$
7.86\text{ TB} *( 1.35 ) = 10.6 \text{ TB}
$$

Debemos controlar lo que el usuario puede hacer, limitar el tipo de archivo y configurar **cuotas**. Estas cuotas, son ponerle un máximo al archivo que el usuario puede colocar, las cuotas son por usuario, agrupación de información o "recurso compartido".
**Limpiezas** de los archivos, ya sean periódicas o preventivas, y por último **alertas** o reportes.


**UMBRALES**, son los delimitadores de las carpetas, existen 2, el de alerta y máximo. 

## PRE ALOJAMIENTO

al llegar a un límite, antes de llegar al tiempo previsto. ya sea por mala planificación o cambio en los requerimientos.
Se hace una estadística para ver los patrones en los que han ido creciendo los requerimientos de almacenamiento, usando el mismo esquema que hemos trabajado.
