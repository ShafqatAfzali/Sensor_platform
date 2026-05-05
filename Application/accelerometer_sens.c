#include "accelerometer_sens.h"
#include "sens_detect.h"
#include "controller.h"
#include "i2c.h"
#include "cmsis_os2.h"
#include <stdbool.h>
#include <string.h>

#define accelometer_addr 0x1D
uint8_t X_MSB_reg_addr=0x01;
uint8_t X_LSB_reg_addr=0x02;
uint8_t Y_MSB_reg_addr=0x03;
uint8_t Y_LSB_reg_addr=0x04;
uint8_t Z_MSB_reg_addr=0x05;
uint8_t Z_LSB_reg_addr=0x06;

//for å sette i standby mode før config
uint8_t CTRL_reg1_config_addr=0x2A;
//for å config av low power
uint8_t CTRL_reg2_config_addr=0x2B;
//for å config av xyz måleområdet (+/-2g eller +/-4g passer best)
uint8_t XYZ_reg_config_addr=0x0E;

//setter i standby mode
uint8_t CTRL_reg1_standby_write=0x00;

//setter i active mode med 100Hz og lavere effekt bruk
uint8_t CTRL_reg1_active_write=0x19;

//setter MODS=11 altså MODS1=1 OG MODS0=1 --> 00000011, (kapittel 5.4 i datablad)
uint8_t CTRL_reg2_write=0x03;

//setter måleområde til +/-4g (kapitell 6 i datablad)
uint8_t XYZ_reg_config_write=0x01;


HAL_StatusTypeDef acclerometer_transmit_status;
HAL_StatusTypeDef accelormeter_recieve_status;
osThreadId_t accelerometer_thread_id;
bool accelerometer_active;

sens_obj accleration_msg;

//lagde funksjonen for å forkorte koden og rengjøre
//det funker nesten på samme måte som når vi skriver i light_sens.c


bool I2C_accelerometer_transmit(uint8_t reg_addr, uint8_t reg_write){

	uint8_t write_arr[2] = {reg_addr, reg_write};

	acclerometer_transmit_status=HAL_I2C_Master_Transmit(
			&hi2c1,
			accelometer_addr<< 1,
			write_arr,
			2,
			200);
	if (acclerometer_transmit_status==HAL_OK){
		return true;
	} else{ return false;}

}


void accelerometer_config(){

	//set stanby mode for config (ACTIVE bit = 0 in CTRL_REG1)
	I2C_accelerometer_transmit(CTRL_reg1_config_addr,CTRL_reg1_standby_write);

	//setter range til +/- 4g
	I2C_accelerometer_transmit(XYZ_reg_config_addr,XYZ_reg_config_write);

	//setter low power mode
	I2C_accelerometer_transmit(CTRL_reg2_config_addr,CTRL_reg2_write);
	osDelay(50);

	//setter tilbake til active mode
	I2C_accelerometer_transmit(CTRL_reg1_config_addr,CTRL_reg1_active_write);
	osDelay(50);

}



void accelormeter_thread_func(){
	while(true){

		//får flagget
        uint32_t this_flag = osEventFlagsGet(get_flag_id());

        //aktiverer thread og tømmer flagg
		if(this_flag & 0x04){
			osMutexAcquire(get_i2c_mutex_id(), osWaitForever);
			accelerometer_config();
			osMutexRelease(get_i2c_mutex_id());
			accelerometer_active = true;
            osEventFlagsClear(get_flag_id(), 0x04);
		}


		if(accelerometer_active){
			osStatus_t I2C_status = osMutexAcquire(get_i2c_mutex_id(), osWaitForever);

			if(I2C_status==osOK){

				//siden adressene til outupt verdiene er "consecutivde"
				//Altså 0x01, 0x02, 0x03 og ... så kan vi lese alle på engang
				uint8_t data[6];

				accelormeter_recieve_status=HAL_I2C_Mem_Read(&hi2c1,
				                 accelometer_addr << 1,
				                 X_MSB_reg_addr,   // start i 0x01 (MSB av x) og går til 0x06
				                 I2C_MEMADD_SIZE_8BIT,
				                 data,
				                 6,
				                 200);

				if(accelormeter_recieve_status==HAL_OK){
					int16_t X_axl = ((int16_t)data[0] << 8) | data[1];
					int16_t Y_axl = ((int16_t)data[2] << 8) | data[3];
					int16_t Z_axl = ((int16_t)data[4] << 8) | data[5];

					//shifter til høyre siden vi har 14bit output ikke 16
					X_axl>>=2;
					Y_axl>>=2;
					Z_axl>>=2;

					//omformer til mm/s^2 basert på \-4g range (2048 count gitt i datablad)
					int32_t X_ms2 = ((int32_t)X_axl * 9810) / (2048*1000);
					int32_t Y_ms2 = ((int32_t)Y_axl * 9810) / (2048*1000);
					int32_t Z_ms2 = ((int32_t)Z_axl * 9810) / (2048*1000);



					strcpy(accleration_msg.sens_type, "acceleration_x");
					accleration_msg.sens_data = X_ms2;
					osMessageQueuePut(sens_msg_queue_get(), &accleration_msg, 0,0);
					osDelay(1000);

					strcpy(accleration_msg.sens_type, "acceleration_y");
					accleration_msg.sens_data = Y_ms2;
					osMessageQueuePut(sens_msg_queue_get(), &accleration_msg, 0,0);
					osDelay(1000);

					strcpy(accleration_msg.sens_type, "acceleration_z");
					accleration_msg.sens_data = Z_ms2;
					osMessageQueuePut(sens_msg_queue_get(), &accleration_msg, 0,0);
					osDelay(1000);

				}else{
					HAL_I2C_DeInit(&hi2c1);
					osDelay(50);
					HAL_I2C_Init(&hi2c1);
					accelerometer_active=false;

					strcpy(accleration_msg.sens_type, "no sensor");
					accleration_msg.sens_data = 0;

					osMessageQueuePut(sens_msg_queue_get(), &accleration_msg, 0,0);
					osEventFlagsSet(get_flag_id(),0x08);
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


