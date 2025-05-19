[debf-evos@daniel-82wm ~]$ sudo firewall-cmd --list-ports  # Verifica si 8000/tcp está abierto

[debf-evos@daniel-82wm ~]$ sudo firewall-cmd --add-port=8000/tcp --permanent
success
[debf-evos@daniel-82wm ~]$ sudo firewall-cmd --reload
