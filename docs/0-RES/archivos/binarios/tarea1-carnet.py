"""
DANIEL EDUARDO BAUTISTA FUENTES
2121323

NOTA: ingeniero estaba intentando hacer el programa, pero, el archivo que subio, no contenia numeros, o al menos no los logre ver, al 
queres decodificar los datos, me daba error con los nombres y apellidos con dieresis o tildes, pero para probar
cree una funcion que casteaba el texto a binario, al abrirlo con ghex, si observo los binarios, pero no se si es lo que usted queria
"""

import os

FILE_PATH = "./Archivo2.bin"
CSV_FILE_PATH = "./Archivo2.csv"
ORIGINAL_TEXT = "1637723 ALBIZUREZ ALPIREZ DANIEL\n1524323 BARRIOS ESTRADA JOSUE EMANUEL\n2121323 BAUTISTA FUENTES DANIEL EDUARDO\n1549223 CÁCERES FUENTES JULIO ALEJANDRO\n2276616 CARRETO AGUILÓN DENNYS ROLANDO YOSIMAR\n1534422 CASTAÑEDA VASQUEZ JOSE DAVID\n1502023 CHACLÁN GUINEA ALLAN FRANCISCO MOISES\n1530623 CORTÉS ENRIQUEZ JUAN MARCOS\n1567519 COS ALVAREZ MARIA LUISA\n1572322 DE LEON LIMA ABEL ALEXANDER\n1525620 ESPINOZA FERNÁNDEZ RUBEN FERNANDO\n1624622 GUTIÉRREZ DE LEÓN JASON MISAEL\n1515522 JUI ASCOLI JOSHUA\n1520722 LAINES PABLO KAREN FLORIDALMA\n1615823 LARA DE LEÓN VYNCEN YOEL\n1597421 MACARIO VELASQUEZ MIGUEL ALFONZO\n1567523 ORDOÑEZ LÓPEZ IVÁN ALEXANDER\n1515922 OVALLE HERNANDEZ LUIS MANUEL\n1547223 RONQUILLO MEZA JOSÉ ANTONIO\n1626923 SALGUERO SANDOVAL MIGUEL ANTONIO\n2012421 SANCHEZ TASEJ FRANCISCO JAVIER\n1581223 SIQUINÁ TZÚN SEBASTIAN JOSUÉ\n1627021 TIGÜILÁ SOLOJ MARÍA ESTHER\n1524723 TZUNÚN TAX ALESSANDRO CARLOS JOSÉ\n1583623 VILLATORO TZOC LESTHER RODNY HÁMILTON\n1592623 VILLEGAS VELASCO CHRISTIAN ANDRÉS\n1529422 YAX PUÁC KEVIN MIGUEL\n"
LINE_SEPARATOR = (
    "\x17"  # this is a non printable character that I use to separate the lines
)
CSV_SEPARATOR = (
    ","  # this is the separator that I use to separate the name and lastname
)


# this function convert a ASCII code to a character
def ascii_to_char(ascii_code: int) -> str:
    return chr(ascii_code)


def char_to_ascii(char: str) -> int:
    return ord(char)


# this function configure the main file to execute the app, 'cause original file get some problems
def generate_file(cadena: str, use_line_separator: bool = False) -> list:
    # this function convert a string to a list of numbers that represent the ASCII code of each character
    array = []
    for line in cadena.split("\n"):
        # add line separator if true, to reuse this function
        if use_line_separator:
            array.append(char_to_ascii(LINE_SEPARATOR))  # name separator
        for char in line:
            array.append(char_to_ascii(char))  # cast current char to ASCII code
        array.append(char_to_ascii("\n"))  # line separator
    return array


# create the file if not exist
def create_file(file_path: str = FILE_PATH):
    bytes_array = bytes(generate_file(ORIGINAL_TEXT, True))  # convert the list to bytes
    try:
        if not os.path.exists(file_path):  # check if file exists
            with open(file_path, "wb") as f:
                f.write(bytes_array)  # write the bytes to the file
            print(f"File {file_path} created successfully")
    except Exception as e:
        print(f"Error: {e}")


# this function read the file and return the content as a single string
def read_bin_file(file_path: str = FILE_PATH) -> str:
    try:
        list_chars = []
        with open(FILE_PATH, "rb") as f:
            while byte := f.read(1):
                list_chars.append(
                    ascii_to_char(int(byte.hex(), 16))
                )  # convert the byte to ASCII code
        # merge array in single string
        return "".join(list_chars)
    except Exception as e:
        print(f"Error: {e}")
        return None


# this function swap the name and lastname of each lines + add a comma separator between them
def swap_name_and_lastname(text: str) -> str:
    new_list = []
    for line in text.split("\n"):
        line = line.replace(LINE_SEPARATOR, "")  # remove non printable strings
        substrings = line.split(" ")
        # add each element, start from 1 to n and then append position 0
        first_item_array = substrings.pop(0)  # get 1st (CARNET)
        # new row the remaining array
        new_list.append(["".join([item + " " for item in substrings])])
        new_list.append(CSV_SEPARATOR)
        new_list.append(f"{first_item_array}\n")

    return "".join(["".join([str(e) for e in line]) for line in new_list])


def export_to_csv(text: str, file_path: str = CSV_FILE_PATH):
    bytes_array = bytes(generate_file(text))  # convert the list to bytes
    try:
        if not os.path.exists(file_path):  # check if file exists
            with open(file_path, "wb") as f:
                f.write(bytes_array)  # write the bytes to the file
            print(f"File {file_path} created successfully")
    except Exception as e:
        print(f"Error: {e}")


def main():
    create_file()
    file_content = read_bin_file()
    csv_content = swap_name_and_lastname(file_content)
    export_to_csv(csv_content)


if __name__ == "__main__":
    main()
