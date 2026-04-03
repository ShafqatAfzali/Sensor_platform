#include "main.h"
#include "cmsis_os2.h"
#include <stddef.h>
#include "mytouch.h"
#include "adc.h"
#include "dma.h"
#include "gpio.h"

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


//aktiverer pin x til adc
//hvis i=0, PA0 (channel 0)
//hvis i=1, PA1 (channel 1)
void set_pin_adc(int i)
{
    GPIO_InitTypeDef GPIO_InitStruct = {0};

    if(i==0){
    	GPIO_InitStruct.Pin = XR_Pin;
    }else{
    	GPIO_InitStruct.Pin = YU_Pin;
    }
    GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
    GPIO_InitStruct.Pull = GPIO_NOPULL;

    if(i==0){
    	HAL_GPIO_Init(XR_GPIO_Port, &GPIO_InitStruct);
    }else{
    	HAL_GPIO_Init(YU_GPIO_Port, &GPIO_InitStruct);
    }
}


//aktiverer pin x til output VCC
//hvis i=0, PA0 til VCC
//hvis i=1, PA1 til VCC
void set_pin_vcc(int i)
{
    GPIO_InitTypeDef GPIO_InitStruct = {0};

    if(i==0){
    	GPIO_InitStruct.Pin = XR_Pin;
    }else{
    	GPIO_InitStruct.Pin = YU_Pin;

    }
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;

    if(i==0){
        HAL_GPIO_Init(XR_GPIO_Port, &GPIO_InitStruct);
        HAL_GPIO_WritePin(XR_GPIO_Port, XR_Pin, GPIO_PIN_SET);
    }else{
        HAL_GPIO_Init(YU_GPIO_Port, &GPIO_InitStruct);
        HAL_GPIO_WritePin(YU_GPIO_Port, YU_Pin, GPIO_PIN_SET);
    }

}


//setter pin x til ground
//hvis i=0, P40 (X left) til GND
//hvis i=1, PB0 (Y down) til GND
void set_pin_gnd(int i)
{
    GPIO_InitTypeDef GPIO_InitStruct = {0};

    if(i==0){
    	GPIO_InitStruct.Pin = XL_Pin;
    }else{
    	GPIO_InitStruct.Pin = YD_Pin;

    }
    GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    GPIO_InitStruct.Pull = GPIO_NOPULL;
    GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;

    if(i==0){
        HAL_GPIO_Init(XL_GPIO_Port, &GPIO_InitStruct);
        HAL_GPIO_WritePin(XL_GPIO_Port, XL_Pin, GPIO_PIN_SET);
    }else{
        HAL_GPIO_Init(YD_GPIO_Port, &GPIO_InitStruct);
        HAL_GPIO_WritePin(YD_GPIO_Port, YD_Pin, GPIO_PIN_SET);
    }

}

//setter xleft og ydown til høy resistans,dvs not connected
void set_pin_hi_z(int i)
{
    GPIO_InitTypeDef GPIO_InitStruct = {0};

    if(i==0){
    	GPIO_InitStruct.Pin = XL_Pin;
    }else{
    	GPIO_InitStruct.Pin = YD_Pin;

    }
    GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
    GPIO_InitStruct.Pull = GPIO_NOPULL;

    if(i==0){
        HAL_GPIO_Init(XL_GPIO_Port, &GPIO_InitStruct);
    }else{
        HAL_GPIO_Init(YD_GPIO_Port, &GPIO_InitStruct);
    }

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

