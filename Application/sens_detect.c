#include "main.h"
#include "sens_detect.h"
#include "print.h"
#include "i2c.h"
#include "cmsis_os2.h"

uint16_t sens_add[3]={0x00, 0x01, 0x03};

HAL_StatusTypeDef detected_status;
osThreadId_t detect_thread_id;

void detect_thread_func(){

	for (int i=0; i<3; i++){
		detected_status = HAL_I2C_IsDeviceReady(&hi2c1, sens_add[i] << 1, 2, 100);

		    if (detected_status == HAL_OK)
		    {
		        print("device %i is alive", i);
		        //set flag
		    }

		osDelay(500);

	}
}


void detect_INIT(){

    const osThreadAttr_t detect_thread_attr = {
        .name = "sensor_detection_thread",
        .stack_size = 1024,
        .priority = osPriorityNormal,
    };

    detect_thread_id = osThreadNew(detect_thread_func, NULL, &detect_thread_attr);

}
