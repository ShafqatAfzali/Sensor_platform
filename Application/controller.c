#include "controller.h"
#include "cmsis_os2.h"
#include "display_driver.h"
#include <string.h>
#include "print.h"


osMessageQueueId_t img_queue;
osMessageQueueId_t sensor_queue;
osMessageQueueId_t touch_queue;


update_image_obj controller_img_msg;
sens_obj controller_sens_msg;
touch_obj controller_touch_msg;

//vise data eller ikke
int display_data;

//slå av eller på skjermen
int display_state;

//power mode av eller på
int power_mode;


void controller_thread(){


	while(1) {

		//sjekker hvilken button/slider som ble trykket
		if(osMessageQueueGet(touch_queue, &controller_touch_msg, NULL, 0) == osOK){
			//her skjer all kontrollen (ie slå av skjerm, send data)

			print("X touch: %d\n", controller_touch_msg.touched_x);
			print("Y touch: %d\n", controller_touch_msg.touched_y);

			//for eksempel hvis skru av skjerm er (x:30-50 og y:20-60)
			if(

					controller_touch_msg.touched_x<50 &&
					controller_touch_msg.touched_x>30 &&
					controller_touch_msg.touched_y<60 &&
					controller_touch_msg.touched_y>20

			){
				if(display_state==1){
					display_off();
					display_state=0;
				}else{
					display_on();
					display_state=1;
				}
				//antar at sens data knappen er (x:70-90 og y:20-60)
			}else if(
					controller_touch_msg.touched_x<90 &&
					controller_touch_msg.touched_x>70 &&
					controller_touch_msg.touched_y<60 &&
					controller_touch_msg.touched_y>20
			){
				if(display_data==1){
					display_data=0;
				}else{
					display_data=1;
				}
			}



		}

		if(display_data==1){

			if(osMessageQueueGet(sensor_queue, &controller_sens_msg, NULL, 0) == osOK){

				strcpy(controller_img_msg.sens_type, controller_sens_msg.sens_type);

				controller_img_msg.sens_data=controller_sens_msg.sens_data;
				controller_img_msg.touched_x = controller_touch_msg.touched_x;
				controller_img_msg.touched_y = controller_touch_msg.touched_y;
				osMessageQueuePut(img_queue, &controller_img_msg, 0,0);


			}

		}else{

			strcpy(controller_img_msg.sens_type, "Not Displaying");
			controller_sens_msg.sens_data=0;
			controller_img_msg.touched_x = controller_touch_msg.touched_x;
			controller_img_msg.touched_y = controller_touch_msg.touched_y;

			osMessageQueuePut(img_queue, &controller_img_msg, 0,0);

		}


		osDelay(100);

	}

}



void controller_INIT(){

	display_state=1;

	display_data=1;

	img_queue = osMessageQueueNew(1, sizeof(controller_img_msg), NULL);

	sensor_queue = osMessageQueueNew(1, sizeof(controller_sens_msg), NULL);

	touch_queue = osMessageQueueNew(1, sizeof(controller_touch_msg), NULL);

	osThreadAttr_t controller_thread_attr = {
	    .name = "controller_thread",
	    .priority = osPriorityNormal,
	    .stack_size = 1024
	};

    osThreadNew(controller_thread, NULL, &controller_thread_attr);

}


osMessageQueueId_t img_msg_queue_get(){
	return img_queue;
}

osMessageQueueId_t sens_msg_queue_get(){
	return sensor_queue;
}

osMessageQueueId_t touch_msg_queue_get(){
	return touch_queue;
}



