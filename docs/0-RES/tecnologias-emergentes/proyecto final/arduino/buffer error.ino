#include <WiFi.h>
#include <HTTPClient.h>
#include <driver/i2s.h>

// Configuración WiFi
const char* ssid = "CLARO_D63983";
const char* password = "EF2667D17C";


// Configuración del endpoint
const char* serverUrl = "http://192.168.1.214:8000/api/upload-audio/";

// Configuración de grabación
const int recordSeconds = 5;       // Duración de cada grabación (segundos)
const int intervalSeconds = 10;    // Intervalo entre grabaciones (segundos)

// Configuración I2S para INMP441
const i2s_port_t I2S_PORT = I2S_NUM_0;
const int SAMPLE_RATE = 16000;     // 16KHz
const int SAMPLE_BITS = 16;
const int CHANNELS = 1;            // Mono
const int BUFFER_SIZE = 1024;

// Estructura WAV básica
struct wavHeader {
  char chunkId[4] = {'R', 'I', 'F', 'F'};
  uint32_t chunkSize;
  char format[4] = {'W', 'A', 'V', 'E'};
  char subchunk1Id[4] = {'f', 'm', 't', ' '};
  uint32_t subchunk1Size = 16;
  uint16_t audioFormat = 1;        // PCM
  uint16_t numChannels = CHANNELS;
  uint32_t sampleRate = SAMPLE_RATE;
  uint32_t byteRate = SAMPLE_RATE * CHANNELS * (SAMPLE_BITS/8);
  uint16_t blockAlign = CHANNELS * (SAMPLE_BITS/8);
  uint16_t bitsPerSample = SAMPLE_BITS;
  char subchunk2Id[4] = {'d', 'a', 't', 'a'};
  uint32_t subchunk2Size;
};

void setup() {
  Serial.begin(115200);
  
  // Conectar a WiFi
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("Conectado a ");
  Serial.println(ssid);
  Serial.print("Dirección IP: ");
  Serial.println(WiFi.localIP());

  // Configurar I2S - Versión corregida
  i2s_config_t i2s_config = {
    .mode = (i2s_mode_t)(I2S_MODE_MASTER | I2S_MODE_RX),
    .sample_rate = SAMPLE_RATE,
    .bits_per_sample = (i2s_bits_per_sample_t)SAMPLE_BITS,
    .channel_format = I2S_CHANNEL_FMT_ONLY_LEFT,
    .communication_format = I2S_COMM_FORMAT_I2S,
    .intr_alloc_flags = ESP_INTR_FLAG_LEVEL1,
    .dma_buf_count = 8,
    .dma_buf_len = BUFFER_SIZE,
    .use_apll = false
  };

  // Versión CORRECTA del pin config - ORDEN EXACTO requerido
  i2s_pin_config_t pin_config = {
    .mck_io_num = I2S_PIN_NO_CHANGE,  // No usado
    .bck_io_num = 32,    // SCK
    .ws_io_num = 25,     // WS
    .data_out_num = I2S_PIN_NO_CHANGE, // No usado en modo RX
    .data_in_num = 33    // SD
  };

  i2s_driver_install(I2S_PORT, &i2s_config, 0, NULL);
  i2s_set_pin(I2S_PORT, &pin_config);
  i2s_set_clk(I2S_PORT, SAMPLE_RATE, (i2s_bits_per_sample_t)SAMPLE_BITS, I2S_CHANNEL_MONO);

  Serial.println("Configuración completada. Iniciando ciclo de grabación...");
}

void loop() {
  // Grabar audio
  Serial.println("Iniciando grabación...");
  uint8_t* wavData = recordAudio();
  
  // Enviar audio al servidor
  if (wavData != nullptr) {
    sendAudioToServer(wavData);
    free(wavData); // Liberar memoria
  }
  
  // Esperar antes de la próxima grabación
  Serial.print("Esperando ");
  Serial.print(intervalSeconds);
  Serial.println(" segundos...");
  delay(intervalSeconds * 1000);
}

uint8_t* recordAudio() {
  int totalSamples = SAMPLE_RATE * recordSeconds;
  int totalBytes = totalSamples * (SAMPLE_BITS/8) * CHANNELS;
  
  // Crear buffer para los datos de audio
  int16_t* audioBuffer = (int16_t*)malloc(totalSamples * sizeof(int16_t));
  if (audioBuffer == nullptr) {
    Serial.println("Error al asignar memoria para el buffer de audio");
    return nullptr;
  }
  
  // Leer datos del micrófono
  size_t bytesRead;
  int samplesRead = 0;
  
  while (samplesRead < totalSamples) {
    int remainingSamples = totalSamples - samplesRead;
    int samplesToRead = (remainingSamples > BUFFER_SIZE) ? BUFFER_SIZE : remainingSamples;
    
    i2s_read(I2S_PORT, &audioBuffer[samplesRead], samplesToRead * sizeof(int16_t), &bytesRead, portMAX_DELAY);
    samplesRead += bytesRead / sizeof(int16_t);
  }
  
  Serial.print("Grabación completada. Muestras: ");
  Serial.println(samplesRead);
  
  // Crear encabezado WAV
  wavHeader header;
  header.chunkSize = 36 + totalBytes;
  header.subchunk2Size = totalBytes;
  
  // Crear buffer WAV completo
  uint8_t* wavData = (uint8_t*)malloc(sizeof(wavHeader) + totalBytes);
  if (wavData == nullptr) {
    Serial.println("Error al asignar memoria para el WAV");
    free(audioBuffer);
    return nullptr;
  }
  
  // Copiar encabezado
  memcpy(wavData, &header, sizeof(wavHeader));
  
  // Copiar datos de audio
  memcpy(wavData + sizeof(wavHeader), audioBuffer, totalBytes);
  
  free(audioBuffer);
  return wavData;
}

void sendAudioToServer(uint8_t* wavData) {
  if (WiFi.status() != WL_CONNECTED) {
    Serial.println("Error: WiFi no conectado");
    return;
  }
  
  HTTPClient http;
  http.begin(serverUrl);
  
  // Configurar headers para datos binarios
  http.addHeader("Content-Type", "application/octet-stream");
  http.addHeader("Content-Disposition", "attachment; filename=audio.wav");
  
  // Obtener tamaño del WAV (encabezado + datos)
  wavHeader* header = (wavHeader*)wavData;
  int wavSize = sizeof(wavHeader) + header->subchunk2Size;
  
  Serial.print("Enviando archivo WAV de ");
  Serial.print(wavSize);
  Serial.println(" bytes...");
  
  // Enviar datos binarios directamente
  int httpResponseCode = http.POST(wavData, wavSize);
  
  if (httpResponseCode > 0) {
    String response = http.getString();
    Serial.print("Respuesta del servidor (");
    Serial.print(httpResponseCode);
    Serial.print("): ");
    Serial.println(response);
  } else {
    Serial.print("Error en la solicitud: ");
    Serial.println(httpResponseCode);
    Serial.print("Error: ");
    Serial.println(http.errorToString(httpResponseCode));
  }
  
  http.end();
}