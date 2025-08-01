"""
    DANIEL EDUARDO BAUTISTA FUENTES
    2121323

    LECTURA DE UN ARCHIVO APILADO
"""


# limpia la consola
def clear_screen():
    print("\033c", end="")


# crea un archivo y escribe su texto
def crear_archivo(nombre_archivo: str, texto: str, append=False):
    permisos = "w"
    permisos = "w" if (not append or (not path.exists(nombre_archivo))) else "a"
    with open(nombre_archivo, permisos) as archivo:
        archivo.write(texto)


# funcion para leer un archivo byte por byte
def leer_archivo_byte(nombre_archivo: str):
    n_bytes = 1
    is_pointer = True
    rows = []
    data = []
    with open(nombre_archivo, "rb") as archivo:
        byte = archivo.read(n_bytes)
        is_pointer = False
        while byte:
            n_bytes = 1 if is_pointer else int.from_bytes(byte, "big")
            is_pointer = not is_pointer

            byte = archivo.read(n_bytes)
            if is_pointer:
                # pasar de byte a string
                item = byte.decode("utf-8")
                data.append(item)
                if data.__len__() == 3:
                    rows.append(data)
                    data = []

    return rows


def formato_estudiantes(estudiantes):
    for index, estudiante in enumerate(estudiantes):
        print(f"-- ESTUDANTE {index + 1}")
        print(f"\tCarne: {estudiante[0]}")
        print(f"\tApellido: {estudiante[1]}")
        print(f"\tNombre: {estudiante[2]}\n")


def main():
    datos = leer_archivo_byte("Apilado.bin")
    formato_estudiantes(datos)


if __name__ == "__main__":
    main()
