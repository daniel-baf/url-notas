Es la forma en la que distribuimos los archivos, tenemos varios tipos de distribuirlos.

`ej. al formatear un dispositivo elegimos el formato`

$$
1 ZB = 1 \text{ billion TB}
$$


|                            | MBR  | GPT   |
| -------------------------- | ---- | ----- |
| Maximum Partition Capacity | 2 TB | 9.4ZB |
| ...                        |      |       |

Tenemos 2 tablas, una que nos dice el nombre, el tipo, extension... y otra tabla que nos dice los sectores de los archivos.

Tabla de información

| N   | T   | Tip | Seg. I | ... |
| --- | --- | --- | ------ | --- |
|     |     |     | xx     |     |

Tabla de segmentos

| I   | N   |
| --- | --- |
| xx  | xx1 |
| xx1 | xx2 |
| xx2 | ... |

**DE ESTA FORMA FUNCIONA FAT 32**

File allocation Table
Directory Table Format

Todos pueden leer este tipo de archivos, por ser viejo, sin embargo, su contra es el espacio que cada archivo ocupa, creando tablas.

## NTFS

Ntfs, fue la mejora de FAT32, 

- Permite journaling
- Admite permisos avanzados, ej access control list (ACL)

Permite guardar elementos de archivos para cuando algo está incompleto y recuperarse en caso de una interrupción. Es por esto que podemos reparar unidades.

## EXT

Usado por linux, tenemos EXT, EXT2, EXT3... Funciona, implementando arboles b, la estructura de los EXT, usa nodos i

- Hay una estructura de 15 nodos

| NODO                                        |
| ------------------------------------------- |
| METADATOS                                   |
| 12 nodos apuntando a los bloques (sectores) |
| 13vo nodo                                   |

El problema con esto es la fragmentación

## APFS
Es el nuevo sistema para ahora que se usan los discos de estados solido en MacOs

## HFS y HFS+

Anteriormente se usaba en MacOs cuando usaban discos magnéticos.

**Microsoft es dueño de NTFS y Apple es dueño de HFS**


## MBR vs GPT


## CD

Los discos, dvd.. usan joliet, udf.. entre otros sistemas de archivos.
