#include "main.h"
#include "cmsis_os2.h"
#include "adc.h"
#include "gpio.h"
#include "controller.h"
#include "mywatchdog.h"

osThreadId_t touchscreen_thread_id;
static ADC_ChannelConfTypeDef ADC_config_type;

touch_obj touch_msg;


//aktiverer pin x til adc
//hvis i=0, PA0 (channel 0)
//hvis i=1, PA1 (channel 1)
void set_pin_adc(int i)
{
    GPIO_InitTypeDef ADC_GPIO_struct = {0};

    if(i==0){
    	ADC_GPIO_struct.Pin = XR_Pin;
    	ADC_GPIO_struct.Mode = GPIO_MODE_ANALOG;
    	ADC_GPIO_struct.Pull = GPIO_NOPULL;
    	HAL_GPIO_Init(XR_GPIO_Port, &ADC_GPIO_struct);
    	ADC_config_type.Channel = ADC_CHANNEL_0;
    }else{
    	ADC_GPIO_struct.Pin = YU_Pin;
    	ADC_GPIO_struct.Mode = GPIO_MODE_ANALOG;
    	ADC_GPIO_struct.Pull = GPIO_NOPULL;
    	HAL_GPIO_Init(YU_GPIO_Port, &ADC_GPIO_struct);
    	ADC_config_type.Channel = ADC_CHANNEL_1;
    }
    ADC_config_type.Rank = 1;
    ADC_config_type.SamplingTime = ADC_SAMPLETIME_3CYCLES;
    HAL_ADC_ConfigChannel(&hadc1, &ADC_config_type);

}


//aktiverer pin x til output VCC
//hvis i=0, PA0 til VCC
//hvis i=1, PA1 til VCC

void set_pin_vcc(int i){

	GPIO_InitTypeDef VCC_GPIO_struct = {0};

	if (i == 0) {
		VCC_GPIO_struct.Pin = XR_Pin;
		VCC_GPIO_struct.Mode = GPIO_MODE_OUTPUT_PP;
		VCC_GPIO_struct.Pull = GPIO_PULLUP;
		VCC_GPIO_struct.Speed = GPIO_SPEED_FREQ_LOW;
        HAL_GPIO_Init(XR_GPIO_Port, &VCC_GPIO_struct);
    	HAL_GPIO_WritePin(XR_GPIO_Port, XR_Pin, 1);
    } else {
    	VCC_GPIO_struct.Pin = YU_Pin;
    	VCC_GPIO_struct.Mode = GPIO_MODE_OUTPUT_PP;
    	VCC_GPIO_struct.Pull = GPIO_PULLUP;
    	VCC_GPIO_struct.Speed = GPIO_SPEED_FREQ_LOW;
        HAL_GPIO_Init(YU_GPIO_Port, &VCC_GPIO_struct);
    	HAL_GPIO_WritePin(YU_GPIO_Port, YU_Pin, 1);

    }
}


//setter pin x til ground
//hvis i=0, P40 (X left) til GND
//hvis i=1, PB0 (Y down) til GND
void set_pin_gnd(int i){

    GPIO_InitTypeDef GND_GPIO_struct = {0};
    if(i==0){
    	GND_GPIO_struct.Pin = XL_Pin;
    	GND_GPIO_struct.Mode = GPIO_MODE_OUTPUT_PP;
    	GND_GPIO_struct.Pull = GPIO_PULLDOWN;
    	GND_GPIO_struct.Speed = GPIO_SPEED_FREQ_LOW;
        HAL_GPIO_Init(XL_GPIO_Port, &GND_GPIO_struct);
        HAL_GPIO_WritePin(XL_GPIO_Port, XL_Pin, 0);
    }else{
    	GND_GPIO_struct.Pin = YD_Pin;
    	GND_GPIO_struct.Mode = GPIO_MODE_OUTPUT_PP;
    	GND_GPIO_struct.Pull = GPIO_PULLDOWN;
    	GND_GPIO_struct.Speed = GPIO_SPEED_FREQ_LOW;
        HAL_GPIO_Init(YD_GPIO_Port, &GND_GPIO_struct);
        HAL_GPIO_WritePin(YD_GPIO_Port, YD_Pin, 0);
    }
}


