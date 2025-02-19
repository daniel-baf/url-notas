"""
    DANIEL EDUARDO BAUTISTA FUENTES
    2121323

    EXAMEN PARCIAL NO. 1 

    El archivo se guarda de la siguiente manera:
    concepto: definicion
    concepto2: definicion2
    concepto3: definicion3
"""

from os import path

FILE_NAME = "conceptos.arc"


# limpia la consola
def clear_screen():
    print("\033c", end="")


# crea un archivo y escribe su texto
def create_file(file_name: str, text: str, append=False):
    access_permission = "w"
    access_permission = "w" if (not append or (not path.exists(file_name))) else "a"
    with open(file_name, access_permission) as new_file:
        new_file.write(text)


# funcion generica para abrir un archivo
def open_file(file_name: str):
    with open(file_name, "r") as new_file:
        return new_file.readlines()


# crea un concepto en el archivo
def insert_word():
    concept = input("Concepto: ")
    definition = input("Definicion: ")
    create_file(FILE_NAME, f"{concept.strip()}:{definition.strip()}\n", True)


# imprime los conceptos en el archivo
def print_concepts():
    if not check_file_exist():
        return

    concepts_list = open_file(FILE_NAME)
    for index, concept in enumerate(concepts_list):
        # revisar si la linea leida es vacia  y si es asi, no imprimir nada
        atributos = concept.split(":")
        if concept.strip() == "" or len(atributos) < 2:
            continue
        print(
            f"ATRIBUTO NO. {index + 1}\n\tCONCEPTO: {atributos[0]}\n\tDEFINICION: {atributos[1]}"
        )
    input("Presione cualquier tecla para continuar...")


# Funcion que busca una palabra en el archivo, linea por linea hasta encontrarla
def search_word():

    if not check_file_exist():
        return

    word = input("Ingrese la palabra a buscar: ")
    concepts_list = open_file(FILE_NAME)
    for index, concept in enumerate(concepts_list):
        atributos = concept.split(":")
        if atributos[0].strip() == word:
            print(
                f"ATRIBUTO NO. {index + 1}\n\tCONCEPTO: {atributos[0]}\n\tDEFINICION: {atributos[1]}"
            )
            break
    else:
        print("La palabra no se encuentra en el archivo")
    input("Presione cualquier tecla para continuar...")
    return index


def main():
    while True:
        option = int(
            input(
                "1. Ingresar concepto\n2. Listar conceptos\n3. Buscar una palabra\n0. Salir\n"
            )
        )

        if option == 1:
            insert_word()
        elif option == 2:
            print_concepts()
        elif option == 3:
            search_word()
        elif option == 0:
            break

        clear_screen()


def check_file_exist():
    # verificar que el archivo exista
    if not path.exists(FILE_NAME):
        print("El archivo no existe")
        input("Presione cualquier tecla para continuar...")
        return False
    return True


if __name__ == "__main__":
    main()
