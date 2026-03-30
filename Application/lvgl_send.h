#ifndef lvgl_send_
#define lvgl_send_
#include "lvgl.h"
#include "display_driver.h"
#include "cmsis_os2.h"
#include <string.h>

typedef struct{
	char sens_type[100];
	int32_t sens_data[3];
} changed_sens_obj;


extern uint8_t imgbuff[total_display_bytes/5];

void lvgl_thread_INIT();

osMessageQueueId_t msg_queue_get();

#endif
