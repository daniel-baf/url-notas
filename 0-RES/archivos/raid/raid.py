"""
    DANIEL EDUARDO BAUTISTA FUENTES
    2121323

    SIMULADO DE RAIDS PARA ALMACENAR DATOS, 
    SE PUEDE INGRESAR DATOS E IMPRIMIR TODOS LOS DATOS, Y LUEGO PODER SIMULAR LA DIVISION DE DATOS EN 
    RAID 1 O RAID 0

    LOS DATOS A GUARDAR SON DATO:DATO2
"""

import os


class Archivador:

    FILE_NAME = "datos.dat"
    RAID_FILES = ["RD1.dat", "RD2.dat"]

    def __init__(self):
        self.crear_archivo(self.FILE_NAME)

    def crear_archivo(self, file_name, force_delete=False):
        """
        Crea un archivo de datos si no existe
        """
        if os.path.exists(file_name) and not force_delete:
            return
        with open(file_name, "w") as file:
            pass

    def guardar_dato(self, dato: str, archivo: str):
        """
        Guarda un dato en un archivo
        """
        with open(archivo, "a") as file:
            file.write(f"{dato}\n")

    def leer_datos(self, archivo: str):
        """
        Lee los datos de un archivo
        """
        with open(archivo, "r") as file:
            return [line.strip() for line in file]

    def generar_raid0(self):
        """
        Genera un RAID 0 dividiendo los datos
        """
        # genera los archivos de RAID
        self.reiniciar_archivos_raid()
        # guardamos los datos alternando el archivo
        data = self.leer_datos(self.FILE_NAME)
        for i, dato in enumerate(data):
            dato_grupos = dato.split(":")
            self.guardar_dato(dato_grupos[0], self.RAID_FILES[0])
            self.guardar_dato(dato_grupos[1], self.RAID_FILES[1])
        input(
            f"Se han guardado los datos en RAID 0, se sobre escribieron los archivos {self.RAID_FILES}\nPresione enter para continuar"
        )

    def generar_raid1(self):
        """
        Genera un RAID 1
        """
        self.reiniciar_archivos_raid()
        data = self.leer_datos(self.FILE_NAME)
        for i, dato in enumerate(data):
            self.guardar_dato(dato, self.RAID_FILES[0])
            self.guardar_dato(dato, self.RAID_FILES[1])
        input(
            f"Se han guardado los datos en RAID 1, se sobre escribieron los archivos {self.RAID_FILES}\nPresione enter para continuar"
        )

    def reiniciar_archivos_raid(self):
        """
        REINICIA LOS ARCHIVOS PARA EL RAID
        """
        self.crear_archivo(self.RAID_FILES[0], force_delete=True)
        self.crear_archivo(self.RAID_FILES[1], force_delete=True)


class Main:

    def __init__(self):
        self.archivador = Archivador()

    def limpiar_pantalla(self):
        os.system("cls" if os.name == "nt" else "clear")

    def ingresar_datos(self):
        self.limpiar_pantalla()
        print(f"{'-'*10} INGRESAR DATOS {'-'*10}")
        dato = input("DATO: ").strip()
        dato2 = input("ANTONIMO: ").strip()
        self.archivador.guardar_dato(f"{dato}:{dato2}", self.archivador.FILE_NAME)
        print("Dato guardado con éxito")
        input("Presione enter para continuar...")

    def imprimir_datos(self):
        """
        Imprime los datos guardados en el archivo principal
        """
        self.limpiar_pantalla()
        print(f"{'-'*10} DATOS {'-'*10}")
        data_file = self.archivador.leer_datos(self.archivador.FILE_NAME)
        for i, data in enumerate(data_file):
            sub_data = data.split(":")
            print(f"FILA {i+1}:\n\t PALABRA: {sub_data[0]}\n\t ANTONIMO: {sub_data[1]}")
        input("Presione enter para continuar...")

    def imprimir_menu(self):
        """
        Imprime el menú principal y maneja las opciones
        """
        self.limpiar_pantalla()
        print(f"{'-'*10} RAID {'-'*10}")
        print("1. Ingresar datos")
        print("2. Imprimir datos")
        print("3. RAID 0")
        print("4. RAID 1")
        print("0. Salir")
        print(f"{'-'*25}")
        selection = input("Seleccione una opción: ")

        if selection == "1":
            self.ingresar_datos()
        elif selection == "2":
            self.imprimir_datos()
        elif selection == "3":
            self.archivador.generar_raid0()
        elif selection == "4":
            self.archivador.generar_raid1()
        elif selection == "0":
            exit()

    def run(self):
        while True:
            try:
                self.imprimir_menu()
            except Exception as e:
                self.limpiar_pantalla()
                print(f"Error: {e}")
                input("Presione enter para continuar...")


if __name__ == "__main__":
    Main().run()
