#ifndef _mywatchdog_
#define _mywatchdog_
#include "cmsis_os2.h"

#define watchdog_sensdetect_flag (1<<0)
#define watchdog_accelerometer_flag (1<<1)
#define watchdog_light_flag (1<<2)
#define watchdog_temp_flag (1<<3)
#define watchdog_controller_flag (1<<4)
#define watchdog_lvgl_flag (1<<5)
#define watchdog_touch_flag (1<<6)
#define watchdog_all_flag 0x7F
void watchdog_INIT();
osThreadId_t get_watchdog_flag();
#endif
