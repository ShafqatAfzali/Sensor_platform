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

//konfigurasjon
//xxxxxxxxxxxxxAAA   reservert til 000
//xxxxxxxxxxxAAxxx   sensitivitet (ALS GAIN) setter til 01--> 2X sensitivitet
//xxxxxxxxxxAxxxxx	 reservert
//xxxxxxAAAAxxxxxx   hvor lenge den tar inn lys setter til 	1000 --> 50ms
//xxxxAAxxxxxxxxxx   hvor mange lesning før interrupt --> ingen interrupt så 00
//xxAAxxxxxxxxxxxx   reservert 00
//xAxxxxxxxxxxxxxx   ingen interrupt --> 0
//xxxxxxxxxxxxxxxx   power on --> 0
//resultat:  0000001000001000
#define sens_config_write 0x0208

//enabler power saving mode og 00 i power saving registeret --> 8uA og 600ms refreshing
#define sens_PSM_write 0x8000



bool light_sens_active; //thread aktivasjon variabel som settes til false når transmit feiler
HAL_StatusTypeDef transmit_status; //transmit status/resultat



void light_sens_config(){
	size_t transmit_size = size(config_write);
	uint16_t config_write={sens_config_reg_addr, sens_config_write};
	HAL_I2C_Master_Transmit(&hi2c1, sens_slave_addr<< 1, config_write, transmit_size, 100);
};

void light_sens_thread_func(){

	while(true){

		//får flagget
        uint32_t this_flag = osEventFlagsWait(get_flag_id(), 0x02, osFlagsWaitAny, osWaitForever);

        //aktiverer thread og tømmer flagg
		if(this_flag & 0x02){
			light_sens_active = true;
            osEventFlagsClear(get_flag_id(), 0x02);
		}


		if(light_sens_active){
			//sikrer at i2c pins ikke blir brukt
			osStatus_t I2C_status = osMutexAcquire(get_i2c_mutex_id(), osWaitForever);

			if(I2C_status==osOK){
				// bruker 0x21 for lesing og henter high resolution output register data
				uint16_t outpu_addr[2]={((sens_slave_addr << 1) + 1) ,sens__HighRes_output_reg_addr};
				//variabel til å sette data inn i
				uint16_t light_sens_output;
				transmit_status = HAL_I2C_Master_Receive(&hi2c1,outpu_addr, light_sens_output, size, 100);

				// sjekker om recieve funker/sensor er tilkoblet
				if (transmit_status == HAL_OK) {
				    // printer verdi, skal sendes til controller senere
				    print("Light sensor value: %d\n", light_sens_output);

				} else {
				    // I2C recieve feilet, detection koden aktiveres her
				    print("I2C receive failed \n");
				    osEventFlagsSet(get_flag_id(), 0x08);
				}


			}
		}



		osDelay(2000);
	}

};



void light_sens_INIT(){
	//lager threaden
	//skrur av detection thread
}
