#include "main.h"
#include "sens_detect.h"
#include "print.h"
#include "i2c.h"
#include "cmsis_os2.h"
#include <stdbool.h>


typedef struct{
	char *sensor_name;
	uint8_t sensor_addr;
	uint8_t flagg;
} sensor_arr;

static sensor_arr sens_obj_arr[3]={
		{"pressure sensor", 0x77,0x01},
		{"light sensor", 0x10,0x02},
		{"accelerometer", 0x1C,0x04}};

#define searching_flagg 0x8

HAL_StatusTypeDef detected_status;
osThreadId_t detect_thread_id;
osEventFlagsId_t sensors_flag_id;
osMutexId_t I2C_mutex_id;
osStatus_t mutex_status;


void detect_thread_func(){

	while(true){

		mutex_status = osMutexAcquire(I2C_mutex_id, osWaitForever);

		if(mutex_status == osOK){

			for (int i=0; i<3; i++){
				detected_status = HAL_I2C_IsDeviceReady(&hi2c1, sens_obj_arr[i].sensor_addr << 1, 2, 100);

				    if (detected_status == HAL_OK){
				        print("device %s is alive", sens_obj_arr[i].sensor_name);
		    			osEventFlagsSet(sensors_flag_id, sens_obj_arr[i].flagg);
				    } else {
		    			osEventFlagsSet(sensors_flag_id, searching_flagg);

				    }

				osDelay(500);

			}

		} else {
			print("i2c mutex failed");
		}

	}
}


void detect_INIT(){

    const osThreadAttr_t detect_thread_attr = {
        .name = "sensor_detection_thread",
        .stack_size = 1024,
        .priority = osPriorityNormal,
    };

    detect_thread_id = osThreadNew(detect_thread_func, NULL, &detect_thread_attr);

    sensors_flag_id = osEventFlagsNew(NULL);

    I2C_mutex_id = osMutexNew(NULL);

}

osEventFlagsId_t get_flag_id() {
    return sensors_flag_id;
}

osMutexId_t get_i2c_mutex_id() {
    return I2C_mutex_id;
}
