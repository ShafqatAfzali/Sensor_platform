#ifndef controller_
#define controller_
#include "main.h"

typedef struct{
	//which sensor that was just plugged in (ie which sensor was detected)
	//if a sensor is disconnected, it sends "no sensor"
	char sens_type[100];
	//the sensors current data
	//if a sensor is disconnected, it sends 0
	// for Accelerometer, it sends x-axis acceleration, then y-axis, then z axis and then loops over it (ie x->y->z->x->y->z......)
	uint32_t sens_data;
	//the touched pixel on the y-axis
	uint32_t touched_y;
	//the touched pixel on the y-axis
	uint32_t touched_x;
} update_image_obj;


typedef struct{
	char sens_type[100];
	int32_t sens_data;
} sens_obj;


typedef struct{
	uint32_t touched_y;
	uint32_t touched_x;
} touch_obj;


osMessageQueueId_t sen_msg_queue_get();

osMessageQueueId_t img_msg_queue_get();

osMessageQueueId_t touch_msg_queue_get();

void controller_INIT();

#endif

