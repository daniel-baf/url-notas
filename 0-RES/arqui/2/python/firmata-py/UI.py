from tkinter import *

import serial
arduino = serial.Serial(port='/dev/ttyACM0', baudrate=9600, timeout=0.01)

def led_status(x):
    if estado.get == 'ON': x=0
    arduino.write(bytes(x, 'utf-8'))
    if x == 1:
        estado.set('ON')
    else:
        estado.set('OFF')


# FORMULARIO
frmRoot = Tk()
frmRoot.geometry('400x300')
estado = StringVar()
estado.set('ON')
lblTitulo = Label(frmRoot, text='ON/OFF de un led')
lblTitulo.pack()
btnStatus = Button(frmRoot, textvariable=estado, command=led_status)
btnStatus.pack()
btnStatus = Button(frmRoot, textvariable=estado, btnStatus)