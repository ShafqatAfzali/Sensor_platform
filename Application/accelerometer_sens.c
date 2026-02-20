#include "main.h"
#include "accelerometer_sens.h"
#include "print.h"
#include "sens_detect.h"
#include "i2c.h"
#include "cmsis_os2.h"
#include <stdbool.h>

#define accelometer_addr 0x1D
#define X_MSB_reg_addr 0x01
#define X_LSB_reg_addr 0x02
#define Y_MSB_reg_addr 0x03
#define Y_LSB_reg_addr 0x04
#define Z_MSB_reg_addr 0x05
#define Z_LSB_reg_addr 0x06

//for å sette i standby mode før config
#define CTRL_reg1_config_addr  0x2A
//for å config av low power
#define CTRL_reg2_config_addr  0x2B
//for å config av xyz måleområdet (+/-2g eller +/-4g passer best)
#define XYZ_reg_config_addr  0x0E

//setter i standby mode
#define CTRL_reg1_standby_write 0x00

//setter i active mode med 100Hz og lavere effekt bruk
#define CTRL_reg1_active_write  0x19

//setter MODS=11 altså MODS1=1 OG MODS0=1 --> 00000011, (kapittel 5.4 i datablad)
#define CTRL_reg2_write 0x03

//setter måleområde til +/-4g (kapitell 6 i datablad)
#define XYZ_reg_config_write 0x01


HAL_StatusTypeDef acclerometer_transmit_status;
HAL_StatusTypeDef X_transmit_status;
osThreadId_t accelerometer_thread_id;
bool accelerometer_active;

void accelerometer_config(){

	osStatus_t I2C_status = osMutexAcquire(get_i2c_mutex_id(), osWaitForever);

	if(I2C_status==osOK){
		//set stanby mode to config (ACTIVE bit = 0 in CTRL_REG1)
	    uint8_t standby_write[2] = {
	    	CTRL_reg1_config_addr,
			CTRL_reg1_standby_write
	    };
		size_t standby_transmit_size = sizeof(standby_write);

		acclerometer_transmit_status=HAL_I2C_Master_Transmit(
				&hi2c1,
				accelometer_addr<< 1,
				standby_write,
				standby_transmit_size,
				200);

		if(acclerometer_transmit_status==HAL_OK){
			print("----------sensor is in standby---------\n");
		}else{
			print("\n\n standby failed \n\n");

		}
		osDelay(50);

		//setter range til +/- 4g
	    uint8_t XYZ_range_write[2] = {
	    	XYZ_reg_config_addr,
			XYZ_reg_config_write
	    };
		size_t XYZ_transmit_size = sizeof(XYZ_range_write);

		acclerometer_transmit_status=HAL_I2C_Master_Transmit(
				&hi2c1,
				accelometer_addr<< 1,
				XYZ_range_write,
				XYZ_transmit_size,
				200);

		if(acclerometer_transmit_status==HAL_OK){
			print("----------sensor range set to +/-4g---------\n");
		}else{
			print("\n\n range set failed \n\n");

		}
		osDelay(50);


		//setter low power mode
	    uint8_t Low_Power_write[2] = {
	    	CTRL_reg2_config_addr,
			CTRL_reg2_write
	    };
		size_t LP_transmit_size = sizeof(Low_Power_write);

		acclerometer_transmit_status=HAL_I2C_Master_Transmit(
				&hi2c1,
				accelometer_addr<< 1,
				Low_Power_write,
				LP_transmit_size,
				200);

		if(acclerometer_transmit_status==HAL_OK){
			print("---------- low power set ---------\n");
		}else{
			print("\n\n low power failed \n\n");

		}
		osDelay(50);



		uint8_t active_write[2] = {
		    CTRL_reg1_config_addr,
			CTRL_reg1_active_write
		};

		HAL_I2C_Master_Transmit(
		        &hi2c1,
		        accelometer_addr << 1,
		        active_write,
		        2,
		        200);
		osMutexRelease(get_i2c_mutex_id());
		osDelay(50);
	}

}


void accelormeter_thread_func(){
	while(true){

		//får flagget
        uint32_t this_flag = osEventFlagsGet(get_flag_id());

        //aktiverer thread og tømmer flagg
		if(this_flag==0x04){
			print("flag detected in accelerometer\n\n");
			accelerometer_active = true;
			accelerometer_config();
            osEventFlagsClear(get_flag_id(), 0x04);
		}


		if(accelerometer_active){
			osStatus_t I2C_status = osMutexAcquire(get_i2c_mutex_id(), osWaitForever);

			if(I2C_status==osOK){


				uint8_t X_MSB=0;  // leser MSB av x register
					X_transmit_status = HAL_I2C_Mem_Read(
							&hi2c1,
							accelometer_addr << 1,
							X_MSB_reg_addr,
							I2C_MEMADD_SIZE_8BIT,
							&X_MSB,
							1, 200);

					if (X_transmit_status == HAL_OK) {
						print("MSB av X: %u \n", X_MSB);
					} else {
						print("I2C receive failed in acceleraometer\n");
						//aktiverer detekajon og deaktiverer thread while loop
						osEventFlagsSet(get_flag_id(), 0x08);
						accelerometer_active=false;
					}


			}

			osMutexRelease(get_i2c_mutex_id());
			osDelay(2000);
		}


	}
}


void accelerometer_INIT(){

	accelerometer_active=false;

    const osThreadAttr_t accelerometer_thread_attr = {
        .name = "accelerometer_thread",
        .stack_size = 1024,
        .priority = osPriorityNormal,
    };

    accelerometer_thread_id = osThreadNew(accelormeter_thread_func, NULL, &accelerometer_thread_attr);

}


