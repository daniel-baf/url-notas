# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.
# INSTALL pyserial y

# import pyfirmata
import time

import serial

arduino = serial.Serial(port='/dev/ttyACM0', baudrate=9600, timeout=0.1)


def wr_serial(x):
    arduino.write(bytes(x, 'utf-8'))
    time.sleep(0.05)
    data = arduino.readline()
    return data


while True:
    try:
        num = input('NUMBER ->: ')
        valor = wr_serial(num)
        if valor == b'0\r\n':
            print('ON')
        else:
            print('OFF')
    except Exception as e:
        print(e)

# Press the green button in the gutter to run the script.
# if __name__ == '__main__':
#     test()
# See PyCharm help at https://www.jetbrains.com/help/pycharm/
