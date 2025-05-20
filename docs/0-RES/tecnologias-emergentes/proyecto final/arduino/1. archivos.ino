#include <SPI.h>
#include <SD.h>

#define SD_CS 5  // Pin CS conectado a D5
SPIClass spiSD(VSPI);  // Usamos VSPI: MOSI=23, MISO=19, SCK=18

void setup() {
  Serial.begin(115200);
  delay(1000);

  // Inicialización del bus SPI con los pines definidos
  spiSD.begin(18, 19, 23, SD_CS);  // SCK, MISO, MOSI, CS

  Serial.println("Iniciando tarjeta SD...");
  if (!SD.begin(SD_CS, spiSD)) {
    Serial.println("❌ No se pudo montar la tarjeta SD");
    return;
  }

  Serial.println("✅ Tarjeta SD montada correctamente");

  // Escribir en el archivo
  File archivo = SD.open("/test.txt", FILE_WRITE);
  if (archivo) {
    archivo.println("Hola desde el ESP32 :)");
    archivo.println("Prueba de escritura en SD con SPI.");
    archivo.close();
    Serial.println("✅ Archivo escrito correctamente");
  } else {
    Serial.println("❌ No se pudo abrir test.txt para escritura");
  }

  // Leer el contenido del archivo
  archivo = SD.open("/test.txt");
  if (archivo) {
    Serial.println("📄 Contenido de test.txt:");
    while (archivo.available()) {
      Serial.write(archivo.read());
    }
    archivo.close();
  } else {
    Serial.println("❌ No se pudo abrir test.txt para lectura");
  }
}

void loop() {
  // Nada por ahora
}
