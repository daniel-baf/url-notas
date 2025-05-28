"""
    El objetivo es generar una tabla de indexado para un vocabulario dado.
"""


class TablaIndexada:

    def __init__(self, vocabulario):
        self.vocabulario = vocabulario
        self.tabla = self.generar_tabla()

    def generar_tabla(self):
        """
        Genera una tabla de indexado con las palabras del vocabulario.
        """
        tabla = {}
        for palabra in self.vocabulario:
            tabla[palabra] = []
        return tabla

    def indexar(self, textos: list, identificador: "str") -> None:
        """
        Indexa los archivos en la tabla de indexado.
        """
        for palabra in textos:
            for sub_string in palabra.split():
                # agregar solo si el valor no existe
                if identificador not in self.tabla[sub_string]:
                    self.tabla[sub_string].append(identificador)

    def buscar_archivos(self, palabras: list) -> list:
        """
        Busca en la tabla de indexado los archivos que contienen las palabras dadas.
        """
        archivos = []
        for palabra in palabras:
            archivos += self.tabla[palabra]
        return archivos

    def buscar(self, palabra):
        """
        Busca en la tabla de indexado los archivos que contienen la palabra dada.
        """
        return self.tabla[palabra]


class ExtractorPalabras:

    def __init__(self, *vectores_palabras: list):
        """
        Recibe multiples listas de palabras
        """
        self.palabras = self.extraer_palabras(vectores_palabras)

    def extraer_palabras(self, *vectores: list):
        """
        Itera todos los argumentos y extrae las palabras de cada uno. Si ya existe la ignorará. Sino la agrega
        """
        palabras_tmp = []
        for vector in vectores:
            for cadena in vector:
                for palabra in cadena:
                    for sub_string in palabra.split():
                        if sub_string not in palabras_tmp:
                            palabras_tmp.append(sub_string)

        return palabras_tmp
