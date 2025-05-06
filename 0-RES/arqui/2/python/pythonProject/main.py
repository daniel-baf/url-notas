# This is a sample Python script.

# Press Ctrl+F5 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.

import serial
import collections
# import time
import matplotlib.pyplot as plt
import matplotlib.animation as animation
# import numpy as np

serial_port = '/dev/ttyACM0'
baud_rate = 9600
serial_connection = None
sampling = 100
data = collections.deque([0.0] * sampling, maxlen=sampling)
lines = None
sampling_time = 100

x_min = 0
x_max = sampling
y_min = -75
y_max = 75


def get_serial_data(self, sampling, serial_connection, lines, line_value_text, line_label):
    global data
    try:
        value = float(serial_connection.readLine().strip())
        data.append(value)
        lines.set_data(range(sampling, data))

    except Exception as e:
        print(f'Unable to get serial data, error: {e}')


try:
    serial_connection = serial.Serial(serial_port, baud_rate)
except:
    print('Unable to connect to port :c ...', serial_port)


fig2 = plt.figure(figsize=(13, 6))
ax = plt.axes(xlim=(x_min, x_max), ylim=(y_min, y_max))
plt.title('Read from analog channel on real time (Voltage)')
ax.set_ylabel('Voltage')
ax.set_xlabel('Sampling')

line_label = 'V'
lines = ax.plot([], [], label=line_label)[0]
line_value_text = ax.text(0.85, 0.95, '', transform=ax.transAxes)  # graph is 6 cm x 16cm -> middle

anim = animation.FuncAnimation(fig2, get_serial_data, fargs=(sampling, serial_connection, lines, line_label),
                               interval=sampling_time)
