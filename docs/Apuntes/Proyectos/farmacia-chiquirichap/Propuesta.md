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
    - Pastilla
    - Oral
    - Supositorio
    - ...
    - El administrador podrá crear las variantes
- **Cantidad de sub-paquetes que tiene (si aplica):** Número de blísteres por caja.
	- El administrador deberá marcar que contiene sub paquetes y la cantidad
	- ej. si la caja tiene blísters, o si tiene varias pastillas.
- **Ingrediente activo:** Componente principal.
	- Servirá para el filtrado
- **Tipo:** Comercial o genérico.
- **Si es producto popular**
	- Esto servirá para saber si se puede o no vender por unidad, el administrador deberá marcar los que si se vendan por unidad
- **Precios:**
    - Precio por blíster / unidad.
    - Precio por caja / docena.
- **Stock disponible:** Cantidad actual en inventario.
	- Solamente podrá verse cuántas hay y no deberá permitir abrir una caja si otra ya existe.

> Después de haber discutido, concluimos que **sí se solicita el vender por unidad**, por lo que antes de aceptar la propuesta, solicitamos respondernos a las siguientes preguntas.
> 1. ¿Qué hacemos si se pierden unidades?
> 2. ¿Se pueden abrir varias cajas del mismo, o solo 1 a la vez
> 3. Si el sistema indica que existe 1 paquete abierto pero no se encuentra, ¿Quién debe habilitar el sistema para poder abrir una caja y marcar como pérdida económica la caja *extraviada*?

### 2.2 Funcionalidades Adicionales en Inventario

- **Conversión de unidades:** Se debe permitir dividir una caja en sub - paquetes (cuando aplique, ej. blíster, ampollas...).
- **Códigos de barras:**
    - Generación de códigos de barras para cada producto, con la opción de imprimirlos y pegarlos en el empaque correspondiente.
    - Puesto que no pueden haber 2 cajas del mismo producto abiertos, entonces la venta por unidad será vinculada a la supuesta caja que se encuentra abierta, así eliminamos el tener que imprimir códigos de barra para cada producto por pastilla.
- **Carga masiva:**
    - Entendemos que es tedioso el crear productos 1 a 1, así que permitiremos cargar un archivo de Excel con un formato definido para que se carguen varios productos a la base de datos.

---

## 3. Gestión de Usuarios y Roles

### 3.1 Roles Definidos

- **Super Administrador:**
    - Acceso total al sistema, incluyendo reportes financieros.
- **Administrador:**
    - Gestión de usuarios, productos, variantes de los productos, precios y reportes (excepto los reportes financieros, que son exclusivos del Super Administrador). Además, un administrador podrá hacer todo lo que haga un vendedor
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

> Solicitamos responder las siguientes preguntas para poder modificar el proceso de la venta
> 1. ¿Los usuarios rotan?, o el trabajador permanece únicamente en una farmacia según planilla

### 3.3 Funcionalidades Adicionales de Gestión de Usuarios

- **Mantenimiento de cuentas:**
    - Creación, actualización y bloqueo de usuarios.
    - La gestión de contraseñas es responsabilidad individual: el administrador no podrá ver ni modificar las contraseñas de los usuarios.
    - El administrador podrá bloquear el acceso a un usuario solamente si está debajo de él según la jerarquía.
- **Gafetes o Carnés:**
    - El administrador genera e imprime carné/gafete para los usuarios (excepto para los administradores). Este gafete servirá para poder validar la emisión de una factura, el carné debe contener un código de barras que identifique al usuario.

---

## 4. Gestión de Ventas

### 4.1 Proceso de Venta

Luego de la segunda junta, se llegó a la conclusión de que el software será usado para varias farmacias, así que se ha modificado el proceso de la venta.

- **Inicio de sesión del vendedor:**
	- El usuario deberá iniciar sesión en la computadora, y lo primero que se hará, será ingresar su usuario y contraseña
	- Si los datos son válidos, se le solicitará al usuario la sucursal en la que se encuentra
	- Se generará una sesión temporal, de 24 horas donde todas las consultas de inventario, ventas... se asociarán a la tienda seleccionada.
		- En cualquier momento se podrá cambiar de sucursal, será responsabilidad del vendedor asegurarse de que ha ingresado en la sucursal correspondiente, además se le informará al usuario qué sucursal está seleccionada al momento de realizar un ticket.
	- Cuando un usuario quiera realizar una venta, deberá escanear su gafete para poder
- **Acceso al inventario:**
    - Durante la sesión, el vendedor tiene acceso a la pestaña de inventario que corresponde a la sucursal seleccionada durante el inicio de sesión, con la capacidad de buscar productos filtrando por:
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
> Las ediciones de este ticket son parte del mantenimiento a menos que se requiera una re estructuración total de la forma del ticket, en este caso, se deberá generar una cotización para el cambio.

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

