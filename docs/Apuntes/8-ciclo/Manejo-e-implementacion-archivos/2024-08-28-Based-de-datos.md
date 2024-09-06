
| NOMBRE                          | CARNET  |
| ------------------------------- | ------- |
| Daniel Eduardo Bautista Fuentes | 2121323 |
# ¿Cómo divide MariaDB la información de sus bases de datos?

- **Archivos de Datos**: Estos contienen los registros y los índices de las tablas.
	- **InnoDB**: Usa archivos `.ibd` para almacenar los datos y los índices de cada tabla.
    - **MyISAM**: Usa archivos `.MYD` para almacenar los datos y `.MYI` para los índices.
- **Archivos de Esquema**: Usados para definir la estructura de las tablas.
	-  Los archivos `.frm` contienen la definición del esquema de cada tabla, independientemente del motor de almacenamiento.
- **Archivos de Registro y Control**: Estos se utilizan para gestionar transacciones, garantizar la integridad de los datos, y facilitar la replicación y la recuperación.
    - **InnoDB**: Utiliza archivos de registro de transacciones como `ib_logfile0` y `ib_logfile1` y archivos de espacio de tabla compartido como `ibdata1`.
    - **Binarios y Aria**: Los registros binarios (`.bin`) y los archivos de control para Aria (ej. `aria_log.00000001`) también se utilizan para la replicación y la recuperación.

## ¿Qué archivos guarda MariaDB para la gestión de sus bases de datos? 
__(archivos que la base de datos, NO de configuración)__

- **Archivos de Datos (`.ibd`, `.MYD`, `.MYI`)**
    - `.ibd (InnoDB Data File)`
    - `.MYD (MyISAM Data File)`
    - `.MYI (MyISAM Index File)`
- **Archivos de Esquema (`.frm`)**
    - `.frm (Format File)`
- **Archivos de Registro de Transacciones (`ib_logfile0`, `ib_logfile1`)**
    - `ib_logfileX (InnoDB Log Files)`
- **Archivos de Espacio de Tabla Compartido (`ibdata1`)**
    - `ibdataX (InnoDB Shared Tablespace Files)`
- **Archivos de Registro de Binarios (`.bin`)**
    - `.bin (Binary Log Files)`
- **Archivos de Control (`aria_log.00000001`, etc.)**
    - `Aria Log Files`

### Ruta Predeterminada de Almacenamiento

