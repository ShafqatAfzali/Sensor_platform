#include "main.h"
#include "cmsis_os2.h"
#include <stddef.h>
#include "mytouch.h"
#include "print.h"
#include "adc.h"
#include "dma.h"
#include "gpio.h"


//skal bruke ADC1 med channel 0 for XR --> PA0
//skal bruke ADC2 med channel 1 for YU --> PA1

//skal bruke XL --> PA6
//skal bruke YD --> PA7


//skal bruke reading_xy til å informere om funksjonen leser x eller y
int reading_xy;
uint32_t xbuff[20]={0};
uint32_t ybuff[20]={0};

osThreadId_t touchscreen_thread_id;
osEventFlagsId_t touch_flag;
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
        HAL_GPIO_WritePin(XR_GPIO_Port, XR_Pin, 1);
    }else{
        HAL_GPIO_Init(YU_GPIO_Port, &GPIO_InitStruct);
        HAL_GPIO_WritePin(YU_GPIO_Port, YU_Pin, 1);
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
        HAL_GPIO_WritePin(XL_GPIO_Port, XL_Pin, 0);
    }else{
        HAL_GPIO_Init(YD_GPIO_Port, &GPIO_InitStruct);
        HAL_GPIO_WritePin(YD_GPIO_Port, YD_Pin, 0);
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

uint16_t avg(uint32_t *arr){
	uint32_t sum=0;
	for(int i=0; i<20; i++){
		sum+=arr[i];
	}
	uint16_t average=(uint16_t)(sum/20);
	return average;
}


void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef* hadc){
	if(hadc == &hadc1){
		osEventFlagsSet(touch_flag, 0x01);
	}else if(hadc == &hadc2){
		osEventFlagsSet(touch_flag, 0x02);
	}
}


void touchscreen_thread_func(){
	print("running touch thread\n");
	reading_xy=0;
	while(1){
		print("in touch thread loop\n");

		if(reading_xy==0){
			print("in reading x value if\n");

			//leser x verdi

			//setter YU til VCC
			set_pin_vcc(1);
			print("set yu pin to vcc\n");
			//setter YD til ground
			set_pin_gnd(1);
			print("set yd pin to gnd\n");
			//setter XL til no connect
			set_pin_hi_z(0);
			print("xl pin to high imp\n");
			//setter XR til å ta 20 samples fra ADC
			set_pin_adc(0);
			print("set xr pin to adc\n");
			osDelay(1);
			//starter dma 1 (normal mode) (ta 20 samples)
			HAL_ADC_Start_DMA(&hadc1, xbuff, 20);
			print("started dma in x\n");

			//etter 20 samples er tatt, ta average
			print("waiting for flag in x\n");
			osEventFlagsWait(touch_flag, 0x01, osFlagsWaitAny, osWaitForever);
			print("flag set in x\n");
			uint16_t xavg=avg(xbuff);
			print("average x: %d", xavg);
			//les y verdien deretter
			reading_xy=1;

		}else{
			print("in reading y value if\n");
			//leser y verdi samme som før
			//men bare motsatt for x og y pinnene
			set_pin_vcc(0);
			set_pin_gnd(0);
			set_pin_hi_z(1);
			set_pin_adc(1);
			osDelay(1);
			HAL_ADC_Start_DMA(&hadc2, ybuff, 20);

			//samme som for x
			osEventFlagsWait(touch_flag, 0x02, osFlagsWaitAny, osWaitForever);
			uint16_t yavg=avg(ybuff);
			print("average y: %d", yavg);
			reading_xy=0;
		}



		osDelay(100);
	}


}


void touchscreen_INIT(){
	print("about to create touch thread\n");

	touch_flag=osEventFlagsNew(NULL);

    const osThreadAttr_t touchscreen_thread_attr = {
        .name = "touchscreen_thread",
        .stack_size = 1024,
        .priority = osPriorityNormal,
    };

    touchscreen_thread_id = osThreadNew(touchscreen_thread_func, NULL, &touchscreen_thread_attr);

	print("created touch thread\n");


}

