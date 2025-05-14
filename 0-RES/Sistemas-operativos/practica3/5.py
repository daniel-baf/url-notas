import time
lista = []

print(" Simulando fuga de memoria...")
for _ in range(1000):
 lista.append([0] * (1024 * 1024)) # Agrega 1 MB por iteración
 time.sleep(0.1) # Para observar el consumo de memoria
print(" Fin del programa.")