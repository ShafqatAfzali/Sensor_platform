#include "main.h"
#include "myapp.h"
#include <stdio.h>
#include <string.h>
#include "usart.h"
#include "print.h"
#include "sens_detect.h"
#include "light_sens.h"
#include "accelerometer_sens.h"


void myapp(){

	print("starting process ....\n");

	detect_INIT();
	light_sens_INIT();
	accelerometer_INIT();

}



