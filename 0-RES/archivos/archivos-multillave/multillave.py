"""
    DANIEL EDUARDO BAUTISTA FUENTES
    2121323
    PROGRAMA QUE SE ENCARGA DE GENERAR UN ARCHIVO MULTI LLAVE

    SIMULA UNA AGENDA TELEFONICA, BÚSQUEDAS DEPENDIENDO DE LA OPCIÓN QUE SE EMPLEE

    DATOS A GUARDAR: NOMBRE, TELÉFONO, ALIAS
    BÚSQUEDA: NOMBRE, NUMERO O ALIAS
"""

import os


class Main:

    HASH_GENERAL = []

    def _limpiar_pantalla(self):
        """
        Función que se encarga de limpiar la pantalla
        """
        if os.name == "posix":
            os.system("clear")
            return
        elif os.name == "nt":
            os.system("cls")

    def _enter_to_continue(self, message: str = ""):
        """
        Función que se encarga de limpiar la pantalla y esperar a que el usuario presione enter
        """
        input(f"{message}\nEnter para continuar")

    def _filtrar_datos_por(self, tipo_busqueda: int, valor_buscar: str) -> list:
        """
        Función que se encarga de filtrar los datos por el tipo de busqueda
        """
        try:
            return list(
                filter(
                    lambda x: (
                        x["nombre"] == valor_buscar
                        if tipo_busqueda == 1
                        else (
                            x["telefono"] == valor_buscar
                            if tipo_busqueda == 2
                            else x["alias"] == valor_buscar
                        )
                    ),
                    self.HASH_GENERAL,
                )
            )
        except Exception as e:
            self._limpiar_pantalla()
            self._enter_to_continue(f"Error filtrando los datos: {e}")
            return []

    def _buscar_menu(self) -> None:
        """
        Función que se encarga de buscar un contacto en el archivo
        """
        try:
            self._limpiar_pantalla()
            tipo_busqueda = int(input("Tipo filtro\n1.Nombre\n2.Numero\n3.Alias\n~: "))
            valor_buscar_menu = input("Busqueda ~:")
            print(self._filtrar_datos_por(tipo_busqueda, valor_buscar_menu))
            self._enter_to_continue()
        except Exception as e:
            self._limpiar_pantalla()
            self._enter_to_continue("Valor invalido")

    def _generar_registro(self, nombre: str, telefono: str, clave: str) -> None:
        try:
            """
            Función que se encarga de generar un registro
            """
            return {
                "nombre": nombre,
                "telefono": telefono,
                "alias": clave,
                "hash": f"{nombre}{telefono}{clave}",
            }
        except Exception as e:
            self._limpiar_pantalla()
            self._enter_to_continue(f"A ocurrido un error generando el registro: {e}")
            return {}

    def _ingresar_datos(self) -> None:
        """
        Función que se encarga de ingresar los datos de un contacto
        """
        try:
            self._limpiar_pantalla()
            nombre = input("Nombre ~: ")
            telefono = input("Telefono ~: ")
            alias = input("Alias ~: ")
            self.HASH_GENERAL.append(self._generar_registro(nombre, telefono, alias))
            self._enter_to_continue("Registro guardado")
        except Exception as e:
            self._limpiar_pantalla()
            self._enter_to_continue(f"Error leyendo los datos: {e}")

    def start(self) -> None:
        while True:
            self._limpiar_pantalla()
            try:
                dato = int(
                    input(
                        f"{'-'*10} MENU {'-'*10}\n1. Buscar\n2. Ingresar\n3. Imprimir hash\n0. Salir\n{'-'*30}\n~: "
                    )
                )
                if dato == 1:
                    self._buscar_menu()
                elif dato == 2:
                    self._ingresar_datos()
                elif dato == 3:
                    print(self.HASH_GENERAL)
                    self._enter_to_continue()
                elif dato == 0:
                    break
            except Exception as e:
                self._limpiar_pantalla()
                self._enter_to_continue(f"ERROR ARCHIVO GENERAL {e}")


if __name__ == "__main__":
    Main().start()
