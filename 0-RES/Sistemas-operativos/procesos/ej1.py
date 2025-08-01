# DANIEL EDUARDO BAUTISTA FUENTES
# 2121323
# EJERCICIO NO. 1, DECKER

import threading
import time

# Variables compartidas
flag = [False, False]  # Flags para indicar intención de acceso
turn = 0  # Indica el turno del proceso
shared_variable = 0  # Variable compartida


def process(id):
    """
    Simula un proceso que utiliza el algoritmo de Dekker para acceder a una sección crítica.

    Args:
        id (int): Identificador del proceso (0 o 1).
    """
    global shared_variable, turn
    other = 1 - id  # ID del otro proceso

    for _ in range(5):  # Cada proceso entra 5 veces en la sección crítica
        # Entrada a la sección crítica
        flag[id] = True  # Indica intención de acceso
        while flag[other]:  # Si el otro proceso quiere entrar
            if turn != id:
                flag[id] = False  # Cede el acceso
                while turn != id:
                    pass  # Espera su turno
                flag[id] = True  # Vuelve a intentar

        # Sección crítica
        shared_variable += 1
        print(f"Proceso {id}: Sección crítica, shared_variable = {shared_variable}")
        time.sleep(0.1)  # Simula trabajo en la sección crítica

        # Salida de la sección crítica
        turn = other  # Cede el turno al otro proceso
        flag[id] = False  # Indica que ha salido

        # Sección no crítica
        print(f"Proceso {id}: Sección no crítica")
        time.sleep(0.1)


# Creación de los hilos
thread1 = threading.Thread(target=process, args=(0,))
thread2 = threading.Thread(target=process, args=(1,))

# Iniciar los hilos
thread1.start()
thread2.start()

# Esperar a que terminen
thread1.join()
thread2.join()

print("Ejecución completada")
