# Conceptos basicos de Sistemas Operativos

- Archivos y sistemas de archivos
- Seguridad
- Shell


## Cuadros conceptuales sobre conceptos de sistemas operativos:

**1. Archivos y el Sistema de Archivos**

- **Concepto:**
    - Abstracción de las peculiaridades de los dispositivos de almacenamiento.
    - Presentan un modelo limpio y uniforme al programador.
- **Funciones principales:**
    - Crear archivos.
    - Eliminar archivos.
    - Leer archivos.
    - Escribir en archivos.
- **Directorios:**
    - Agrupan archivos.
    - Facilitan la organización.
    - Ejemplo: directorios para cursos, correo, etc.
- **Organización jerárquica:**
    - Estructuras profundas y persistentes.
    - Diferencias con la jerarquía de procesos:
        - Los procesos tienen un tiempo de vida corto.
        - Las jerarquías de archivos son más complejas y pueden existir por años.
- **Rutas:**
    - Absolutas: desde el directorio raíz (ej. /Docentes/Prof.Brown/Cursos/CS101).
    - Relativas: dependen del directorio actual.
- **Sistemas de archivos montados:**
    - Adjuntar un sistema de archivos externo (CD-ROM, USB) al árbol principal.
    - Ejemplo: un CD-ROM se puede acceder como parte del directorio raíz.
    - Suelen ubicarse en directorios vacíos.
- **Archivos especiales:**
    - Simulan dispositivos de E/S como archivos.
    - Tipos:
        - De bloque: acceso aleatorio (ej. discos).
        - De carácter: flujos continuos de datos (ej. impresoras).
    - Son archivos temporales o que definen dispositivos para el sistema.
    - Permiten el acceso de E/S a controladores de dispositivos.
    - Ejemplos: FIFO, de bloques, de caracteres, Acme, Archfs, Cdfs, etc.

**2. Entrada/Salida (E/S)**

- **Administración de dispositivos:**
    - El sistema operativo incluye un subsistema de E/S.
    - Tipos de software:
        - Genérico: aplica a múltiples dispositivos.
        - Drivers: específicos para cada dispositivo.
- **Ejemplos de dispositivos:**
    - Teclados.
    - Monitores.
    - Impresoras.
    - El subsistema de E/S gestiona la interacción entre hardware y software.

**3. Protección**

- **Seguridad de archivos:**
    - Código binario de protección (9 bits) en UNIX.
    - Campos:
        - Propietario.
        - Grupo del propietario.
        - Otros usuarios.
    - Bits rwx: permisos de lectura, escritura y ejecución.
- **Protección contra intrusos:**
    - Amenazas humanas (usuarios no autorizados).
    - Amenazas no humanas (virus).

**4. El Shell**

- **Definición:**
    - Intérprete de comandos que interactúa con el sistema operativo.
- **Funcionamiento:**
    - Ejemplo: el usuario escribe "date", el shell ejecuta el programa y devuelve el resultado.
- **Funcionalidades:**
    - Redirección de entrada/salida.
        - Ejemplo: "date > archivo" escribe la salida en un archivo.
    - Uso de canales (pipes).
        - Ejemplo: "cat archivo1 archivo2 | sort > /dev/lp" ordena archivos y los envía a la impresora.
    - Ejecución en segundo plano.
        - El comando con "&" permite seguir trabajando mientras el proceso se ejecuta.
- **Comparación con GUIs:**
    - Las GUIs son un shell gráfico que funciona encima del sistema operativo.
    - Ejemplos: GNOME y KDE en Linux.

