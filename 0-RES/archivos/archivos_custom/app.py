"""
    DANIEL EDUARDO BAUTISTA FUENTES
    2121323

    1. Agregar un conpcepto y su definicion (separar por :)
    2. Listar Conceptos y sus definiciones
    3. Mostrar la cantidad de palabras almacenadas en el archivo
"""

from os import path

FILE_NAME = "conceptos.arc"


# limpia la consola
def clear_screen():
    print("\033c", end="")


# crea un archivo y escribe su texto
def crear_archivo(nombre_archivo: str, texto: str, append=False):
    permisos = "w"
    permisos = "w" if (not append or (not path.exists(nombre_archivo))) else "a"
    with open(nombre_archivo, permisos) as archivo:
        archivo.write(texto)


# funcion generica para abrir un archivo
def abrir_archivo(nombre_archivo: str):
    with open(nombre_archivo, "r") as archivo:
        return archivo.readlines()


# crea un concepto en el archivo
def ingresar_concepto():
    concepto = input("Concepto: ")
    definicion = input("Definicion: ")
    crear_archivo(FILE_NAME, f"{concepto.strip()}:{definicion.strip()}\n", True)


# imprime los conceptos en el archivo
def imprimir_conceptos():
    conceptos = abrir_archivo(FILE_NAME)
    for index, concepto in enumerate(conceptos):
        atributos = concepto.split(":")
        print(f"ATRIBUTO NO. {index + 1}\n\tCONCEPTO: {atributos[0]}\n\tDEFINICION: {atributos[1]}")
    input("Presione cualquier tecla para continuar...")


"""
El archivo se guarda de la siguiente manera:
    concepto: definicion
    concepto2: definicion2
    concepto3: definicion3
asi que solo revisa la longitud de cuantas lineas hay en el archivo
"""


def contar_conceptos():
    lines = abrir_archivo(FILE_NAME).__len__()
    print(f"La cantidad de palabras almacenadas es: {lines}")
    input("Presione cualquier tecla para continuar...")


def main():
    while True:
        option = int(
            input(
                "1. Ingresar concepto\n2. Listar conceptos\n3. Mostrar la cantidad de palabras almacenadas\n0. Salir\n"
            )
        )

        if option == 1:
            ingresar_concepto()
        elif option == 2:
            imprimir_conceptos()
        elif option == 3:
            contar_conceptos()
        elif option == 0:
            break

        clear_screen()


if __name__ == "__main__":
    main()
