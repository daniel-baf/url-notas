#include <WiFi.h>
#include <HTTPClient.h>

const char* ssid = "CLARO_D63983";
const char* password = "EF2667D17C";
const char* serverUrl = "http://192.168.1.214:8000/api/stream";


void setup() {
    Serial.begin(115200);
    WiFi.begin(ssid, password);
    while (WiFi.status() != WL_CONNECTED) delay(500);
}

void loop() {
    if (WiFi.status() == WL_CONNECTED) {
        HTTPClient http;
        http.begin(serverUrl);
        http.addHeader("Content-Type", "application/octet-stream");

        // Simular captura de audio (reemplaza con tu micrófono)
        uint8_t audioBuffer[1024]; // Ejemplo: buffer PCM de 1024 bytes
        // ... (captura audio aquí) ...

        int httpResponseCode = http.POST(audioBuffer, sizeof(audioBuffer));
        if (httpResponseCode == 200) {
            Serial.println("Chunk enviado");
        }
        http.end();
    }
    delay(10); // Ajusta según tu tasa de muestreo.
}