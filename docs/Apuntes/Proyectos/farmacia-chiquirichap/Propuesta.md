# Informe de Requisitos del Sistema para la Gestión de Farmacia

## 1. Introducción

El objetivo de este sistema es gestionar integralmente las operaciones de una farmacia, incluyendo el control de inventario, la administración de usuarios y roles, la gestión de ventas, la emisión de tickets de entrega y la generación de reportes. Aunque se contempla la posibilidad de vender productos por unidad (por pastilla), se recomienda evaluar si esta funcionalidad es realmente conveniente para el negocio.

Cualquier duda o consulta puede comunicarse con los encargados de proyecto.

---

## 2. Gestión de Inventario

### 2.1 Registro de Productos

Cada producto almacenado en el inventario deberá contar con la siguiente información:

- **Casa farmacéutica:** Fabricante o distribuidor.
- **Nombre del fármaco:** Denominación del producto.
- **Variantes del producto:**
    - Ejemplos: Pastilla, oral, entre otros.
- **Cantidad de blisters (si aplica):** Número de blisters por caja.
- **Ingrediente activo:** Componente principal.
- **Tipo:** Comercial o genérico.
- **Precios:**
    - Precio por blister / unidad.
    - Precio por caja / docena.
- **Stock disponible:** Cantidad actual en inventario.

> **Nota interna:** Aunque es técnicamente posible vender por unidad (por pastilla), se debe evaluar la conveniencia y rentabilidad de esta modalidad.

### 2.2 Funcionalidades Adicionales en Inventario

- **Conversión de unidades:** Se debe permitir dividir una caja en blisters (cuando aplique).
- **Códigos de barras:**
    - Generación de códigos de barras para cada producto, con la opción de imprimirlos y pegarlos en el empaque correspondiente.
- **Carga masiva:**
    - Posibilidad de crear nuevos productos mediante la carga de un archivo Excel con un formato predefinido.

---

## 3. Gestión de Usuarios y Roles

### 3.1 Roles Definidos

- **Super Administrador:**
    - Acceso total al sistema, incluyendo reportes financieros.
- **Administrador:**
    - Gestión de usuarios, productos, precios y reportes (excepto los reportes financieros, que son exclusivos del Super Administrador). Además, un administrador podrá hacer todo lo que haga un vendedor
- **Cajeros/Vendedores:**
    - Realizan las ventas.
    - Al iniciar sesión en la computadora, se registra el usuario que abrió la caja.
    - La sesión permanece activa durante 24 horas.

### 3.2 Información a Registrar para Cajeros

- Nombre completo (contribuyente).
- Dirección.
- Teléfono personal.
- Correo electrónico.
- Fecha de nacimiento.
- Profesión o carrera.

### 3.3 Funcionalidades Adicionales de Gestión de Usuarios

- **Mantenimiento de cuentas:**
    - Creación, actualización y bloqueo de usuarios.
    - La gestión de contraseñas es responsabilidad individual: el administrador no podrá ver ni modificar las contraseñas de los usuarios.
- **Gafetes o Carnés:**
    - El administrador genera e imprime carné/gafete para los usuarios (excepto para los administradores). Este gafete servirá para poder validar la emisión de una factura, el carné debe contener un código de barras que identifique al usuario.

---

## 4. Gestión de Ventas

### 4.1 Proceso de Venta

- **Inicio de sesión del vendedor:**
    - El usuario de ventas se loguea en la computadora y, una vez autenticado, la aplicación permanece abierta para facilitar el proceso de venta.
- **Acceso al inventario:**
    - Durante la sesión, el vendedor tiene acceso a la pestaña de inventario, con la capacidad de buscar productos filtrando por:
        - Código de producto.
        - Nombre del producto.
        - Casa farmacéutica.
        - Ingrediente activo.
- **Proceso de venta:**
    - El vendedor agrega productos al "carrito" y puede modificar (agregar, borrar o editar la cantidad) en cualquier momento.
    - Para validar la venta, se requiere la verificación mediante el escaneo del carné del vendedor.

### 4.2 Registro y Seguimiento

- Se registra la sesión del vendedor, identificando el usuario que abrió la caja y garantizando la trazabilidad de las transacciones durante las 24 horas activas de la sesión.

---

## 5. Gestión de Tickets de Entrega

### 5.1 Información Contenida en el Ticket

Cada ticket de entrega (documento interno para validar la salida o entrada de productos) incluirá:

- **Datos de la empresa:**
    - Logo del sanatorio o farmacia.
    - Servicios que proporciona.
    - Número de teléfono.
    - Dirección física.
    - Sitio web (posible inclusión de código QR).
- **Datos del destinatario:**
    - NIT o CF de la persona que recibe el producto.
    - Dirección de entrega.
- **Detalles del producto:**
    - Lista de productos entregados.

> **Nota:** Cualquier cambio futuro en la información base del ticket (logo, datos de contacto, etc.) deberá coordinarse con el equipo de desarrollo.

---

## 6. Reportes y Tareas Programadas

### 6.1 Tipos de Reportes

El sistema debe generar los siguientes reportes:

- **Productos según fecha de vencimiento:**
    - **A punto de vencer:** Productos que vencen en un plazo de 0 a 3 meses.
    - **En línea:** Productos que vencen en el mes en curso.
    - **Vencidos:** Productos con vencimiento vencido hace al menos 1 mes.
