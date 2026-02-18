#include "main.h"
#include "print.h"
#include "sens_detect.h"
#include "i2c.h"
#include "cmsis_os2.h"
#include <stdbool.h>

//0x20 for write
//0x21 for read
#define sens_slave_addr 0x10

#define sens_config_reg_addr 0x00
#define sens_PSM_reg_addr 0x03
#define sens__HighRes_output_reg_addr 0x04


#define sens_config_default     0x0000

#define sens_config_2xGain      0x0800
//#define sens_config_800ms_capture     0x00C0
#define sens_config_200ms_capture     0x0040
#define sens_config_power_on    0x0000
#define sens_config_write       (sens_config_2xGain | sens_config_200ms_capture | sens_config_power_on)

#define sens_psm_mode1          0x0000
#define sens_psm_enable          0x0001
#define sens_psm_write           (sens_psm_mode1 | sens_psm_enable)



bool light_sens_active; //thread aktivasjon variabel som settes til false når transmit feiler
HAL_StatusTypeDef transmit_status; //transmit status/resultat

uint16_t light_sens_output;
osThreadId_t lightsens_thread_id;

HAL_StatusTypeDef config_transmit_status;

void light_sens_config(){
	//aktiverere registeret med 2x gain og 200ms light capture
    uint8_t config_write[3] = {
        sens_config_reg_addr,
        (sens_config_write >> 8) & 0xFF, // MSB av config
        sens_config_write & 0xFF         // LSB av config
    };
	size_t transmit_size = sizeof(config_write);
	config_transmit_status=HAL_I2C_Master_Transmit(&hi2c1, sens_slave_addr<< 1, config_write, transmit_size, 200);
	if(config_transmit_status==HAL_OK){
		print("transmitted config\n");
	}else{
		print("\n\n transmit config failed \n\n");

	}
	osDelay(1000);

	//aktiverere power saving mode med mode 00 (8uA)
    uint8_t config_PSM_write[3] = {
        sens_PSM_reg_addr,
        (sens_psm_write >> 8) & 0xFF,     // MSB først
        sens_psm_write & 0xFF    // LSB av psm
    };

	size_t transmit_PSM_size = sizeof(config_PSM_write);
	config_transmit_status=HAL_I2C_Master_Transmit(&hi2c1, sens_slave_addr<< 1, config_PSM_write, transmit_PSM_size, 200);
	if(config_transmit_status==HAL_OK){
		print("transmitted PSM config\n");
	}else{
		print("\n\n transmit PSM config failed \n\n");

	}
	osDelay(1000);

};


void light_sens_thread_func(){

	while(true){

		//får flagget
        uint32_t this_flag = osEventFlagsGet(get_flag_id());

        //aktiverer thread og tømmer flagg
		if(this_flag==0x02){
			print("flag detected in light sensor\n\n");
			light_sens_active = true;
			light_sens_config();
            osEventFlagsClear(get_flag_id(), 0x02);
		}


		if(light_sens_active){
			//sikrer at i2c pins ikke blir brukt
			osStatus_t I2C_status = osMutexAcquire(get_i2c_mutex_id(), osWaitForever);

			if(I2C_status==osOK){
				uint8_t rx_buffer[2];  // buffer for output dataen
				//leser verdier med mem_read siden det er enklere og for å lese må vi ha repeated start etter transmitt
				transmit_status = HAL_I2C_Mem_Read(&hi2c1, sens_slave_addr << 1, sens__HighRes_output_reg_addr, I2C_MEMADD_SIZE_8BIT, rx_buffer, 2, 200);

				if (transmit_status == HAL_OK) {
					light_sens_output = (rx_buffer[1] << 8) | rx_buffer[0];
					uint32_t output_mlux = (light_sens_output * 168) / 10;
					print("iluminance: %d mLux\n", output_mlux);
				} else {
					print("I2C receive failed\n");
					//aktiverer detekajon og deaktiverer thread while loop
					osEventFlagsSet(get_flag_id(), 0x08);
					light_sens_active=false;
				}

			}

		    osMutexRelease(get_i2c_mutex_id());

		}

		osDelay(2000);
	}
};



void light_sens_INIT(){
	light_sens_active=false;

    const osThreadAttr_t lightsens_thread_attr = {
        .name = "light_sensor_thread",
        .stack_size = 1024,
        .priority = osPriorityNormal,
    };

    lightsens_thread_id = osThreadNew(light_sens_thread_func, NULL, &lightsens_thread_attr);


}
