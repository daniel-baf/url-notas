"""
    DANIEL EDUARDO BAUTISTA FUENTES
    2121323

    CREACION, MANEJO Y OPERACIONES CON ARCHIVOS APILADOS

    ESTRUCTURA DEL ARCHIVO
    LEN FECHA 1byte EDAD 3bytes NIT LEN EMIAL LEN NOMBRE 
        ... REPITE ...
            LEN FECHA

"""

from os import path
from datetime import datetime


FILE_NAME = "apilado.bin"


# limpia la consola
def clear_screen():
    print("\033c", end="")


# crea un archivo y escribe su texto
def escribir_bytes(nombre_archivo: str, bytes: bytearray, append=False):
    mode = "ab" if append else "wb"
    with open(nombre_archivo, mode) as file:
        file.write(bytes)


# configura el archivo para mostrar siempre al inicio del archivo la ultima fecha de modificacion
def configura_archivo_apilado(filename):
    # Obtener el timestamp como entero
    timestamp = int(datetime.now().timestamp())
    len_date = (
        timestamp.bit_length() + 7
    ) // 8  # Calcula los bytes necesarios para almacenar el entero
    len_date_bytes = len_date.to_bytes(1, byteorder="big")
    timestamp_bytes = timestamp.to_bytes(len_date, byteorder="big")

    bytes_array = len_date_bytes + timestamp_bytes

    if not path.exists(filename):
        # Si el archivo no existe, lo crea con el contenido inicial
        escribir_bytes(filename, bytes_array)
    else:
        # Si el archivo existe, se modifica el primer byte y los siguientes bytes con los nuevos datos
        with open(filename, "r+b") as archivo:
            archivo.seek(0)  # Va al inicio del archivo
            archivo.write(bytes_array)  # Sobrescribe con los nuevos datos


# lee el archivo e imprime la informacion
def imprimir_archivo(filename):
    try:
        with open(filename, "rb") as file:
            n_bytes = int.from_bytes(file.read(1), byteorder="big")  # primer apuntador
            timestamp = int.from_bytes(file.read(n_bytes))  # fecha
            print(f"Fecha de modificacion: {datetime.fromtimestamp(timestamp)}")
            while True:
                segment = manejar_segmento_archivo(file)

                if not segment:
                    break

                print(
                    f"{'-'*40}\n\tNombre: {segment['nombre']}\n\tEdad: {segment['edad']}\n\tNIT: {segment['nit']}\n\tEmail: {segment['email']}"
                )

        input("\nPresione enter para continuar...")
    except Exception as e:
        print(f"\tERROR AL IMPRIMIR EL ARCHIVO {e}")


# funcion que retorna un JSON con los datos de un segmento de datos para el archivo apilado
def manejar_segmento_archivo(file):
    try:
        registro = {}
        n_bytes = int.from_bytes(file.read(1), byteorder="big")  # primer apuntador
        if n_bytes == 0:
            return {}

        registro["nombre"] = file.read(n_bytes).decode("utf-8")  # nombre
        n_bytes = int.from_bytes(file.read(1), byteorder="big")  # tercer apuntador
        registro["edad"] = int.from_bytes(file.read(n_bytes), byteorder="big")  # edad
        n_bytes = int.from_bytes(file.read(1), byteorder="big")  # cuarto apuntador
        registro["nit"] = file.read(n_bytes).decode("utf-8")  # nit
        n_bytes = int.from_bytes(file.read(1), byteorder="big")  # quinto apuntador
        registro["email"] = file.read(n_bytes).decode("utf-8")  # email
        return registro
    except Exception as e:
        print(f"\tERROR AL LEER EL ARCHIVO {e}")
        return {}


# recibe la informacion para guardar en el archivo
def leer_datos(filename):
    datos = {}
    try:
        nombre = input("Nombre: ")
        edad = int(input("Edad: "))
        nit = input("NIT: ")
        # trim del nit para longitud de 10
        nit = nit[:8].strip() if len(nit) > 8 else nit
        email = input("E mail: ")

        # convertir numeros a bytes
        nombre = nombre.encode("utf-8")
        email = email.encode("utf-8")
        nit = nit.encode("utf-8")
        edad = edad.to_bytes(1, byteorder="big")
        datos = {"nombre": nombre, "edad": edad, "nit": nit, "email": email}
    except Exception as e:
        print(f"\tERROR AL LEER LOS DATOS {e}")
        input("\nPresione enter para continuar...")
        datos = {}
    finally:
        if datos == {}:
            return  # no hacer nada
        bytes = bytearray()
        for key, value in datos.items():
            len_value = len(value).to_bytes(1, byteorder="big")
            bytes += len_value + value
        configura_archivo_apilado(filename)
        escribir_bytes(filename, bytes, True)


def print_menu():
    print(f"--- MENU ---\n\t1. Ingresar datos\n\t2. Mostrar datos\n\t0. Salir\n")
    return int(input("Opcion: "))


def main():
    option = -1
    while option != 0:
        clear_screen()
        option = print_menu()
        if option == 0:
            exit()
        elif option == 1:
            leer_datos(FILE_NAME)
        elif option == 2:
            imprimir_archivo(FILE_NAME)


if __name__ == "__main__":
    main()
