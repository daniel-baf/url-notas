# CONFIGURA LA SD PARA SER USADA CON EL 
# FORMATO FAT32

lsblk

sudo wipefs -a /dev/sdb

sudo fdisk /dev/sdb

# Presiona o para crear una nueva tabla de particiones DOS.
# Presiona n para crear una nueva partición primaria.
# Presiona p, luego 1, ENTER, ENTER (acepta los valores por defecto).
# Presiona t, escribe c para establecer tipo FAT32 LBA.
# Presiona w para escribir y salir.

sudo mkfs.vfat -F 32 /dev/sdb1 -n ESP32_SD

udisksctl mount -b /dev/sdb1

df -T | grep sdb
