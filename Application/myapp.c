#include "main.h"
#include "myapp.h"
#include <stdio.h>
#include <string.h>
#include "usart.h"
#include "sens_detect.h"
#include "light_sens.h"
#include "accelerometer_sens.h"
#include "temp_sens.h"
#include "display_driver.h"
#include "spi.h"
#include "lvgl_send.h"
#include "mytouch.h"
#include "controller.h"
#include "cmsis_os2.h"

void Idle_Thread_Func(){

}

void myapp(){
	lvgl_thread_INIT();
    detect_INIT();
    light_sens_INIT();
    accelerometer_INIT();
    temp_sens_INIT();
    touchscreen_INIT();
    controller_INIT();

    osThreadAttr_t idle_spes = {};
    idle_spes.name="idle_thread";
    idle_spes.priority=osPriorityIdle;
    osThreadNew(Idle_Thread_Func, NULL, &idle_spes);

}


