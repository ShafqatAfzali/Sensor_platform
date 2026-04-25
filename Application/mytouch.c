#include "main.h"
#include "cmsis_os2.h"
#include "adc.h"
#include "gpio.h"
#include "tim.h"
#include "print.h"
#include "controller.h"

//skal bruke reading_xy til å informere om funksjonen leser x eller y
int reading_xy;

osThreadId_t touchscreen_thread_id;
static ADC_ChannelConfTypeDef sConfig;

touch_obj touch_msg;

//aktiverer pin x til adc
//hvis i=0, PA0 (channel 0)
//hvis i=1, PA1 (channel 1)
void set_pin_adc(int i)
{
    GPIO_InitTypeDef GPIO_InitStruct = {0};

    if(i==0){
    	GPIO_InitStruct.Pin = XR_Pin;
        GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
        GPIO_InitStruct.Pull = GPIO_NOPULL;
    	HAL_GPIO_Init(XR_GPIO_Port, &GPIO_InitStruct);
        sConfig.Channel = ADC_CHANNEL_0;
    }else{
    	GPIO_InitStruct.Pin = YU_Pin;
        GPIO_InitStruct.Mode = GPIO_MODE_ANALOG;
        GPIO_InitStruct.Pull = GPIO_NOPULL;
    	HAL_GPIO_Init(YU_GPIO_Port, &GPIO_InitStruct);
        sConfig.Channel = ADC_CHANNEL_1;
    }
    sConfig.Rank = 1;
    sConfig.SamplingTime = ADC_SAMPLETIME_3CYCLES;
    if (HAL_ADC_ConfigChannel(&hadc1, &sConfig) != HAL_OK){
    	print("config feilet\n");
    	Error_Handler();
    }

}


//aktiverer pin x til output VCC
//hvis i=0, PA0 til VCC
//hvis i=1, PA1 til VCC

void set_pin_vcc(int i){

    GPIO_InitTypeDef GPIO_InitStruct = {0};
    if (i == 0) {
        GPIO_InitStruct.Pin = XR_Pin;
        GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    	GPIO_InitStruct.Pull = GPIO_PULLUP;
    	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
        HAL_GPIO_Init(XR_GPIO_Port, &GPIO_InitStruct);
    	HAL_GPIO_WritePin(XR_GPIO_Port, XR_Pin, 1);
    } else {
        GPIO_InitStruct.Pin = YU_Pin;
        GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    	GPIO_InitStruct.Pull = GPIO_PULLUP;
    	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
        HAL_GPIO_Init(YU_GPIO_Port, &GPIO_InitStruct);
    	HAL_GPIO_WritePin(YU_GPIO_Port, YU_Pin, 1);

    }
}


//setter pin x til ground
//hvis i=0, P40 (X left) til GND
//hvis i=1, PB0 (Y down) til GND
void set_pin_gnd(int i){

    GPIO_InitTypeDef GPIO_InitStruct = {0};
    if(i==0){
    	GPIO_InitStruct.Pin = XL_Pin;
        GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    	GPIO_InitStruct.Pull = GPIO_PULLDOWN;
    	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
        HAL_GPIO_Init(XL_GPIO_Port, &GPIO_InitStruct);
        HAL_GPIO_WritePin(XL_GPIO_Port, XL_Pin, 0);
    }else{
    	GPIO_InitStruct.Pin = YD_Pin;
        GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
    	GPIO_InitStruct.Pull = GPIO_PULLDOWN;
    	GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
        HAL_GPIO_Init(YD_GPIO_Port, &GPIO_InitStruct);
        HAL_GPIO_WritePin(YD_GPIO_Port, YD_Pin, 0);
    }
}


//setter xleft og ydown til høy resistans,dvs not connected
void set_pin_hi_z(int i){
    GPIO_InitTypeDef GPIO_InitStruct = {0};
    if(i==0){
    	GPIO_InitStruct.Pin = XL_Pin;
        GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
        GPIO_InitStruct.Pull = GPIO_NOPULL;
        HAL_GPIO_Init(XL_GPIO_Port, &GPIO_InitStruct);
    }else{
    	GPIO_InitStruct.Pin = YD_Pin;
        GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
        GPIO_InitStruct.Pull = GPIO_NOPULL;
        HAL_GPIO_Init(YD_GPIO_Port, &GPIO_InitStruct);
    }
}


