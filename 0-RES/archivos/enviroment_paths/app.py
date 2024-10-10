"""
    DANIEL EDUARDOB BAUTISTA FUENTES
    2121323

    Programa que muestre un menu y almacene los datos generados en diferentes archivos de texto
    

    Generar la tabla de multiplicar de un número (1 - 10) (anexar a la tabla anterior)
    Solicitar el ingreso de un conecpot y su definicioaon separado por ';'
    Solicitar el ingreso de un nombre completo y se debe anexar a los nombres previamente existentes
"""

from os import path

table_names = ["tablas.txt", "conceptos.txt", "nombres.txt"]


def clear_screen():
    print("\033c", end="")


# crea un archivo y escribe su texto
def crear_archivo(nombre_archivo: str, texto: str, append=False):
    permisos = "w"
    permisos = "w" if (not append or (not path.exists(nombre_archivo))) else "a"
    with open(nombre_archivo, permisos) as archivo:
        archivo.write(texto)


# funcion para generar la tabla de multiplicar de un numero (1 - 10) ingresado
def generar_tabla_multiplicar(numero):
    tabla = []
    for i in range(1, 11):
        tabla.append(f"{numero} x {i} = {numero * i}")
    return tabla


# genera la tabla al solicitarla
def configurar_tabla():
    numero = int(input("Ingrese el numero para generar la tabla de multiplicar: "))
    tabla = generar_tabla_multiplicar(numero)
    # table to text
    texto = "\n".join(tabla)
    texto += "\n"
    crear_archivo(table_names[0], texto, True)


# genera el concepto al solicitarlo
def configurar_concepto():
    concepto = input("Ingrese el concepto: ")
    definicion = input("Ingrese la definicion: ")
    concepto = f"{concepto};{definicion}\n"
    crear_archivo(table_names[1], concepto, True)


def configurar_nombre():
    nombre = input("Ingrese el nombre completo: ")
    nombre = f"{nombre}\n"
    crear_archivo(table_names[2], nombre, True)


def main():
    while True:
        option = int(
            input(
                "1. Generar tabla de multiplicar\n2. Ingresar concepto\n3. Ingresar nombre\n0. Salir\n"
            )
        )

        if option == 1:
            configurar_tabla()
        elif option == 2:
            configurar_concepto()
        elif option == 3:
            configurar_nombre()
        elif option == 0:
            break

        clear_screen()


if __name__ == "__main__":
    main()
