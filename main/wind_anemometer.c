#include "esp_log.h"
#include "nvs_flash.h"

#include "comm.c"
#include "driver/adc.h"
#include "driver/uart.h"   
#include "driver/gpio.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

// detect wind
void adc_task(void *pvParameters)
{
    while (1) {
        int raw = adc1_get_raw(ADC1_CHANNEL_6); //GPIO34
        uint8_t high = (raw >> 8) & 0xFF;
        uint8_t low = raw & 0xFF;
        comm_send(high);
        comm_send(low);
        ESP_LOGI("ANEMOMETER", "ADC raw: %d", raw);
        vTaskDelay(pdMS_TO_TICKS(1000));  
    }
}



void app_main(void){

    /*-------ADC init-----------*/
    adc1_config_width(ADC_WIDTH_BIT_12);  // 12bit
    adc1_config_channel_atten(ADC1_CHANNEL_6, ADC_ATTEN_DB_11); // GPIO34, attenuation: ~3.3V


    /*------Comm init--------- */
    comm_init();

    /*------ Anemometer detect task ---------*/
    xTaskCreate(adc_task, "adc_task", 4096, NULL, 5, NULL);


}
