from indexador import TablaIndexada, ExtractorPalabras
from pprint import pprint


class Main:
    ARCHIVO_1 = [
        "hola mundo",
        "mundo cruel",
        "quiero comer",
        "comer pizza",
        "hola de nuevo",
        "mundo maravilloso",
        "quiero viajar",
        "viajar es vida",
        "comer saludable",
        "pizza casera",
        "mundo digital",
        "quiero aprender",
    ]

    ARCHIVO_2 = [
        "mundo feliz",
        "quiero dormir",
        "dormir es bueno",
        "pizza deliciosa",
        "mundo virtual",
        "quiero correr",
        "correr es sano",
        "pizza italiana",
        "mundo real",
        "quiero leer",
        "leer es fundamental",
        "pizza vegetariana",
    ]

    def __init__(self):
        vocabulario = ExtractorPalabras(self.ARCHIVO_1, self.ARCHIVO_2).palabras
        self.indexador = TablaIndexada(vocabulario)
        self.indexador.indexar(self.ARCHIVO_1, "listado1")
        self.indexador.indexar(self.ARCHIVO_2, "listado2")

    def print_menu(self):
        try:
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
