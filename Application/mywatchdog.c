#include "mywatchdog.h"
#include "main.h"
#include "cmsis_os2.h"
#include "iwdg.h"

osEventFlagsId_t watchdog_flag_id;
osThreadId_t watchdog_thread_id;

void watchdog_thread(){
	osDelay(2000);
    while (1) {

    	uint32_t watchdog_flags = osEventFlagsGet(watchdog_flag_id);

    	//watchdpg for  sens detcetion | lvgl | controller | ..... =0x7F
    	if((watchdog_flags & watchdog_all_flag) == watchdog_all_flag){
    		HAL_IWDG_Refresh(&hiwdg);
            osEventFlagsClear(watchdog_flag_id,watchdog_all_flag);
    	}

        osDelay(1000);
    }
}





void watchdog_INIT(){

	watchdog_flag_id = osEventFlagsNew(NULL);

	osThreadAttr_t watchdog_thread_attr = {
	    .name = "watchdog_thread",
	    .priority = osPriorityNormal,
	    .stack_size = 1024
	};

	watchdog_thread_id= osThreadNew(watchdog_thread, NULL, &watchdog_thread_attr);

}

osEventFlagsId_t get_watchdog_flag(){
	return watchdog_flag_id;
}
