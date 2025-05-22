import os
from archivo_indexado import ArchivoIndexado, Usuario

"""
    PROGRAMA REALIZADO POR: DANIEL EDUARDO BAUTISTA FUENTES
    CARNET: 2121323

    PROGRAMA QUE INTENTA REPRESENTAR UNA BASE DE DATOS FUNCIONANDO COMO ARCHIVO INDEXADO

    FECHA DE CREACION: 10-09-2024
    ULTIMA MODIFICACION: 10-09-2024
"""


class App:
    """
    Clase principal que gestiona la interfaz de usuario y las operaciones
    sobre los registros de usuarios utilizando ArchivoIndexado.
    """

    def __init__(self):
        """Inicializa la aplicación creando una instancia de ArchivoIndexado."""
        self.arch_indexado = ArchivoIndexado()

    def clear_screen(self):
        """Limpia la pantalla de la consola."""
        os.system("cls" if os.name == "nt" else "clear")

    def enter_to_continue(self, message=""):
        """
        Espera a que el usuario presione una tecla para continuar.

        :param message: Mensaje opcional para mostrar antes de esperar.
        """
        input(f"{message}\nPresione cualquier tecla para continuar...")

    def agregar_registro(self) -> None:
        """
        Solicita al usuario los datos para agregar un nuevo registro
        y lo almacena en el archivo de datos.
        """
        clave = int(input("Ingrese el no. de control: "))
        nombre = input("Ingrese el nombre: ")
        telefono = input("Ingrese el teléfono: ")

        self.arch_indexado.agregar_registro(clave, Usuario(nombre, telefono))
        self.enter_to_continue("Registro agregado con éxito.")

    def buscar_registro(self) -> None:
        """
        Solicita al usuario una clave y busca el registro correspondiente.
        Muestra un mensaje si el registro se encuentra o no.
        """
        clave = int(input("Ingrese la clave: "))
        registro = self.arch_indexado.buscar_registro(clave)

        message = (
            "No se ha encontrado un registro"
            if registro is None
            else f"Registro encontrado: {registro}"
        )

        self.enter_to_continue(message=message)

    def listar_registros(self) -> None:
        """
        Lista todos los registros almacenados en el archivo de datos.
        """
        self.arch_indexado.listar_registros()
        self.enter_to_continue()

    def borrar_registro(self) -> None:
        """
        Solicita al usuario una clave y borra el registro correspondiente
        del archivo de datos.
        """
        clave = int(input("Ingrese la clave del registro a eliminar: "))
        self.arch_indexado.borrar_registro(clave)
        self.enter_to_continue()

    def editar_registro(self) -> None:
        """
        Solicita al usuario la clave de un registro existente y los
        nuevos datos, y actualiza el registro en el archivo de datos.
        """
        clave = int(input("Ingrese la clave del registro a editar: "))
        nombre = input("Ingrese el nuevo nombre: ")
        telefono = input("Ingrese el nuevo teléfono: ")

        self.arch_indexado.editar_registro(clave, Usuario(nombre, telefono))
        self.enter_to_continue("Registro editado con éxito.")

    def mostrar_menu(self):
        """
        Muestra el menú de opciones al usuario y maneja la selección
        de la opción.
        """
        len_menu = 50
        print(
            f"{'Menú':^{len_menu}}\n{'-' * len_menu}\n\t1. Agregar registro\n\t2. Buscar registro\n\t3. Listar registros\n\t4. Borrar registro\n\t5. Editar registro\n\t6. Borrar archivos cnf\n\t0. Salir\n{'-' * len_menu}"
        )

        opcion = input("Opción: ")

        if opcion == "1":
            self.agregar_registro()
        elif opcion == "2":
            self.buscar_registro()
        elif opcion == "3":
            self.listar_registros()
        elif opcion == "4":
            self.borrar_registro()
        elif opcion == "5":
            self.editar_registro()
        elif opcion == "6":
            self.arch_indexado.borrar_archivos_cnf()
            self.enter_to_continue("Archivos cnf borrados")
        elif opcion == "0":
            exit()
        else:
            self.enter_to_continue("Opción inválida.")

    def run(self):
        """
        Inicia el bucle principal de la aplicación, donde se manejan
        las interacciones del usuario.
        """
        while True:
            try:
                self.clear_screen()
                self.mostrar_menu()
            except Exception as e:
                print(f"Error: {e}")


# Ejemplo de uso
if __name__ == "__main__":
    main = App()
    main.run()
