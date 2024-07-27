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
ORIGINAL_TEXT = "ALBIZUREZ ALPIREZ DANIEL\nBARRIOS ESTRADA JOSUE EMANUEL\nBAUTISTA FUENTES DANIEL EDUARDO\nCÁCERES FUENTES JULIO ALEJANDRO\nCARRETO AGUILÓN DENNYS ROLANDO YOSIMAR\nCASTAÑEDA VASQUEZ JOSE DAVID\nCHACLÁN GUINEA ALLAN FRANCISCO MOISES\nCORTÉS ENRIQUEZ JUAN MARCOS\nCOS ALVAREZ MARIA LUISA\nDE LEON LIMA ABEL ALEXANDER\nESPINOZA FERNÁNDEZ RUBEN FERNANDO\nGUTIÉRREZ DE LEÓN JASON MISAEL\nJUI ASCOLI JOSHUA\nLAINES PABLO KAREN FLORIDALMA\nLARA DE LEÓN VYNCEN YOEL\nMACARIO VELASQUEZ MIGUEL ALFONZO\nORDOÑEZ LÓPEZ IVÁN ALEXANDER\nOVALLE HERNANDEZ LUIS MANUEL\nRONQUILLO MEZA JOSÉ ANTONIO\nSALGUERO SANDOVAL MIGUEL ANTONIO\nSANCHEZ TASEJ FRANCISCO JAVIER\nSIQUINÁ TZÚN SEBASTIAN JOSUÉ\nTIGÜILÁ SOLOJ MARÍA ESTHER\nTZUNÚN TAX ALESSANDRO CARLOS JOSÉ\nVILLATORO TZOC LESTHER RODNY HÁMILTON\nVILLEGAS VELASCO CHRISTIAN ANDRÉS\nYAX PUÁC KEVIN MIGUEL"
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
        # add each element, 2 and 3 -> 0 and 1 position
        new_list.append(  # TODO check if the None value makes a conflict in csv
            [
                f"{substrings[2]} " if len(substrings) > 2 else "",
                f"{substrings[3]}" if len(substrings) > 3 else "",
                f"{CSV_SEPARATOR}",
                f"{substrings[0]} " if len(substrings) > 0 else "",
                f"{substrings[1]}" if len(substrings) > 1 else "",
                "\n",
            ]
        )

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
