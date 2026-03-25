#include "main.h"
#include "myapp.h"
#include <stdio.h>
#include <string.h>
#include "usart.h"
#include "print.h"
#include "sens_detect.h"
#include "light_sens.h"
#include "accelerometer_sens.h"
#include "display_driver.h"
#include "spi.h"
#include "lvgl_send.h"



void myapp(void)
{
	print("process stating\n");
	lvgl_thread_INIT();
	//display_INIT();
    detect_INIT();
    light_sens_INIT();
    accelerometer_INIT();
}


