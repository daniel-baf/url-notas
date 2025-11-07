#include <driver/i2s.h>
#include <SD.h>
#include <SPI.h>

// Pines I2S para el micrófono
#define I2S_WS 25    // LRCLK
#define I2S_SD 32    // DOUT
#define I2S_SCK 26   // BCLK
#define I2S_PORT I2S_NUM_0

// Pines SPI para el lector SD
#define SD_CS 5      // Chip Select en D5
#define SD_SCK 18    // SCK en D18
#define SD_MOSI 23   // MOSI en D23
#define SD_MISO 19   // MISO en D19

// Configuración de grabación
#define SAMPLE_RATE 16000        // Frecuencia de muestreo
#define BITS_PER_SAMPLE 32       // Bits por muestra
#define BUFFER_SIZE 1024         // Tamaño del buffer
#define RECORD_TIME 10           // Tiempo de grabación en segundos
#define FILENAME "/recording.wav" // Nombre del archivo

// Estructura del encabezado WAV
struct WavHeader {
  // RIFF Header
  char riff_header[4] = {'R', 'I', 'F', 'F'}; // "RIFF"
  uint32_t wav_size;                         // Tamaño del archivo - 8
  char wave_header[4] = {'W', 'A', 'V', 'E'}; // "WAVE"
  
  // Format Header
  char fmt_header[4] = {'f', 'm', 't', ' '};  // "fmt "
  uint32_t fmt_chunk_size = 16;               // Tamaño del chunk de formato (16 para PCM)
  uint16_t audio_format = 1;                  // Formato (1 = PCM)
  uint16_t num_channels = 1;                  // Número de canales (1 = mono)
  uint32_t sample_rate = SAMPLE_RATE;         // Frecuencia de muestreo
  uint32_t byte_rate = SAMPLE_RATE * (BITS_PER_SAMPLE / 8); // Byte rate
  uint16_t block_align = BITS_PER_SAMPLE / 8;  // Block align
  uint16_t bits_per_sample = BITS_PER_SAMPLE;  // Bits por muestra
  
  // Data Header
  char data_header[4] = {'d', 'a', 't', 'a'}; // "data"
  uint32_t data_bytes;                       // Tamaño de los datos
};

void setup() {
  Serial.begin(115200);
  delay(1000);
  Serial.println("Iniciando grabación de audio...");
  
  // Configurar SPI para SD
  SPI.begin(SD_SCK, SD_MISO, SD_MOSI);
  
  // Inicializar tarjeta SD
  if (!SD.begin(SD_CS)) {
    Serial.println("Error: No se pudo inicializar la tarjeta SD");
    while (1);
  }
  Serial.println("Tarjeta SD inicializada correctamente");
  
  // Configurar I2S
  i2s_config_t i2s_config = {
    .mode = i2s_mode_t(I2S_MODE_MASTER | I2S_MODE_RX),
    .sample_rate = SAMPLE_RATE,
    .bits_per_sample = I2S_BITS_PER_SAMPLE_32BIT,
    .channel_format = I2S_CHANNEL_FMT_ONLY_LEFT,
    .communication_format = I2S_COMM_FORMAT_I2S,
    .intr_alloc_flags = ESP_INTR_FLAG_LEVEL1,
    .dma_buf_count = 4,
    .dma_buf_len = 256,
    .use_apll = false,
    .tx_desc_auto_clear = false,
    .fixed_mclk = 0
  };

  i2s_pin_config_t pin_config = {
    .bck_io_num = I2S_SCK,
    .ws_io_num = I2S_WS,
    .data_out_num = I2S_PIN_NO_CHANGE,
    .data_in_num = I2S_SD
  };
  
  // Inicializar I2S
  i2s_driver_install(I2S_PORT, &i2s_config, 0, NULL);
  i2s_set_pin(I2S_PORT, &pin_config);
  i2s_zero_dma_buffer(I2S_PORT);
  
  // Grabar audio
  recordAudio();
  
  // Desinstalar el driver I2S
  i2s_driver_uninstall(I2S_PORT);
  
  Serial.println("Programa finalizado. Grabación guardada en la tarjeta SD.");
}

void loop() {
  // Nada en el loop, la grabación se realiza en el setup
}

void recordAudio() {
  // Calcular tamaño de datos y actualizar el encabezado WAV
  uint32_t dataSize = SAMPLE_RATE * (BITS_PER_SAMPLE / 8) * RECORD_TIME;
  WavHeader header;
  header.wav_size = dataSize + sizeof(header) - 8;
  header.data_bytes = dataSize;
  
  // Crear archivo
  File file = SD.open(FILENAME, FILE_WRITE);
  if (!file) {
    Serial.println("Error: No se pudo crear el archivo");
    return;
  }
  
  // Escribir encabezado WAV
  file.write((uint8_t*)&header, sizeof(header));
  
  // Preparar para grabar datos
  uint8_t buffer[BUFFER_SIZE];
  size_t bytesRead;
  uint32_t samplesWritten = 0;
  uint32_t totalSamples = SAMPLE_RATE * RECORD_TIME;
  uint32_t startTime = millis();
  
  Serial.println("Grabando audio durante 10 segundos...");
  
  // Bucle de grabación
  while (samplesWritten < totalSamples) {
    // Leer datos del micrófono
    i2s_read(I2S_PORT, &buffer, BUFFER_SIZE, &bytesRead, portMAX_DELAY);
    
    // Procesar datos (convertir de 32 bits a 16 bits si es necesario)
    // Para INMP441 normalmente debemos ajustar los datos
    // En este caso simplemente guardamos los datos sin procesar
    
    // Escribir a archivo
    file.write(buffer, bytesRead);
    
    // Actualizar contador
    samplesWritten += bytesRead / 4; // 4 bytes por muestra de 32 bits
    
    // Mostrar progreso
    if (millis() - startTime > 1000) {
      Serial.printf("Grabando... %d%%\n", (samplesWritten * 100) / totalSamples);
      startTime = millis();
    }
  }
  
  // Cerrar archivo
  file.close();
  Serial.println("Grabación finalizada");
  Serial.printf("Archivo guardado: %s\n", FILENAME);
}