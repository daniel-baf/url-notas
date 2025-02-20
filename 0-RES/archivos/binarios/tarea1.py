"""
DANIEL EDUARDO BAUTISTA FUENTES
2121323

NOTA: ingeniero estaba intentando hacer el programa, pero, el archivo que subio, no contenia numeros, o al menos no los logre ver, al 
queres decodificar los datos, me daba error con los nombres y apellidos con dieresis o tildes, pero para probar
cree una funcion que casteaba el texto a binario, al abrirlo con ghex, si observo los binarios, pero no se si es lo que usted queria
"""

import os
import pickle

# STATIC VARIABLES
FILE_PATH = "Archivo2.dat"
ORIGINAL_TEXT = "1637723 ALBIZUREZ ALPIREZ DANIEL\n1524323 BARRIOS ESTRADA JOSUE EMANUEL\n2121323 BAUTISTA FUENTES DANIEL EDUARDO\n1549223 CÁCERES FUENTES JULIO ALEJANDRO\n2276616 CARRETO AGUILÓN DENNYS ROLANDO YOSIMAR\n1534422 CASTAÑEDA VASQUEZ JOSE DAVID\n1502023 CHACLÁN GUINEA ALLAN FRANCISCO MOISES\n1530623 CORTÉS ENRIQUEZ JUAN MARCOS\n1567519 COS ALVAREZ MARIA LUISA\n1572322 DE LEON LIMA ABEL ALEXANDER\n1525620 ESPINOZA FERNÁNDEZ RUBEN FERNANDO\n1624622 GUTIÉRREZ DE LEÓN JASON MISAEL\n1515522 JUI ASCOLI JOSHUA\n1520722 LAINES PABLO KAREN FLORIDALMA\n1615823 LARA DE LEÓN VYNCEN YOEL\n1597421 MACARIO VELASQUEZ MIGUEL ALFONZO\n1567523 ORDOÑEZ LÓPEZ IVÁN ALEXANDER\n1515922 OVALLE HERNANDEZ LUIS MANUEL\n1547223 RONQUILLO MEZA JOSÉ ANTONIO\n1626923 SALGUERO SANDOVAL MIGUEL ANTONIO\n2012421 SANCHEZ TASEJ FRANCISCO JAVIER\n1581223 SIQUINÁ TZÚN SEBASTIAN JOSUÉ\n1627021 TIGÜILÁ SOLOJ MARÍA ESTHER\n1524723 TZUNÚN TAX ALESSANDRO CARLOS JOSÉ\n1583623 VILLATORO TZOC LESTHER RODNY HÁMILTON\n1592623 VILLEGAS VELASCO CHRISTIAN ANDRÉS\n1529422 YAX PUÁC KEVIN MIGUEL\n"
ENABLE_SETUP = False


# this function creates the file if it does not exist
def setup_file():
    try:
        if os.path.exists(FILE_PATH):  # check if file exists
            with open(FILE_PATH, "rb") as f:
                # print(f.read())
                print("File already exists")
        else:
            with open(FILE_PATH, "wb") as f:
                text = f.write(
                    ORIGINAL_TEXT.encode("utf-8")
                )  # write the text to the file using UTF-8 encoding
                print(f"File created, type: {type(text)}")
    except Exception as e:
        print(f"Error: {e}")


# this function cast a number ascii to char
def ascii_to_char(ascii_number: int) -> str:
    return chr(ascii_number)


# this functions read a binary file char by char and returns an array with all the binary values
def read_binary_file(file_path: str) -> str:
    try:
        with open(file_path, "rb") as f:
            content = f.read()
            decoded_text = content.decode("utf-8")
        return decoded_text
    except Exception as e:
        print(f"Error: {e}")
        return None


def main():
    if ENABLE_SETUP:
        setup_file()

    ascii_text = read_binary_file(FILE_PATH)  # read the binary file
    # check if the file was read correctly
    if ascii_text == None:
        print("Error reading the file")
        return
    # cast each number to binary
    print(ascii_text)


if __name__ == "__main__":
    main()
