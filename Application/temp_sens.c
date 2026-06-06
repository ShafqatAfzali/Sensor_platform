#include "temp_sens.h"
#include "sens_detect.h"
#include "controller.h"
#include "i2c.h"
#include "cmsis_os2.h"
#include <stdbool.h>
#include <string.h>
#include <float.h>
#include "mywatchdog.h"

#define temp_sen_addr 0x38
#define temp_sen_status_addr 0x71
#define exp_temp_sen_status 0x18

HAL_StatusTypeDef temp_sen_status;

bool temp_sens_active;
osThreadId_t temp_sens_thread_id;

sens_obj temp_msg;


void temp_config(){

    uint8_t status_var = temp_sen_status_addr;
    uint8_t status_byte = 0;

    // Send command to read status
    HAL_I2C_Master_Transmit(&hi2c1, temp_sen_addr << 1, &status_var, 1, 200);

    // leser status
    HAL_I2C_Master_Receive(&hi2c1, temp_sen_addr << 1, &status_byte, 1, 200);

};

void temp_thread_func(){

	while(1){
		osEventFlagsSet(get_watchdog_flag(),watchdog_temp_flag);

        uint32_t this_flag = osEventFlagsGet(get_flag_id());
        //aktiverer thread og sensor og tømmer flagg
		if(this_flag & 0x01){
			osMutexAcquire(get_i2c_mutex_id(), osWaitForever);
			temp_config();
			osMutexRelease(get_i2c_mutex_id());
			temp_sens_active = true;
            osEventFlagsClear(get_flag_id(), 0x01);
		}

		if(temp_sens_active){
			osStatus_t I2C_status = osMutexAcquire(get_i2c_mutex_id(), osWaitForever);

			if(I2C_status==osOK){
				//sender command for å starte measurment
			    uint8_t measure_addr[3] = {0xAC, 0x33, 0x00};
			    temp_sen_status=HAL_I2C_Master_Transmit(&hi2c1, temp_sen_addr << 1, measure_addr, 3, 200);

			    if(temp_sen_status==HAL_OK){
				    //må vente min 80ms for å fullføre måling, venter 90ms for sikkerhet
				    osDelay(90);

				    //leser registeret, første 5X8bit humidity og temp data
				    //data[0] crc, sjekker hvis nødvendig
				    uint8_t data[6] = {0};
				    HAL_I2C_Master_Receive(&hi2c1, temp_sen_addr << 1, data, 6, 200);

				    // tar Humidity bits, tilsvarer: frame 2, 12 bit til venstre, frame 2, 4 bit til venstre, frame 3, 4 bit til venstre
				    uint32_t humid_bits = ((uint32_t)data[1] << 12) | ((uint32_t)data[2] << 4)  | ((uint32_t)data[3] >> 4);
				    //på samme måte for temp: bit 19-16 OR bit 15-8 OR bit 7-0
				    uint32_t temp_bits = (((uint32_t)data[3] & 0x0F) << 16) | ((uint32_t)data[4] << 8) | data[5];


				    //kjører formler fra datablad for humid mellom 0-100%
				    float humidity = ((float)humid_bits / (1 << 20)) * 100.0f;
				    //kjører formler fra datablad for temp mellom -50 til 150 grad (celsius)
				    float temperature = ((float)temp_bits / (1 << 20)) * 200.0f - 50.0f;


			    	//sender temperatur
					strcpy(temp_msg.sens_type, "temperature [C]");
					//for å beholde desimalene ganger med 100
					temp_msg.sens_data = (int32_t)(temperature);

					osMessageQueuePut(sens_msg_queue_get(), &temp_msg, 0,0);
					osDelay(1000);


				    //sender pressure
					strcpy(temp_msg.sens_type, "humidity [%]");
					//for å beholde desimalene ganger med 100
					temp_msg.sens_data = (int32_t)(humidity);

					osMessageQueuePut(sens_msg_queue_get(), &temp_msg, 0,0);
					osDelay(1000);


			    }else{
					//samme som i de andre sensor threads
					HAL_I2C_DeInit(&hi2c1);
					osDelay(50);
					HAL_I2C_Init(&hi2c1);
					temp_sens_active=false;

					strcpy(temp_msg.sens_type, "no sensor");
					temp_msg.sens_data = 0;
					osMessageQueuePut(sens_msg_queue_get(), &temp_msg, 0,0);

					osEventFlagsSet(get_flag_id(), 0x08);
			    }

			}
		    osMutexRelease(get_i2c_mutex_id());

		}

		osDelay(1000);


	}
}


void temp_sens_INIT(){

	temp_sens_active=false;

    const osThreadAttr_t temp_sens_thread_attr = {
        .name = "temp_sensor_thread",
        .stack_size = 1024,
        .priority = osPriorityNormal,
    };

    temp_sens_thread_id = osThreadNew(temp_thread_func, NULL, &temp_sens_thread_attr);
}
