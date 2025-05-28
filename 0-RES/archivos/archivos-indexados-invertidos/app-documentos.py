from indexador import TablaIndexada, ExtractorPalabras
from pprint import pprint


class Main:

    ARCHIVO_1 = "arc2.tx"
    ARCHIVO_2 = "arch1.txt"

    def leerArchvivo(self, file_name):
        lineas = []
        try:
            with open(file_name, "r") as file:
                while True:
                    linea = file.readline().strip().lower()
                    if not linea:
                        break
                    lineas.append(linea)
        except Exception as e:
            print(f"Error al leer archivo: {e}")
        finally:
            return lineas

    def extraer_archivos(self):
        pass

    def __init__(self):
        self.ARCHIVO_1 = self.leerArchvivo(self.ARCHIVO_1)
        self.ARCHIVO_2 = self.leerArchvivo(self.ARCHIVO_2)
        vocabulario = ExtractorPalabras(self.ARCHIVO_1, self.ARCHIVO_2).palabras
        self.indexador = TablaIndexada(vocabulario)
        self.indexador.indexar(self.ARCHIVO_1, "listado1")
        self.indexador.indexar(self.ARCHIVO_2, "listado2")

    def print_menu(self):
        try:
            print("Escriba salir para terminar")
            busqueda = input("$-:")

            if busqueda == "salir":
                exit()

            # dividir en una lista
            busqueda = busqueda.split()

            # buscar en la tabla de indexado
            pprint(self.indexador.buscar_archivos(busqueda))
        except Exception as e:
            print(f"Valor no encontrado: {e}")

    def run(self):
        while True:
            self.print_menu()
            pass


if __name__ == "__main__":
    main = Main()
    main.run()
