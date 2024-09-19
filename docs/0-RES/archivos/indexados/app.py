import struct  # manejo de binarios
import os
import pickle  # serializar objetos en python

# Estructura de un registro (clave, objeto serializado)
REGISTRO_FORMAT = "I"  # 'I' para clave (int), el objeto se almacena como binario
REGISTRO_SIZE = struct.calcsize(REGISTRO_FORMAT)


# Clase para manejar el archivo de datos y el archivo de índice
class Usuario:
    def __init__(self, nombre: str, telefono: str) -> None:
        self.nombre = nombre
        self.telefono = telefono

    def __str__(self) -> str:
        return f"Nombre: {self.nombre}, Teléfono: {self.telefono}"

    def __repr__(self) -> None:
        return f"Usuario(nombre={self.nombre}, telefono={self.telefono})"


# vamos a estar almacenando los objetos serializados en el archivo de datos
class ArchivoIndexado:
    def __init__(self, datos_file="datos.dat", index_file="index.idx"):
        self.datos_file = datos_file
        self.index_file = index_file

        # Inicializar archivos
        self._initialize_files()

    def _initialize_files(self):  # crea los archivos si no existen
        for file in [self.datos_file, self.index_file]:
            if os.path.exists(file):
                with open(file, "wb"):
                    pass

    def agregar_registro(self, clave, objeto: Usuario):
        # Serializar el objeto
        objeto_serializado = pickle.dumps(objeto)

        with open(self.datos_file, "ab") as archivo_datos:
            archivo_datos.write(struct.pack(REGISTRO_FORMAT, clave))
            archivo_datos.write(objeto_serializado)
            pos = archivo_datos.tell() - (REGISTRO_SIZE + len(objeto_serializado))
            self._agregar_a_indice(clave, pos)

    def _agregar_a_indice(self, clave, pos):
        with open(self.index_file, "ab") as archivo_indice:
            archivo_indice.write(struct.pack("I", clave))
            archivo_indice.write(struct.pack("I", pos))

    def buscar_registro(self, clave):
        pos = self._buscar_en_indice(clave)
        if pos is not None:
            return self._leer_registro(pos)
        else:
            print("Registro no encontrado.")
            return None

    def _buscar_en_indice(self, clave):
        with open(self.index_file, "rb") as f_index:
            while True:
                bytes_leidos = f_index.read(8)  # 4 bytes para clave y 4 para pos
                if not bytes_leidos:
                    break
                c, p = struct.unpack("II", bytes_leidos)
                if c == clave:
                    return p
        return None

    def _leer_registro(self, pos):
        with open(self.datos_file, "rb") as archivo_datos:
            archivo_datos.seek(pos)
            clave = struct.unpack(REGISTRO_FORMAT, archivo_datos.read(REGISTRO_SIZE))[0]
            objeto_serializado = archivo_datos.read()  # Leer el objeto serializado
            objeto = pickle.loads(objeto_serializado)  # Deserializar el objeto
            return clave, objeto


class App:
    def __init__(self):
        self.app = ArchivoIndexado()

    def agregar_registro(self, clave, objeto):
        self.app.agregar_registro(clave, objeto)

    def buscar_registro(self, clave):
        return self.app.buscar_registro(clave)

    def mostrar_menu(self):
        print("1. Agregar registro")
        print("2. Buscar registro")
        print("3. Salir")
        return input("Opción: ")

    def run(self):
        while True:
            try:
                opcion = self.mostrar_menu()
                if opcion == "1":
                    clave = int(input("Ingrese el no. de control: "))
                    nombre = input("Ingrese el nombre: ")
                    telefono = input("Ingrese el teléfono: ")
                    self.agregar_registro(clave, Usuario(nombre, telefono))
                elif opcion == "2":
                    clave = int(input("Ingrese la clave: "))
                    print(self.buscar_registro(clave))
                elif opcion == "3":
                    exit()
                else:
                    print("Opción inválida.")
            except Exception as e:
                print(f"Error: {e}")


# Ejemplo de uso
if __name__ == "__main__":
    main = App()
    main.run()
