#ifndef _SENS_DETECT_
#define _SENS_DETECT_
#include "cmsis_os2.h"

void detect_INIT();
osEventFlagsId_t get_flag_id();
osMutexId_t get_i2c_mutex_id();


#endif
