# DANIEL EDUARDO BAUTISTA FUENTES
# 2121323

# Aplicación que simula las llamadas a sistema para realizar operaciones en archivos
# Funciones simuladas: abrir, leer, escribir, y cerrar archivos
# La interfaz de usuario permite desplegar y editar el contenido de un archivo

import os
import sys
from PyQt5.QtWidgets import (
    QApplication,
    QFileDialog,
    QMessageBox,
    QLabel,
    QVBoxLayout,
    QPlainTextEdit,
    QPushButton,
)
from PyQt5.uic import loadUiType

Ui_MainWindow, QMainWindow = loadUiType("interface.ui")


class MainMenuPrincipal(QMainWindow, Ui_MainWindow):
    def __init__(self) -> None:
        super().__init__()
        self.setupUi(self)

        self.file_path = None  # Ruta del archivo actualmente abierto

        # Conexión de botones a funciones correspondientes
        self.btn_search.clicked.connect(self.seleccionar_y_abrir_archivo)
        self.btn_editar.clicked.connect(self.guardar_archivo)

        # Configuración inicial del editor de texto dentro del marco
        if not self.frame_archivo.layout():
            self.frame_archivo.setLayout(QVBoxLayout())

        # Crear un widget de editor de texto y agregarlo al marco
        self.text_editor = QPlainTextEdit()
        self.frame_archivo.layout().addWidget(self.text_editor)
        self.text_editor.setReadOnly(True)  # Inicialmente en modo solo lectura

    # Función para seleccionar un archivo y abrirlo
    def seleccionar_y_abrir_archivo(self):
        self.file_path, _ = QFileDialog.getOpenFileName(
            self,
            "Seleccionar archivo",
            "",
            "Archivos de texto (*.txt);;Todos los archivos (*.*)",
        )
        if self.file_path:
            descriptor_archivo = self.abrir_archivo(self.file_path)
            if descriptor_archivo:
                QMessageBox.information(
                    self,
                    "Archivo abierto",
                    f"El archivo '{self.file_path}' se abrió correctamente.",
                )
                contenido = self.leer_archivo(descriptor_archivo)
                if contenido:
                    self.mostrar_contenido_archivo(contenido.decode("utf-8"))
                self.cerrar_archivo(descriptor_archivo)
            else:
                QMessageBox.warning(self, "Error", "No se pudo abrir el archivo.")

    # Función que simula abrir un archivo y devuelve un descriptor
    def abrir_archivo(self, nombre_archivo):
        try:
            descriptor = os.open(nombre_archivo, os.O_RDONLY)
            return descriptor
        except OSError as e:
            print(f"Error al abrir el archivo: {e}")
            return None

    # Función que simula leer un archivo desde un descriptor
    def leer_archivo(self, descriptor_archivo):
        try:
            contenido = os.read(descriptor_archivo, 1024)  # Leer hasta 1024 bytes
            return contenido
        except OSError as e:
            print(f"Error al leer el archivo: {e}")
            return None

    # Función que simula escribir en un archivo
    def escribir_archivo(self, descriptor_archivo, contenido, modo="w"):
        try:
            if modo == "a":
                os.lseek(descriptor_archivo, 0, os.SEEK_END)  # Modo append
            elif modo == "w":
                os.ftruncate(descriptor_archivo, 0)  # Limpiar contenido existente
            os.write(descriptor_archivo, contenido.encode())
            return True
        except OSError as e:
            print(f"Error al escribir en el archivo: {e}")
            return False

    # Función que simula cerrar un archivo
    def cerrar_archivo(self, descriptor_archivo):
        try:
            os.close(descriptor_archivo)
            return True
        except OSError as e:
            print(f"Error al cerrar el archivo: {e}")
            return False

    # Función para mostrar el contenido del archivo en el editor de texto
    def mostrar_contenido_archivo(self, contenido):
        self.text_editor.setPlainText(contenido)
        self.text_editor.setReadOnly(False)  # Habilitar edición

    # Función para guardar el contenido editado al archivo
    def guardar_archivo(self):
        if self.file_path:
            try:
                with open(self.file_path, "w", encoding="utf-8") as archivo:
                    contenido = self.text_editor.toPlainText()
                    archivo.write(contenido)
                QMessageBox.information(
                    self,
                    "Guardado exitoso",
                    f"El archivo '{self.file_path}' se guardó correctamente.",
                )
            except Exception as e:
                QMessageBox.warning(
                    self, "Error", f"No se pudo guardar el archivo: {e}"
                )
        else:
            QMessageBox.warning(
                self, "Error", "No hay un archivo abierto para guardar."
            )


# Inicializar la aplicación
app = QApplication(sys.argv)
window = MainMenuPrincipal()
window.show()

sys.exit(app.exec_())
