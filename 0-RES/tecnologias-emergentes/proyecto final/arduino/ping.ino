#include <WiFi.h>
#include <HTTPClient.h>

// Configuración WiFi
const char* ssid = "CLARO_D63983";
const char* password = "EF2667D17C";

// Configuración del endpoint
const char* serverUrl = "http://192.168.1.214:8000/api/ping";

void setup() {
  Serial.begin(115200);
  delay(1000);

  // Conexión a WiFi
  Serial.print("Conectando a WiFi...");
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi conectado");
  Serial.print("Dirección IP: ");
  Serial.println(WiFi.localIP());
}

void loop() {
  if (WiFi.status() == WL_CONNECTED) {
    HTTPClient http;

    http.begin(serverUrl); // Iniciar conexión HTTP
    int httpResponseCode = http.GET(); // Realizar GET

    if (httpResponseCode > 0) {
      Serial.print("Código respuesta HTTP: ");
      Serial.println(httpResponseCode);
      String payload = http.getString();
      Serial.print("Respuesta del servidor: ");
      Serial.println(payload);
    } else {
      Serial.print("Error en la solicitud HTTP: ");
      Serial.println(httpResponseCode);
    }

    http.end(); // Finalizar conexión HTTP
  } else {
    Serial.println("WiFi no está conectado");
  }

  delay(10000); // Esperar 10 segundos antes de la próxima solicitud
}
