#ifndef lvgl_send_
#define lvgl_send_
#include "lvgl.h"
#include "display_driver.h"
#include "cmsis_os2.h"
#include <string.h>

extern uint8_t imgbuff[total_display_bytes/5];

void lvgl_thread_INIT();

#endif

