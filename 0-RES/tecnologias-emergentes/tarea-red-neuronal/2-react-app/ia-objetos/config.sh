echo "Obtener la IP para hacer el PING desde la app"

# Obtenemos la IP de la máquina
IP=$(hostname -I | awk '{print $1}')

# Guardamos la IP en un archivo
rm -rf ./assets/config.json
echo "{\"BACKEND_API_URL\": \"http://$IP:3000\"}" > ./assets/config.json

sudo ufw allow 3000/tcp
sudo ufw allow 3001/tcp

