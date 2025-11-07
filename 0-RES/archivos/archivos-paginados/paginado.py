"""
    DANIEL EDUARDO BAUTISTA FUENTES 
    2121323

    aplicacion que guarde datos en un archivo
    permita la copia de seguridad, y ademas
    muestre la paginacion de los datos
"""

import os


class Main:

    MAX_CHARS = 30

    def leer_datos(self):
        try:
            data = input("Escribe algo: ").strip()
            if data == "salir":
                exit()
            return data
        except Exception as e:
            return "Valor invalido"

    def guardar_en_archivo(self, data):
        try:
            # verficar texto
            if data == "":
                return

            # crear archivo si no existe
            if not os.path.exists("data.txt"):
                with open("data.txt", "w") as file:
                    file.write("")

            with open("data.txt", "a") as file:
                file.write(data + "\n")
        except Exception as e:
            print("Error al guardar en archivo")

    def limpiar_pantalla(self):
        os.system("cls" if os.name == "nt" else "clear")

    def imprimir_como_pantalla(self, data):
        # verificar el largo del dato, si excede MAX_CHARS, dividie en paginas y lo imprime como pag 1/2
        paginado = [
            data[i : i + self.MAX_CHARS] for i in range(0, len(data), self.MAX_CHARS)
        ]

        for i, pag in enumerate(paginado):
            print(f"{pag} ({i+1}/{len(paginado)})")

    def imprimir_menu(self):
        print("Bienvenido a la aplicacion")
        print("Escribe 'salir' para terminar el programa")
        print("Escribe 'copia' para hacer una copia de seguridad")
        return self.leer_datos()

    def copiar_archivo(self):
        try:
            data = ""
            # leer archivo
            with open("data.txt", "r") as file:
                data = file.read()

            # crear archivo de copia
            with open("data.bak", "w") as file:
                file.write(data)
        except Exception as e:
            print(f"Error al copiar archivo {e}")

    def run(self):
        while True:
            # limpiar pantalla
            self.limpiar_pantalla()
            data = self.imprimir_menu()
            if data == "copia":
                self.copiar_archivo()
            else:
                self.guardar_en_archivo(data)
                self.imprimir_como_pantalla(data)
            input("Presiona enter para continuar")


if __name__ == "__main__":
    Main().run()
