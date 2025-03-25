import time

print(" Forzando uso de swap...")
memoria = []
for _ in range(5):
 memoria.append(bytearray(500 * 1024 * 1024)) # Reserva 500MB en memoria
 time.sleep(2)
print(" Swap en uso.")
input("Presiona Enter para liberar la memoria...")
memoria = None