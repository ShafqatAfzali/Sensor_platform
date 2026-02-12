#include "main.h"
#include "i2c_com.h"
#include <stdbool.h>

#define sens_addr 0x20
#define sens_config_addr 0x00 //fikser senere 16bit
#define sens_output_addr 0x00 //fikser senere 16bit


void light_sens_config(){
	//konfigurer lys sensor
};

void light_sens_thread_func(){
	//kjør konfigurasjon funksjon
	//kjør for loop og sjekk data hver sekund??
};



void light_sens_INIT(){
	//lager threaden
	//skrur av detection thread
}
