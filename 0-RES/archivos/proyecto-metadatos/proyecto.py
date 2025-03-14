"""
    PROYECTO PARA LA LECTURA DE METADATOS EN UN GIF

    DANIEL BAUTISTA
    CHRISTIAN VILLEGAS


    DATOS A EXTRAER
    * Numero de version
    * Tamaño de la imagen
    * Cantidad de colores
    Tipo de compresión de imagen
    Formato numérico
    * Color de fondo
    Cantidad de imagenes que contiene
    Fecha de creación
    Comentarios agreados

    BUSCAMOS OBTENER LOS METADATOS DE UN GIF Y DEVOLVERLOS EN UN HASHMAP
    SIN UTILIZAR LIBRERIAS EXTERNAS
"""

import struct
from pprint import pprint

# Diccionario global que contiene los separadores de bloques
SEPARADORES_BLOQUES = {
    "imagen": b"\x2C",
    "bloque_inicial": b"\x21",
    "fin": b"\x3B",
    "control_grafico": b"\xF9",
    "comentario": b"\xFE",
}


def obtener_metadatos_resolucion(logical_screen_descriptor: bytearray) -> dict:
    ancho, alto, packed, fondo, proporcion_pixeles = struct.unpack(
        "<HHBBB", logical_screen_descriptor
    )
    return {
        "ancho": ancho,
        "alto": alto,
        "paleta_global": bool(
            packed & 0b10000000
        ),  # Bit 7: indica si existe una paleta global
        "fondo": fondo,
        "proporcion_pixeles": proporcion_pixeles,
        "bits_color": ((packed & 0b01110000) >> 4)
        + 1,  # Bits 4-6: Número de bits por pixel
        "packed": packed,
    }


def leer_paleta_global(f, packed: bytearray) -> dict:
    tamanio_paleta = 3 * (2 ** ((packed & 0b00000111) + 1))  # Tamaño de la paleta
    paleta_global = f.read(tamanio_paleta)
    return list(struct.iter_unpack("BBB", paleta_global))  # Lista de tuplas (R, G, B)


def leer_bloque_imagen(f) -> dict:
    imagen_descriptor = f.read(9)
    x_offset, y_offset, ancho_img, alto_img, packed_img = struct.unpack(
        "<HHHHB", imagen_descriptor
    )
    imagen_data = {
        "tipo": "imagen",
        "x_offset": x_offset,
        "y_offset": y_offset,
        "ancho_img": ancho_img,
        "alto_img": alto_img,
        "entrelazado": bool(
            packed_img & 0b01000000
        ),  # Bit 6: Indica si está entrelazado
    }

    # Leer datos comprimidos (LZW)
    tamanio_codigo_inicial = struct.unpack("B", f.read(1))[0]
    imagen_data["tamanio_codigo_lzw"] = tamanio_codigo_inicial

    datos_comprimidos = []
    while True:
        tamanio_subbloque = struct.unpack("B", f.read(1))[0]
        if tamanio_subbloque == 0:
            break
        datos_comprimidos.append(f.read(tamanio_subbloque))

    imagen_data["datos_comprimidos"] = datos_comprimidos
    return imagen_data


def leer_control_grafico(f) -> dict:
    f.read(1)  # Tamaño de la extensión
    packed_fields = struct.unpack("B", f.read(1))[0]
    delay_time = struct.unpack("<H", f.read(2))[0]  # Retraso en centésimas de segundo
    color_transparente = struct.unpack("B", f.read(1))[0]
    f.read(1)  # Terminador de extensión

    return {
        "tipo": "control_grafico",
        "transparente": bool(packed_fields & 0b00000001),
        "disposicion": (packed_fields & 0b00011100) >> 2,  # Disposición de marco
        "tiempo_retraso": delay_time,
        "color_transparente": color_transparente,
    }


def leer_comentario(f) -> dict:
    comentarios = []
    while True:
        tamanio_subbloque = struct.unpack("B", f.read(1))[0]
        if tamanio_subbloque == 0:
            break  # Fin del bloque de comentario
        comentarios.append(f.read(tamanio_subbloque))

    return b"".join(comentarios).decode(
        "ascii", errors="ignore"
    )  # Unir y decodificar los comentarios


def leer_gif(gif_path) -> dict:
    metadatos = {}

    with open(gif_path, "rb") as f:
        # Cabecera (6 bytes)
        metadatos["header"] = f.read(6).decode("ascii")  # Ej: GIF89a

        # Descripción de pantalla lógica (7 bytes)
        logical_screen_descriptor = f.read(7)
        metadatos["pantalla"] = obtener_metadatos_resolucion(logical_screen_descriptor)
        packed = metadatos["pantalla"]["packed"]
        del metadatos["pantalla"]["packed"]

        # Paleta global
        if metadatos["pantalla"]["paleta_global"]:
            metadatos["paleta_global_colores"] = leer_paleta_global(f, packed)
            metadatos["paleta_global_colores"] = {
                "cantidad": len(metadatos["paleta_global_colores"]),
                "colores": metadatos["paleta_global_colores"],
            }

        bloques = []
        while True:
            bloque_inicial = f.read(1)
            if bloque_inicial == SEPARADORES_BLOQUES["fin"]:  # Fin del archivo GIF
                metadatos["fin"] = "Archivo terminado"
                break
            elif bloque_inicial == SEPARADORES_BLOQUES["imagen"]:  # Bloque de imagen
                bloques.append(leer_bloque_imagen(f))
            elif (
                bloque_inicial == SEPARADORES_BLOQUES["bloque_inicial"]
            ):  # Extensiones (control gráfico o comentario)
                extension_label = f.read(1)
                if (
                    extension_label == SEPARADORES_BLOQUES["control_grafico"]
                ):  # Extensión de control gráfico
                    bloques.append(leer_control_grafico(f))
                elif (
                    extension_label == SEPARADORES_BLOQUES["comentario"]
                ):  # Extensión de comentario
                    comentario = leer_comentario(f)
                    bloques.append({"tipo": "comentario", "contenido": comentario})
            else:
                tamanio_saltado = struct.unpack("B", f.read(1))[0]
                f.read(tamanio_saltado)  # Saltar el bloque

        metadatos["bloques"] = bloques

    return metadatos


# Usar la función
# limpiar consola
print("\033c")
gif_metadatos = leer_gif("shremp-shremps.gif")
gif_metadatos["paleta_global_colores"]["colores"] = {}
pprint(gif_metadatos)
