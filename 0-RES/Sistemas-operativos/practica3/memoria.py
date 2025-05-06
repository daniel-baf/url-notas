# import psutil
# memoria = psutil.virtual_memory()
# swap = psutil.swap_memory()
# print(f" Memoria Total: {memoria.total / (1024**3):.2f} GB")
# print(f" Memoria Disponible: {memoria.available / (1024**3):.2f} GB")
# print(f" Uso de Memoria: {memoria.percent}%")
# print(f" Uso de SWAP: {swap.percent}%")


# procesos = sorted(psutil.process_iter(attrs=['pid', 'name', 'memory_info']), key=lambda p:
# p.info['memory_info'].rss, reverse=True)
# print(" Top 10 procesos que más memoria consumen:")
# for proceso in procesos[:10]:
#  print(f"PID: {proceso.info['pid']} | {proceso.info['name']} | Memoria: {proceso.info['memory_info'].rss / (1024 ** 2):.2f} MB")



import time
print(" Reservando 500 MB de memoria...")
memoria = [0] * (500 * 1024 * 1024 // 4) # 500MB en enteros de 4 bytes
input(" Memoria reservada. Presiona Enter para liberarla...")
memoria = None # Liberar memoria
print(" Memoria liberada.")
time.sleep(2)