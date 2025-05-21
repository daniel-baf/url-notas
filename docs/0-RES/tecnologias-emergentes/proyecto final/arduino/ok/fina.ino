#include <driver/i2s.h>
#include <SD.h>
#include <SPI.h>
#include <WiFi.h>
#include <HTTPClient.h>

// I2S microphone pins
#define I2S_WS 25    // LRCLK
#define I2S_SD 32    // DOUT
#define I2S_SCK 26   // BCLK
#define I2S_PORT I2S_NUM_0

// SPI pins for SD card
#define SD_CS 5
#define SD_SCK 18
#define SD_MOSI 23
#define SD_MISO 19

// Audio recording configuration
#define SAMPLE_RATE 16000
#define BITS_PER_SAMPLE 32
#define BUFFER_SIZE 1024
#define RECORD_TIME 5
#define FILENAME "/recording.wav"

// Tiempo máximo de espera para la respuesta del servidor (en milisegundos)
unsigned long httpTimeoutMs = 1000; 


// Wi-Fi credentials
const char* ssid = "TIGO-2C73";
const char* password = "4NJ667300472";

// API endpoint
const char* serverUrl = "http://192.168.0.17:8000/api/upload/";

// Time to wait before starting the next recording (in milliseconds)
unsigned long delayAfterSuccess = 6000;  // configurable delay

// WAV header structure for proper formatting
struct WavHeader {
  char riff_header[4] = {'R', 'I', 'F', 'F'};
  uint32_t wav_size;
  char wave_header[4] = {'W', 'A', 'V', 'E'};

  char fmt_header[4] = {'f', 'm', 't', ' '};
  uint32_t fmt_chunk_size = 16;
  uint16_t audio_format = 1;
  uint16_t num_channels = 1;
  uint32_t sample_rate = SAMPLE_RATE;
  uint32_t byte_rate = SAMPLE_RATE * (BITS_PER_SAMPLE / 8);
  uint16_t block_align = BITS_PER_SAMPLE / 8;
  uint16_t bits_per_sample = BITS_PER_SAMPLE;

  char data_header[4] = {'d', 'a', 't', 'a'};
  uint32_t data_bytes;
};

void setup() {
  Serial.begin(115200);
  delay(1000);

  // Connect to Wi-Fi
  WiFi.begin(ssid, password);
  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("\nWi-Fi connected");

  // Initialize SPI and SD card
  SPI.begin(SD_SCK, SD_MISO, SD_MOSI);
  if (!SD.begin(SD_CS)) {
    Serial.println("Error: SD card initialization failed");
    while (1);
  }

  // Configure I2S
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

  i2s_driver_install(I2S_PORT, &i2s_config, 0, NULL);
  i2s_set_pin(I2S_PORT, &pin_config);
  i2s_zero_dma_buffer(I2S_PORT);

  Serial.println("Setup complete. Starting recording loop...");
}

void loop() {
  recordAudio();

  bool success = sendAudioFile();

  if (success) {
    Serial.println("Waiting before next recording...");
    delay(delayAfterSuccess);
  }
}

void recordAudio() {
  uint32_t dataSize = SAMPLE_RATE * (BITS_PER_SAMPLE / 8) * RECORD_TIME;
  WavHeader header;
  header.wav_size = dataSize + sizeof(header) - 8;
  header.data_bytes = dataSize;

  File file = SD.open(FILENAME, FILE_WRITE);
  if (!file) {
    Serial.println("Error: Cannot create file");
    return;
  }

  file.write((uint8_t*)&header, sizeof(header));

  uint8_t buffer[BUFFER_SIZE];
  size_t bytesRead;
  uint32_t samplesWritten = 0;
  uint32_t totalSamples = SAMPLE_RATE * RECORD_TIME;
  uint32_t startTime = millis();

  Serial.println("Recording audio...");

  while (samplesWritten < totalSamples) {
    i2s_read(I2S_PORT, &buffer, BUFFER_SIZE, &bytesRead, portMAX_DELAY);
    file.write(buffer, bytesRead);
    samplesWritten += bytesRead / 4;

    if (millis() - startTime > 1000) {
      startTime = millis();
    }
  }

  file.close();
}

bool sendAudioFile() {
  File audioFile = SD.open(FILENAME);
  if (!audioFile) {
    Serial.println("Error: Cannot open audio file");
    return false;
  }

  size_t fileSize = audioFile.size();
  Serial.printf("Sending file of size: %d bytes\n", fileSize);

  WiFiClient client;
  HTTPClient http;

  http.setTimeout(httpTimeoutMs);  // Usa valor configurable
  http.begin(client, serverUrl);
  http.addHeader("Content-Type", "audio/wav");
  http.addHeader("Content-Length", String(fileSize));

  int httpResponseCode = http.sendRequest("POST", &audioFile, fileSize);

  audioFile.close();
  http.end();

  if (httpResponseCode > 0) {
    Serial.printf("POST successful, code: %d\n", httpResponseCode);
    return true;
  } else {
    Serial.printf("POST failed or timeout: %s\n", http.errorToString(httpResponseCode).c_str());
    return false;
  }
}