- **Financieros:**
    - **Ventas:** Registro de ingresos generados.
    - **Gastos:** Registro de costos y otros gastos.
    - **Estado general:** Comparación entre ventas y gastos.

> **Acceso restringido:**
> - Los reportes financieros (Ventas, Gastos y Estado general) solo podrán ser solicitados y visualizados por el dueño de la empresa (super administrador).
> - Los otros reportes (productos con vencimiento) podrán ser accedidos por otros roles según lo definido.

### 6.2 Funcionalidades de Reportes

- **Visualización y Exportación:**
    - Los reportes podrán visualizarse en línea.
    - Opción de descargar los reportes en formato Excel para análisis adicionales.
- **Filtrado por fechas:**
    - Todos los reportes financieros y generales deben permitir filtrado por rango de fechas o mostrar un balance general.

### 6.3 Tareas Programadas

- **Generación automática de informes:**
    - Posibilidad de enviar un informe diario de operaciones al final del día de manera automática.
    - Alternativamente, el administrador podrá generar estos reportes manualmente accediendo a la aplicación.
- **Productos vencidos**
	- Se debe poder visualizar automáticamente los productos que han vencido, para que un administrador los marque como "desechados" y a su vez justificar el motivo por el que lo han sacado del inventario.

---

## 7. Descuentos

Los productos que estén cerca a entrar a estar "en linea" bajaran de precio progresivamente, sin embargo, requiero de la respuesta del dueño para saber si el sistema los irá definiendo automáticamente o se deberá colocar el precio por parte de un administrador.


# 8. Trazabilidad

Cualquier ingreso o salida del inventario debe estar guardado en el sistema, para poder asegurarse de quien y cuando ha ingresado algo o sacado del sistema.

---


Para garantizar que se han comprendido los requerimientos, se solicita al cliente solicitador del software que verifique las respuestas de las siguientes preguntas

- **Sobre la venta por unidad (pastilla):**    
    - **¿Existen condiciones específicas o excepcionales en las que se permita vender por unidad?**
	    - Solamente los productos que sean por blisters permitirá vender por blisters, no habrán casos excepcionales.
    - **¿Cómo se gestionará el precio y el stock cuando se divida una caja en unidades o blisters?**
	    - Se descomponer el producto en varios blisters con fecha de caducidad de la caja asociada.
- **Gestión de inventario:**
    - **¿Se requiere un historial o log de movimientos de inventario (entradas y salidas) para auditoría?**
	    - Si, es importante que cada vez que se elimine un producto o se "deseche" por fecha de expiración, se llene un formulario justificando el motivo de haber eliminado dichos productos y la entrada
    - **¿Habrá alertas automáticas (notificaciones) cuando el stock de un producto esté por debajo de un umbral definido?**
	    - El cliente no ha indicado un umbral, pero sugiero que se informe cuando el stock sea menor a 10 unidades.
- **Usuarios y Seguridad:**
    - **¿Se requiere algún nivel adicional de autenticación o auditoría en las sesiones de usuario (por ejemplo, registro de IP, ubicación, etc.)?**
	    - NO, no es necesario, el software es local, y siempre serán las mismas computadoras.
    - **¿Habrá diferentes permisos para modificar precios, o es una función exclusiva de administradores y super administradores?**
	    - Tanto administrador como super administrador podrán hacerlo.
- **Tickets y Documentos:**
    - **¿El diseño del ticket (logo, servicios, etc.) será fijo o deberá ser configurable a través del sistema?**
	    - Sera fijo, cualquier cambio sera implementado por el programador, será parte del mantenimiento.
    - **¿Se requiere la integración con impresoras específicas o el sistema debe soportar impresión en diferentes formatos?**
	    - Se debe poder usar cualquier impresora genérica, para reducir costos y poder usar impresoras de casa.
- **Reportes Financieros:**
    - **¿Qué nivel de detalle se requiere en los reportes de ventas y gastos?**
	    - DEBE RESPONDERLA EL CLIENTE, quiere que se filtre por productos? por fechas y productos? ... no cuento con información suficiente para esto
    - **¿Se integrará el sistema con otro software contable o ERP?**
	    - NO, todo debe ser manejado por el software a la medida, sin embargo, se piensa hacer crecer la app para incluir al sanatorio
- **Tareas programadas:**    
    - **¿Con qué frecuencia se deben generar y enviar los informes automáticos?**
	    - Diario, mediante correo electrónico o whatsapp, el cliente lo debe confirmar
    - **¿Qué medios (correo electrónico, notificaciones en la aplicación, etc.) se utilizarán para la distribución de estos informes?**
	    - Correos electronicos o no. de telefono

---

# Conclusión

El sistema propuesto abarca las funcionalidades esenciales para la gestión de una farmacia, desde el control detallado de inventario hasta la administración de usuarios y la generación de reportes. La inclusión de funcionalidades adicionales, como la integración con otros sistemas o la gestión de promociones, dependerá de las necesidades específicas del cliente y de futuras consideraciones de escalabilidad.

Este informe debe servir como base para futuras discusiones y para la elaboración de un documento de especificaciones técnicas más detallado, en el que se incluirán todos los aspectos funcionales y no funcionales definidos en conjunto con el cliente.

