#include <driver/i2s.h>

#define I2S_WS      25   // LRCLK
#define I2S_SD      32   // DOUT
#define I2S_SCK     26   // BCLK

#define I2S_PORT    I2S_NUM_0
#define BUFFER_SIZE 1024

void setup() {
  Serial.begin(115200);
  delay(1000);

  // Configurar I2S
  i2s_config_t i2s_config = {
    .mode = i2s_mode_t(I2S_MODE_MASTER | I2S_MODE_RX),
    .sample_rate = 16000,
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

  Serial.println("INMP441 listo. Capturando datos...");
}

void loop() {
  uint8_t buffer[BUFFER_SIZE];
  size_t bytesRead;

  i2s_read(I2S_PORT, &buffer, BUFFER_SIZE, &bytesRead, portMAX_DELAY);

  // Interpretar como muestras de 32 bits
  int32_t* samples = (int32_t*)buffer;
  int samples_count = bytesRead / 4; // 4 bytes por muestra

  for (int i = 0; i < samples_count; i += 16) { // Solo imprimir algunas muestras para no saturar
    Serial.println(samples[i]);
  }

  delay(100);
}
