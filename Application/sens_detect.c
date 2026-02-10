#include "main.h"
#include "sens_detect.h"
#include "print.h"

uint16_t sens_add[3]={0x00, 0x01, 0x03};

void detect_INIT(void){

	for (int i=0; i=2; i++){
		status = HAL_I2C_IsDeviceReady(&hi2c1, sens_add[i] << 1, 3, 100);

		    if (status == HAL_OK)
		    {
		        print("device %i is alive", i);
		        //set flag
		    }

		osDelay(500);

	}

}
