import struct, pickle, os

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


# Clase para manejar el almacenamiento de registros indexados
class ArchivoIndexado:

    def __init__(self, datos_file="datos.dat", index_file="index.idx"):
        self.datos_file = datos_file
        self.index_file = index_file

        # Inicializar archivos
        self._initialize_files()

    def _initialize_files(self):
        """Crea los archivos de datos e índice si no existen."""
        for file in [self.datos_file, self.index_file]:
            if not os.path.exists(file):
                with open(file, "wb"):
                    pass

    def agregar_registro(self, clave, objeto: Usuario):
        """
        Agrega un nuevo registro al archivo de datos.

        Parameters:
            clave (int): La clave única del registro.
            objeto (Usuario): El objeto a serializar y almacenar.

        Si la clave ya existe, no se agrega el registro.
        """
        # Verificar si la clave ya existe
        if self._buscar_en_indice(clave) is not None:
            print(f"La clave {clave} ya existe. No se agregará el registro.")
            return

        # Serializar el objeto
        objeto_serializado = pickle.dumps(objeto)

        # Escribir el registro en el archivo de datos
        with open(self.datos_file, "ab") as archivo_datos:
            archivo_datos.write(struct.pack(REGISTRO_FORMAT, clave))
            archivo_datos.write(objeto_serializado)
            pos = archivo_datos.tell() - (REGISTRO_SIZE + len(objeto_serializado))

        # Agregar la clave y posición al índice
        self._agregar_a_indice(clave, pos)

    def _agregar_a_indice(self, clave, pos):
        """
        Agrega una entrada al archivo de índice.

        Parameters:
            clave (int): La clave del registro.
            pos (int): La posición del registro en el archivo de datos.
        """
        with open(self.index_file, "ab") as archivo_indice:
            archivo_indice.write(struct.pack("I", clave))
            archivo_indice.write(struct.pack("I", pos))

    def buscar_registro(self, clave):
        """
        Busca un registro por su clave.

        Parameters:
            clave (int): La clave del registro a buscar.

        Returns:
            Tuple[int, Usuario]: La clave y el objeto del registro si se encuentra, None si no.
        """
        pos = self._buscar_en_indice(clave)
        if pos is not None:
            return self._leer_registro(pos)
        else:
            return None

    def _buscar_en_indice(self, clave):
        """
        Busca la posición de una clave en el archivo de índice.

        Parameters:
            clave (int): La clave a buscar.

        Returns:
            int: La posición del registro en el archivo de datos, o None si no se encuentra.
        """
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
        """
        Lee un registro en la posición especificada.

        Parameters:
            pos (int): La posición del registro en el archivo de datos.

        Returns:
            Tuple[int, Usuario]: La clave y el objeto del registro.
        """
        with open(self.datos_file, "rb") as archivo_datos:
            archivo_datos.seek(pos)
            clave = struct.unpack(REGISTRO_FORMAT, archivo_datos.read(REGISTRO_SIZE))[0]
            objeto_serializado = archivo_datos.read()  # Leer el objeto serializado
            objeto = pickle.loads(objeto_serializado)  # Deserializar el objeto
            return clave, objeto

    def listar_registros(self):
        """Lista todos los registros almacenados en el archivo de datos."""
        with open(self.index_file, "rb") as f_index:
            while True:
                bytes_leidos = f_index.read(8)  # 4 bytes para clave y 4 para posición
                if not bytes_leidos:
                    break
                clave, pos = struct.unpack("II", bytes_leidos)
                _, registro = self._leer_registro(pos)
                print(f"Clave: {clave}, Registro: {registro}")

    def borrar_registro(self, clave):
        """
        Elimina un registro del archivo de datos e índice.

        Parameters:
            clave (int): La clave del registro a eliminar.

        Si la clave no se encuentra, imprime un mensaje de error.
        """
        registros = []
        encontrado = False

        with open(self.index_file, "rb") as f_index:
            while True:
                bytes_leidos = f_index.read(8)  # 4 bytes para clave y 4 para posición
                if not bytes_leidos:
                    break
                c, pos = struct.unpack("II", bytes_leidos)
                if c != clave:
                    registros.append((c, pos))
                else:
                    encontrado = True

        if encontrado:
            # Reescribimos el archivo de índice sin el registro a eliminar
            with open(self.index_file, "wb") as f_index:
                for c, pos in registros:
                    f_index.write(struct.pack("II", c, pos))
            print(f"Registro con clave {clave} eliminado.")
        else:
            print(f"No se encontró ningún registro con la clave {clave}.")

    def borrar_archivos_cnf(self):
        """Elimina los archivos de datos e índice si existen."""
        for file in [self.datos_file, self.index_file]:
            try:
                os.remove(file)
            except FileNotFoundError:
                pass

    def editar_registro(self, clave, nuevo_objeto: Usuario):
        """
        Edita un registro existente en el archivo de datos.

        Parameters:
            clave (int): La clave del registro a editar.
            nuevo_objeto (Usuario): El nuevo objeto que reemplazará al existente.

        Si la clave no se encuentra, imprime un mensaje de error.
        """
        # Verificar si la clave existe en el índice
        pos = self._buscar_en_indice(clave)
        if pos is None:
            print(f"No se encontró ningún registro con la clave {clave}.")
            return

        # Serializar el nuevo objeto
        nuevo_objeto_serializado = pickle.dumps(nuevo_objeto)

        # Abrir el archivo de datos y sobrescribir el registro en la posición encontrada
        with open(
            self.datos_file, "r+b"
        ) as archivo_datos:  # "r+b" permite lectura y escritura en modo binario
            archivo_datos.seek(pos)

            # Escribir la clave (no cambia) y el nuevo objeto serializado
            archivo_datos.write(struct.pack(REGISTRO_FORMAT, clave))
            archivo_datos.write(nuevo_objeto_serializado)