Los productos que estén cerca a entrar a estar "en linea" bajaran de precio progresivamente.

> Requiero de la respuesta del dueño para saber si el sistema los irá definiendo automáticamente o se deberá colocar el precio por parte de un administrador.


# 8. Trazabilidad

Cualquier ingreso o salida del inventario debe estar guardado en el sistema, para poder asegurarse de quien y cuando ha ingresado algo o sacado del sistema.
Esto incluye, el comprar productos, el vender productos, el desechar productos vencidos, o marcar productos como extraviados.
Todo deberá quedar como un registro, guardando

- que ha entrado o salido
- quien lo ha aprobado
- cuando se ha generado el registro

---


Para garantizar que se han comprendido los requerimientos, se solicita al cliente solicitador del software que verifique las respuestas de las siguientes preguntas

- **Sobre la venta por unidad (pastilla):**    
    - **El administrador será la persona encargada de marcar los productos que se pueden vender por unidad o subpaquetes**
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
	    - Sera fijo, cualquier cambio será implementado por el programador, el mantenimiento incluye únicamente cambio de colores, logos, tipografías. 
	    - Si el cliente solicitante del software quiere cambiar completamente el ticket, esto no será parte del mantenimiento y se deberá generar un presupuesto para hacer los cambios.
    - **¿Se requiere la integración con impresoras específicas o el sistema debe soportar impresión en diferentes formatos?**
	    - Se debe poder usar cualquier impresora genérica, para reducir costos y poder usar impresoras de casa.
- **Reportes Financieros:**
    - **¿Qué nivel de detalle se requiere en los reportes de ventas y gastos?**
	> DEBE RESPONDERLA EL CLIENTE, quiere que se filtre por productos? por fechas y productos ... no cuento con información suficiente para esto
	
	- **¿Se integrará el sistema con otro software contable o ERP?**
	    - NO, todo debe ser manejado por el software a la medida, sin embargo, el software está pensado para ser iterado, si a futuro el cliente quiere más funcionalidades, como el envío de mercadería entre sucursales... deberá ser solicitado y sujeto a nueva cotización, no es parte del mantenimiento.
- **Tareas programadas:**    
    - **¿Con qué frecuencia se deben generar y enviar los informes automáticos?**
	    - Diario, mediante correo electrónico o WhatsApp, **el cliente lo debe confirmar por dónde se enviará el mensaje**


---

# Presupuesto

**Cliente**: Farmacias Zuriel
**Encargados**: Daniel Eduardo Bautista Fuentes y Oscar Humberto Sánchez Sapón
**Vigencia de este presupuesto**: del 27 de febrero del 2025 al 6 de marzo del 2025


![[Pasted image 20250227225530.png]]


**OBSERVACIONES**

- El presupuesto final es de Q11,000.00, esto cubre el desarrollo, puesta en marcha del servidor y capacitación del cliente y sus empleados en el uso del software.
- El pago mensual será de Q752.50
- No se incluye la venta de hardware, como impresoras, escáneres o laptops en este presupuesto, si el cliente desea que nosotros lo coticemos, puede solicitarlo y le entregaremos el hardware con su costo respectivo.

--- 
El sistema propuesto abarca las funcionalidades solicitadas por el cliente para la gestión de una farmacia, desde el control detallado de inventario hasta la administración de usuarios y la generación de reportes. La inclusión de funcionalidades adicionales, como la integración con otros sistemas o la gestión de promociones, dependerá de las necesidades específicas del cliente y de futuras consideraciones de escalabilidad.

Este informe debe servir como base para futuras discusiones y para la elaboración de un documento de especificaciones técnicas más detallado, en el que se incluirán todos los aspectos funcionales y no funcionales definidos en conjunto con el cliente.

**27 de febrero de 2025**

Después de haber discutido las nuevas necesidades con el cliente, este documento ha sido actualizado para reflejar las solicitudes realizadas. Estamos abiertos a modificaciones, eliminaciones o inclusiones de funcionalidades en el software. Sin embargo, cualquier cambio que se pacte antes de la aceptación del servicio será reflejado en el presupuesto. En caso de que se soliciten modificaciones adicionales después de la confirmación, estas se cobrarán por separado.

Una vez confirmada la aceptación del software, solicitamos un plazo de 7 días para la elaboración y firma del contrato legal correspondiente. Después de la firma del contrato, se deberá realizar el pago del 25% del total acordado, dentro de los 30 días siguientes a la firma.

El cliente no está obligado a responder afirmativamente a este documento ni a firmar el contrato. Este informe sirve como guía preliminar antes de la confirmación legal mediante un contrato formal. Se entregará una copia del contrato al cliente, quien tendrá un plazo de 4 días para revisarlo y firmarlo. Solo una vez firmado el contrato, ambas partes estarán obligadas a cumplir con los términos acordados.