#include <SPI.h>
#include <SD.h>

// Pines SPI para el lector SD (ajustados a tu conexión)
#define SD_CS   5   // Chip Select en D5
#define SD_SCK  18  // SCK en D18
#define SD_MOSI 23  // MOSI en D23
#define SD_MISO 19  // MISO en D19

void setup() {
  Serial.begin(115200);
  delay(1000);  // Espera para inicializar el Serial

  Serial.println("Iniciando prueba del lector SD...");

  // Inicializar SPI con los pines personalizados
  SPI.begin(SD_SCK, SD_MISO, SD_MOSI, SD_CS);  // Específico para ESP32

  // Inicializar la tarjeta SD
  if (!SD.begin(SD_CS)) {
    Serial.println("¡Error al inicializar la SD!");
    Serial.println("Verifica:");
    Serial.println("- Conexiones (CS, SCK, MOSI, MISO)");
    Serial.println("- Si la tarjeta está insertada correctamente");
    Serial.println("- Formato de la tarjeta (FAT32)");
    return;
  }

  Serial.println("SD inicializada correctamente.");

  // Crear un archivo de prueba y escribir en él
  File archivo = SD.open("/prueba.txt", FILE_WRITE);
  if (archivo) {
    archivo.println("¡Funciona! Esta es una prueba de escritura.");
    archivo.close();
    Serial.println("Datos escritos en 'prueba.txt'.");
  } else {
    Serial.println("Error al crear/abrir el archivo.");
  }

  // Leer el archivo y mostrar su contenido
  archivo = SD.open("/prueba.txt");
  if (archivo) {
    Serial.println("Contenido de 'prueba.txt':");
    while (archivo.available()) {
      Serial.write(archivo.read());
    }
    archivo.close();
  } else {
    Serial.println("Error al leer el archivo.");
  }
}

void loop() {
  // Nada aquí, solo prueba en el setup
}