- **Linux/Unix**: `/var/lib/mysql/`
- **Windows**: `C:\Program Files\MariaDB\MariaDB <version>\data\`


1. **Directorio de Datos Predeterminado**:
    - En la mayoría de las instalaciones de MariaDB en sistemas Linux o Unix, el directorio de datos predeterminado es `/var/lib/mysql/`. Este es el lugar donde se almacenan los archivos de datos (`.ibd`, `.MYD`, `.MYI`), los archivos de esquema (`.frm`), y los archivos de registro y control (`ib_logfile0`, `ib_logfile1`, etc.).
    - En sistemas Windows, la ruta predeterminada es típica mente en el directorio de instalación, dentro de una sub carpeta `data`, como por ejemplo `C:\Program Files\MariaDB\MariaDB <version>\data\`.
2. **Cambiar la Ubicación del Directorio de Datos**:
    - La ubicación del directorio de datos puede ser modificada cambiando el valor de la variable `datadir` en el archivo de configuración de MariaDB (`my.cnf` en Linux/Unix o `my.ini` en Windows). Por ejemplo:

## ¿Qué información se guarda en cada uno de estos archivos?

### 1. **Archivos de Datos (`.ibd`, `.MYD`, `.MYI`)**

- **.ibd (InnoDB Data File)**: Estos archivos son específicos del motor de almacenamiento InnoDB, que es el motor de almacenamiento por defecto en MariaDB. Cada tabla de InnoDB se almacena en un archivo `.ibd` separado, que contiene tanto los datos de la tabla como los índices asociados. Esto se conoce como "innodb_file_per_table" y es una configuración común que permite un manejo más fácil del espacio en disco y la administración de datos.
    
- **.MYD (MyISAM Data File)**: Para el motor de almacenamiento MyISAM, los datos de la tabla se almacenan en archivos `.MYD`. Cada tabla tiene su propio archivo `.MYD` que contiene todos los registros de esa tabla.
    
- **.MYI (MyISAM Index File)**: Los índices de las tablas MyISAM se almacenan en archivos `.MYI`. Al igual que los archivos `.MYD`, cada tabla tiene su archivo `.MYI` correspondiente, que almacena los índices asociados con los datos de la tabla para facilitar las búsquedas rápidas.
    

### 2. **Archivos de Esquema (`.frm`)**

- **.frm (Format File)**: Los archivos `.frm` contienen la definición del esquema de las tablas, es decir, la estructura de la tabla, incluyendo nombres de columnas, tipos de datos, restricciones, etc. Cada tabla, independientemente del motor de almacenamiento, tiene un archivo `.frm` asociado.

### 3. **Archivos de Registro de Transacciones (`ib_logfile0`, `ib_logfile1`)**

- **ib_logfileX (InnoDB Log Files)**: MariaDB utiliza archivos de registro de transacciones para el motor InnoDB. Estos archivos (`ib_logfile0`, `ib_logfile1`, etc.) contienen información sobre las transacciones pendientes y los cambios en los datos. Son esenciales para la recuperación en caso de un fallo del sistema, ya que permiten a InnoDB rehacer o deshacer cambios para garantizar la consistencia de los datos.

### 4. **Archivos de Espacio de Tabla Compartido (`ibdata1`)**

- **ibdataX (InnoDB Shared Tablespace Files)**: Aunque cada tabla InnoDB generalmente tiene su propio archivo `.ibd`, todavía puede haber un espacio de tabla compartido que contiene datos globales, metadatos y otros elementos de gestión de transacciones. El archivo `ibdata1` es el archivo de espacio de tabla compartido predeterminado.

### 5. **Archivos de Registro de Binarios (`.bin`)**

- **.bin (Binary Log Files)**: Los archivos de registro binario son usados para la replicación y recuperación de datos. Contienen un registro de todas las modificaciones realizadas en las bases de datos, lo que permite a los servidores de réplicas reproducir los mismos cambios.

### 6. **Archivos de Control (`aria_log.00000001`, etc.)**

- **Aria Log Files**: Si se utiliza el motor Aria (un reemplazo moderno para MyISAM), los archivos de control de Aria contienen información sobre las transacciones y los cambios realizados, similares a los archivos de registro de InnoDB.

# Seguridad

## ¿Por qué es necesario tener seguridad en una base de datos?

Gestiona la seguridad de los datos a través de varios mecanismos y características diseñados para proteger tanto el acceso a la base de datos como la integridad y confidencialidad de los datos almacenados.

- **Autenticación y Control de Acceso**
	- **Usuarios y Privilegios**: MariaDB permite la creación de usuarios con diferentes niveles de acceso y privilegios específicos. Se puede definir qué operaciones (SELECT, INSERT, UPDATE, DELETE, etc.) puede realizar cada usuario en cada base de datos o tabla.
	- **Roles**: Los roles permiten agrupar privilegios y asignarlos a usuarios, facilitando la administración de permisos.
    - **Plugins de Autenticación**: MariaDB soporta varios plugins de autenticación, incluyendo autenticación por contraseña, autenticación PAM (Pluggable Authentication Modules), LDAP, y autenticación a través de sistemas operativos.
- **Cifrado de Datos**
	 **Cifrado en Reposo**: MariaDB soporta el cifrado de datos en reposo, lo que significa que los archivos de datos y de registro pueden ser cifrados para proteger la información almacenada. Esto incluye el cifrado de tablas InnoDB y Aria.
    - **Cifrado de Conexión**: Utiliza SSL/TLS para cifrar las conexiones entre el cliente y el servidor, garantizando que los datos transmitidos estén protegidos contra intercepciones y ataques man-in-the-middle.
-  **Seguridad en la Red**
	- **Firewall**: MariaDB incluye un firewall que permite definir reglas para bloquear o permitir conexiones basadas en direcciones IP, nombres de host o patrones de usuarios, limitando así el acceso no autorizado.
	- **Configuraciones de Red**: Se pueden aplicar configuraciones de seguridad de red, como limitar el acceso solo a ciertas interfaces de red, o a través de túneles seguros.
-  **Auditoría y Registro**
	- **Plugins de Auditoría**: MariaDB ofrece plugins de auditoría que permiten registrar todas las actividades de la base de datos, incluyendo acceso de usuarios y cambios en los datos. Esto es crucial para el cumplimiento de regulaciones y para la detección de comportamientos sospechosos.
	- **Registro Binario**: Los registros binarios pueden ser utilizados para monitorear y replicar transacciones, además de proporcionar un historial de cambios que pueden ser utilizados para auditoría.
 - **Prevención de Ataques**
	- **Protección contra Inyecciones SQL**: MariaDB recomienda el uso de consultas preparadas y bind parameters para protegerse contra inyecciones SQL.
	- **Configuraciones de Seguridad**: Ajustes como el límite de conexiones fallidas, tiempo de espera de conexión, y otras configuraciones específicas ayudan a prevenir ataques de fuerza bruta y de denegación de servicio.
    

## ¿Por qué es necesario tener seguridad en una base de datos?

La seguridad en una base de datos es esencial para proteger la confidencialidad de los datos sensibles que almacena, como información personal, financiera o médica. Sin medidas de seguridad adecuadas, estos datos pueden ser vulnerables a accesos no autorizados y a diversos tipos de ciberataques, lo que podría resultar en robos de identidad, fraudes o daños financieros tanto para los individuos como para las organizaciones.
Además, muchas organizaciones están obligadas a cumplir con regulaciones y leyes de protección de datos, como el GDPR en Europa o el CCPA en California. El incumplimiento de estas normativas puede llevar a sanciones legales severas, multas significativas y daños a la reputación. Por último, la seguridad de la base de datos es fundamental para mantener la confianza de los clientes y socios comerciales, ya que una violación de datos puede afectar gravemente la imagen y la credibilidad de una empresa, llevando a la pérdida de clientes y de oportunidades de negocio.

## ¿Cuáles son las mejores prácticas para el aseguramiento de los datos en una base de datos?

- Utilizar el principio de mínimos privilegios para otorgar solo los permisos necesarios.
- Implementar autenticación fuerte, incluyendo autenticación de dos factores (2FA) y políticas de contraseñas seguras.
- Utilizar roles y grupos de usuarios para gestionar permisos de forma eficiente.
- Implementar cifrado de datos en reposo para proteger los archivos almacenados, incluidas copias de seguridad y archivos de registro.
- Utilizar cifrado de datos en tránsito con protocolos seguros como SSL/TLS.
- Realizar auditorías y monitoreo continuo para detectar accesos no autorizados o actividades sospechosas.
- Implementar registros de auditoría detallados para rastrear cambios y accesos a la base de datos.
- Aplicar actualizaciones y parches de seguridad regularmente para proteger contra vulnerabilidades conocidas.
- Configurar un firewall de base de datos para limitar el acceso basado en direcciones IP y patrones de tráfico.
- Realizar copias de seguridad regulares y asegurarse de que estén cifradas y almacenadas en ubicaciones seguras.
- Desactivar o eliminar servicios y características innecesarias para reducir la superficie de ataque.
- Configurar políticas de bloqueo y limitación de intentos de conexión fallidos para prevenir ataques de fuerza bruta.
- Utilizar herramientas de detección y prevención de intrusiones para proteger contra amenazas y ataques en tiempo real.
- Realizar pruebas de seguridad y evaluaciones de vulnerabilidad periódicas para identificar y mitigar riesgos potenciales.

