## Abrir Puertos para el Proyecto

Para que el proyecto funcione correctamente, asegúrate de que el puerto `8000/tcp` esté abierto en el firewall de tu sistema. Esto permitirá la comunicación entre los dispositivos IoT y el servidor de inteligencia artificial.

### Pasos para abrir el puerto 8000/tcp

```bash
# Verifica si el puerto 8000/tcp está abierto
sudo firewall-cmd --list-ports

# Abre el puerto 8000/tcp de forma permanente
sudo firewall-cmd --add-port=8000/tcp --permanent

# Recarga la configuración del firewall para aplicar los cambios
sudo firewall-cmd --reload
```

---

## ¿Qué hace este proyecto?

Este proyecto combina tecnologías de **Internet de las Cosas (IoT)** con **Inteligencia Artificial (IA)** para identificar sonidos específicos captados por sensores conectados. Cuando se detecta un audio relevante, el sistema utiliza IA para analizarlo y, si corresponde, envía notificaciones automáticas a los usuarios o sistemas interesados. Esto permite una respuesta rápida y automatizada ante eventos detectados por el sistema de audio inteligente.

---

## Formatear una MicroUSB en FAT32 para el Proyecto

Para utilizar una tarjeta MicroUSB (o microSD con adaptador USB) en este proyecto, es necesario formatearla en FAT32. Sigue estos pasos en Linux:

1. **Identifica el dispositivo**  
    Conecta la MicroUSB y ejecuta:
    ```bash
    lsblk
    ```
    Busca el nombre de dispositivo (por ejemplo, `/dev/sdb`).

2. **Limpia la unidad**  
    Elimina firmas previas:
    ```bash
    sudo wipefs -a /dev/sdb
    ```

3. **Crea una nueva tabla de particiones y partición FAT32**  
    Inicia `fdisk`:
    ```bash
    sudo fdisk /dev/sdb
    ```
    - Presiona `o` para nueva tabla DOS.
    - Presiona `n` para nueva partición primaria.
    - Presiona `p`, luego `1`, ENTER, ENTER (acepta valores por defecto).
    - Presiona `t`, escribe `c` para tipo FAT32 LBA.
    - Presiona `w` para guardar y salir.

4. **Formatea la partición en FAT32**  
    ```bash
    sudo mkfs.vfat -F 32 /dev/sdb1 -n ESP32_SD
    ```

5. **Monta la partición**  
    ```bash
    udisksctl mount -b /dev/sdb1
    ```

6. **Verifica el montaje**  
    ```bash
    df -T | grep sdb
    ```

> **Precaución:** Asegúrate de seleccionar el dispositivo correcto para evitar pérdida de datos.

---

## Enlaces Útiles para Probar el IoT Aplicado

| Categoría               | Enlaces                                                                                   |
|-------------------------|------------------------------------------------------------------------------------------|
| **Perros**              | [Video 1](https://youtube.com/shorts/oxHtVMmnn98?si=A0Iib9LI6D2vALUF) <br> [Video 2](https://youtube.com/shorts/lcPM9oXniks?si=Fv8X2diqrsVaMaYV) |
| **Niños jugando**       | [Video 1](https://www.youtube.com/watch?v=23RnQvUDc2Q) <br> [Video 2](https://www.youtube.com/watch?v=AC89lFyJkOk) |
| **Aire acondicionado**  | [Video 1](https://www.youtube.com/watch?v=wq9crFekOAM) <br> [Video 2](https://www.youtube.com/watch?v=idSKb7zzOeM) |
| **Música callejera**    | [Video 1](https://www.youtube.com/watch?v=3_52q0djIrA&list=PLPMubEX64yKeACtGdP65ssX7KTbxb1e1z&index=3) <br> [Video 2](https://www.youtube.com/shorts/V1T8iRI4BAU) |
| **Martillo neumático**  | [Video 1](https://www.youtube.com/watch?v=iHM745t9J04) <br> [Video 2](https://www.youtube.com/shorts/KZr1iZAMUK4) |
| **Motor coche ralentí** | [Video 1](https://www.youtube.com/shorts/btahNYcsjXk) <br> [Video 2](https://www.youtube.com/watch?v=7_ozSYsQ43E) <br> [Video 3](https://www.youtube.com/watch?v=2CJ1jBMwR38) |
| **Taladro**             | [Video 1](https://www.youtube.com/watch?v=DFkYv8K1RB4) <br> [Video 2](https://www.youtube.com/watch?v=XPPnykVoTec) |
| **Sirenas**             | [Video 1](https://www.youtube.com/watch?v=HXEife8Oor8) <br> [Video 2](https://www.youtube.com/watch?v=j18y12VDGLc) |
| **Bocina de auto**      | [Video 1](https://www.youtube.com/watch?v=Q5d4TxrAjaY) <br> [Video 2](https://www.youtube.com/watch?v=RiZgaBhQNFg) <br> [Video 3](https://www.youtube.com/watch?v=9Kd899uKP0E) |
| **Disparos**            | [Video 1](https://www.youtube.com/watch?v=3Ekuc7W0fDY) <br> [Video 2](https://www.youtube.com/shorts/IvRVbnUIVmw) <br> [Video 3](https://www.youtube.com/watch?v=8u1-JILEx5Y) |