//setter xleft og ydown til høy resistans,dvs not connected
void set_pin_hi_z(int i){
    GPIO_InitTypeDef NC_GPIO_struct = {0};
    if(i==0){
    	NC_GPIO_struct.Pin = XL_Pin;
    	NC_GPIO_struct.Mode = GPIO_MODE_INPUT;
    	NC_GPIO_struct.Pull = GPIO_NOPULL;
        HAL_GPIO_Init(XL_GPIO_Port, &NC_GPIO_struct);
    }else{
    	NC_GPIO_struct.Pin = YD_Pin;
    	NC_GPIO_struct.Mode = GPIO_MODE_INPUT;
    	NC_GPIO_struct.Pull = GPIO_NOPULL;
        HAL_GPIO_Init(YD_GPIO_Port, &NC_GPIO_struct);
    }
}



uint32_t pixel_touch_y(uint32_t milli_volt){
	//600mV på 0 og 3300mV på 160
	uint32_t delta_mV=milli_volt-600;
	//3300-600=2700
	uint32_t delta_y=2700/160;
	uint32_t touch_y=delta_mV/delta_y;
	return touch_y;
}

uint32_t pixel_touch_x(uint32_t milli_volt){
	uint32_t delta_mV=milli_volt-600;
	//3300-600=2700
	uint32_t delta_x=2700/160;
	uint32_t touch_x=delta_mV/delta_x;
	return touch_x;
}



void touchscreen_thread_func(){
	int display_touched_before = 0;

	while(1){
		osEventFlagsSet(get_watchdog_flag(),watchdog_touch_flag);
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


		//tar mean-avraging
		uint32_t sum_x = 0;

		uint16_t min_x = 5000;
		uint16_t max_x = 0;

		for (int i = 0; i < 30; i++) {
		    HAL_ADC_Start(&hadc1);
		    HAL_ADC_PollForConversion(&hadc1, 10);
		    uint16_t val = HAL_ADC_GetValue(&hadc1);
		    sum_x += val;

		    if(val < min_x){
		    	min_x = val;
		    }
		    if(val > max_x){
		    	max_x = val;
		    }

		}

		// tar de værste vekk fra settet
		sum_x = sum_x - min_x - max_x;

		// delt på (30 - 2)
		uint32_t avg_x = sum_x / 28;


		//leser y verdi samme som før
		//men bare motsatt for x og y pinnene
	    HAL_GPIO_DeInit(XL_GPIO_Port, XL_Pin);
	    HAL_GPIO_DeInit(YU_GPIO_Port, YU_Pin);
	    HAL_GPIO_DeInit(YD_GPIO_Port, YD_Pin);

		set_pin_vcc(1); //YU VCC
		set_pin_gnd(1); //YD GND
		set_pin_hi_z(0); //XL NO CONNECT
		set_pin_adc(0); //XR ADC
		osDelay(5);


		uint32_t sum_y = 0;
		uint16_t min_y = 5000;
		uint16_t max_y = 0;

		for (int i = 0; i < 30; i++) {
		    HAL_ADC_Start(&hadc1);
		    HAL_ADC_PollForConversion(&hadc1, 10);
		    uint16_t val = HAL_ADC_GetValue(&hadc1);
		    sum_y += val;

		    if(val < min_y){
		    	min_y = val;
		    }
		    if(val > max_y){
		    	max_y = val;
		    }

		}

		sum_y = sum_y - min_y - max_y;
		uint32_t avg_y = sum_y / 28;



		if (avg_x > 150 && avg_x < 3050 && avg_y > 150 && avg_y < 3050){

			if(!display_touched_before){

				display_touched_before = 1;
		        touch_msg.touched_x = pixel_touch_x(avg_x);
		        touch_msg.touched_y = pixel_touch_y(avg_y);

		        osMessageQueuePut(touch_msg_queue_get(), &touch_msg,0,0);
			}

		}else{ display_touched_before = 0; }

        osDelay(50);

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

