#include "main.h"
#include "cmsis_os2.h"
#include <stddef.h>
#include "mytouch.h"

pinstate XR_state;
pinstate XL_state;
pinstate YU_state;
pinstate YD_state;


osThreadId_t touchscreen_thread_id;


//skal bruke ADC1 med channel 0 for XR --> PA0
#define XR_Pin GPIO_PIN_0
#define XR_GPIO_Port GPIOA
//skal bruke ADC1 med channel 1 for YU --> PA1
#define YU_Pin GPIO_PIN_1
#define YU_GPIO_Port GPIOA

//skal bruke den som er under på development board som XL --> PA4
#define XL_Pin GPIO_PIN_4
#define XL_GPIO_Port GPIOA
//skal bruke den som er under på development board som YD --> PB0
#define YD_Pin GPIO_PIN_0
#define YD_GPIO_Port GPIOB

void set_analog_ou(int i){
    // setter Pinnene til Analog pinner
    GPIO_InitTypeDef GPIO_InitStruct = {0};

    if(i == 0) {
        GPIO_InitStruct.Pin = XR_Pin;
    } else {
        GPIO_InitStruct.Pin = YU_Pin;
    }

    GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

}

//setter pinnen til adc, 0 Xr pinne og 1 YU pinne
void set_adc(int i)
{
    //starter klokken
    __HAL_RCC_ADC1_CLK_ENABLE();
    __HAL_RCC_GPIOA_CLK_ENABLE();
    __HAL_RCC_DMA2_CLK_ENABLE();

    // konfigurerer ADC
    hadc1.Instance = ADC1;
    hadc1.Init.Resolution = ADC_RESOLUTION_12B;
    hadc1.Init.ScanConvMode = DISABLE;
    hadc1.Init.ContinuousConvMode = DISABLE;
    hadc1.Init.DiscontinuousConvMode = DISABLE;
    hadc1.Init.ExternalTrigConv = ADC_EXTERNALTRIGCONV_T2_TRGO;
    hadc1.Init.ExternalTrigConvEdge = ADC_EXTERNALTRIGCONVEDGE_RISING;
    hadc1.Init.DataAlign = ADC_DATAALIGN_RIGHT;
    hadc1.Init.NbrOfConversion = 1;
    hadc1.Init.DMAContinuousRequests = ENABLE;
    hadc1.Init.EOCSelection = ADC_EOC_SINGLE_CONV;

    HAL_ADC_Init(&hadc1);

    //setter adc channel, (IN0) chennel 0--> PA0 og (IN1) channel 1 --> PA1
    ADC_ChannelConfTypeDef sConfig = {0};

    if(i == 0) {
        sConfig.Channel = ADC_CHANNEL_0;
    } else {
        sConfig.Channel = ADC_CHANNEL_1;
    }

    sConfig.Rank = 1;
    sConfig.SamplingTime = ADC_SAMPLETIME_15CYCLES;

    HAL_ADC_ConfigChannel(&hadc1, &sConfig);

    // 5 konfigurer DMA, DMA2_STRAM0 tilsvarer DMA for ADC1
    hdma_adc1.Instance = DMA2_Stream0;
    hdma_adc1.Init.Channel = DMA_CHANNEL_0;
    hdma_adc1.Init.Direction = DMA_PERIPH_TO_MEMORY;
    hdma_adc1.Init.PeriphInc = DMA_PINC_DISABLE;
    hdma_adc1.Init.MemInc = DMA_MINC_ENABLE;
    hdma_adc1.Init.PeriphDataAlignment = DMA_PDATAALIGN_HALFWORD;
    hdma_adc1.Init.MemDataAlignment = DMA_MDATAALIGN_HALFWORD;
    hdma_adc1.Init.Mode = DMA_CIRCULAR;
    hdma_adc1.Init.Priority = DMA_PRIORITY_Normal;

    HAL_DMA_Init(&hdma_adc1);

    // kobler dma til ADC1
    __HAL_LINKDMA(&hadc1, DMA_Handle, hdma_adc1);
}

void touchscreen_thread_func(){

	while(1){




		osDelay(100);
	}


}


void touchscreen_INIT(){

    const osThreadAttr_t touchscreen_thread_attr = {
        .name = "touchscreen_thread",
        .stack_size = 1024,
        .priority = osPriorityNormal,
    };

    touchscreen_thread_id = osThreadNew(touchscreen_thread_func, NULL, &touchscreen_thread_attr);


}

