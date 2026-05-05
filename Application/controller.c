#include "main.h"
#include "controller.h"
#include "cmsis_os2.h"
#include "display_driver.h"
#include <string.h>


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

int display_state_var;


void controller_thread(){
	HAL_GPIO_WritePin(backlight_GPIO_Port, backlight_Pin, 1);

	while(1) {

		//sjekker hvilken button/slider som ble trykket
		if(osMessageQueueGet(touch_queue, &controller_touch_msg, NULL, 0) == osOK){
			//her skjer all kontrollen (ie slå av skjerm, send data)

			//for eksempel hvis skru på skjerm er (x:20-100 og y:0-40)
			if(

					controller_touch_msg.touched_x<100 &&
					controller_touch_msg.touched_x>20 &&
					controller_touch_msg.touched_y<40 &&
					controller_touch_msg.touched_y>0 &&
					(display_state==1)

			){
				display_off();
				HAL_GPIO_WritePin(backlight_GPIO_Port, backlight_Pin, 0);
				display_state=0;
				display_state_var=0;

				//antar at sens data knappen er (x:70-90 og y:20-60)
			}else if(
					controller_touch_msg.touched_x<100 &&
					controller_touch_msg.touched_x>20 &&
					controller_touch_msg.touched_y<80 &&
					controller_touch_msg.touched_y>40 &&
					(display_state==1)
			){
				if(display_data==1){
					display_data=0;
				}else{
					display_data=1;
				}
			}




			//slår på display hvis det er av
			if(

					controller_touch_msg.touched_x<110 &&
					controller_touch_msg.touched_x>10 &&
					controller_touch_msg.touched_y<130 &&
					controller_touch_msg.touched_y>20 &&
					(display_state==0)

			){
				display_state_var+=1;
				if(display_state_var==2){
					display_on();
					HAL_GPIO_WritePin(backlight_GPIO_Port, backlight_Pin, 1);
					display_state=1;
				}
			}

		}







		if(display_data==1){

			if(osMessageQueueGet(sensor_queue, &controller_sens_msg, NULL, 0) == osOK){

				if(strcmp(controller_sens_msg.sens_type,"no sensor")==0){

					strcpy(controller_img_msg.img_showing, "Active");
					strcpy(controller_img_msg.sens_type, "Disconnected");
					controller_img_msg.sens_data=(uint16_t)0;
					osMessageQueuePut(img_queue, &controller_img_msg, 0,0);
				}else{

					strcpy(controller_img_msg.img_showing, "Active");
					strcpy(controller_img_msg.sens_type, controller_sens_msg.sens_type);
					controller_img_msg.sens_data=controller_sens_msg.sens_data;
					osMessageQueuePut(img_queue, &controller_img_msg, 0,0);
				}
			}


		}else{

			strcpy(controller_img_msg.img_showing, "press show data");
			strcpy(controller_img_msg.sens_type, "NAN");
			controller_sens_msg.sens_data=(uint16_t)0;

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