//might need to deinit
void touch_reset_pins(){
    HAL_GPIO_DeInit(XR_GPIO_Port, XR_Pin);
    HAL_GPIO_DeInit(XL_GPIO_Port, XL_Pin);
    HAL_GPIO_DeInit(YU_GPIO_Port, YU_Pin);
    HAL_GPIO_DeInit(YD_GPIO_Port, YD_Pin);
}


uint16_t avg(uint32_t *arr){
	uint32_t sum=0;
	for(int i=0; i<20; i++){
		sum+=arr[i];
	}
	uint16_t average=(uint16_t)(sum/20);
	return average;
}

uint32_t pixel_touch_x(uint32_t milli_volt){
	//(max -min)/pixels = 3300-700=2600 /120
	uint32_t delta_x=2600/120;
	uint32_t touch_x=milli_volt/delta_x;
	return touch_x;

}

uint32_t pixel_touch_y(uint32_t milli_volt){
	//(max -min)/pixels = 3300-700=2600 /120
	uint32_t delta_y=2600/160;
	uint32_t touch_y=milli_volt/delta_y;
	return touch_y;
}



void touchscreen_thread_func(){
	HAL_TIM_Base_Start(&htim2);
	print("running touch thread\n");
	reading_xy=0;
	while(1){

		//leser x verdi
	    HAL_GPIO_DeInit(XR_GPIO_Port, XR_Pin);
	    HAL_GPIO_DeInit(XL_GPIO_Port, XL_Pin);
	    HAL_GPIO_DeInit(YD_GPIO_Port, YD_Pin);
		//setter XR til VCC
		set_pin_vcc(0);
		//setter XL til ground
		set_pin_gnd(0);
		//setter YD til no connect
		set_pin_hi_z(1);
		//setter YU til å ta 20 samples fra ADC
		set_pin_adc(1);
		osDelay(5);

		uint32_t avg_x=0;
		uint32_t sum_x=0;
		for (int i = 0; i < 20; i++){
			HAL_ADC_Start(&hadc1);
			HAL_ADC_PollForConversion(&hadc1, 10);
			uint16_t val_x = HAL_ADC_GetValue(&hadc1);
			sum_x+=(uint32_t) val_x;
			osDelay(1);
		}
		avg_x=sum_x/20;
		//print("avg_x: %d\n", avg_x);


		osDelay(50);




		//leser y verdi samme som før
	    HAL_GPIO_DeInit(XL_GPIO_Port, XL_Pin);
	    HAL_GPIO_DeInit(YU_GPIO_Port, YU_Pin);
	    HAL_GPIO_DeInit(YD_GPIO_Port, YD_Pin);
		//men bare motsatt for x og y pinnene


		set_pin_vcc(1); //YU VCC
		set_pin_gnd(1); //YD GND
		set_pin_hi_z(0); //XL NO CONNECT
		set_pin_adc(0); //XR ADC
		osDelay(5);


		uint32_t avg_y=0;
		uint32_t sum_y=0;
		for (int i = 0; i < 20; i++) {
			HAL_ADC_Start(&hadc1);
			HAL_ADC_PollForConversion(&hadc1, 10);
			uint16_t val_y = HAL_ADC_GetValue(&hadc1);
			sum_y+=(uint32_t) val_y;
			osDelay(1);
		}
		avg_y=sum_y/20;
		//print("avg_y: %d\n", avg_y);


		touch_msg.touched_x=pixel_touch_x(avg_x);
		touch_msg.touched_y=pixel_touch_y(avg_y);

		uint32_t touched_x=pixel_touch_x(avg_x);
		uint32_t touched_y=pixel_touch_y(avg_y);

		print("X touch: %d\n", touched_x);
		print("Y touch: %d\n", touched_y);


		//sender touch data til controller
		osMessageQueuePut(touch_msg_queue_get(), &touch_msg, 0,0);

		osDelay(50);
	}


}

void touchscreen_INIT(){
	print("about to create touch thread\n");

    const osThreadAttr_t touchscreen_thread_attr = {
        .name = "touchscreen_thread",
        .stack_size = 1024,
        .priority = osPriorityNormal,
    };

    touchscreen_thread_id = osThreadNew(touchscreen_thread_func, NULL, &touchscreen_thread_attr);

	print("created touch thread\n");


}

