#include <WiFi.h>
#include <HTTPClient.h>
#include <driver/i2s.h>

const char* ssid = "CLARO_D63983";
const char* password = "EF2667D17C";
const char* serverUrl = "http://192.168.1.214:8000/api/upload/";

// Configuración I2S
#define I2S_BCK 32
#define I2S_WS 25
#define I2S_DIN 33
#define SAMPLE_RATE 44100
#define BUFFER_SIZE 1024

void setup() {
  Serial.begin(115200);
  
  // Conexión WiFi
  WiFi.begin(ssid, password);
  while(WiFi.status() != WL_CONNECTED) delay(500);
  Serial.println("WiFi conectado");

  // Configuración I2S
  i2s_config_t i2s_config = {
    .mode = (i2s_mode_t)(I2S_MODE_MASTER | I2S_MODE_RX),
    .sample_rate = SAMPLE_RATE,
    .bits_per_sample = I2S_BITS_PER_SAMPLE_16BIT,
    .channel_format = I2S_CHANNEL_FMT_ONLY_LEFT,
    .communication_format = I2S_COMM_FORMAT_I2S,
    .intr_alloc_flags = ESP_INTR_FLAG_LEVEL1,
    .dma_buf_count = 8,
    .dma_buf_len = BUFFER_SIZE
  };

  // SOLUCIÓN 1 - Inicialización tradicional
  i2s_pin_config_t pin_config = {
    I2S_BCK,        // bck_io_num
    I2S_WS,         // ws_io_num
    I2S_DIN,        // data_in_num
    I2S_PIN_NO_CHANGE // data_out_num
  };

  i2s_driver_install(I2S_NUM_0, &i2s_config, 0, NULL);
  i2s_set_pin(I2S_NUM_0, &pin_config);
}

void loop() {
  int16_t buffer[BUFFER_SIZE];
  size_t bytesRead;
  
  if(i2s_read(I2S_NUM_0, &buffer, sizeof(buffer), &bytesRead, portMAX_DELAY) == ESP_OK) {
    if(bytesRead > 0 && WiFi.status() == WL_CONNECTED) {
      HTTPClient http;
      http.begin(serverUrl);
      http.addHeader("Content-Type", "application/octet-stream");
      http.POST((uint8_t*)buffer, bytesRead);
      http.end();
    }
  }
  delay(10);
}