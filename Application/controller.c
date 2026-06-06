#include "main.h"
#include "controller.h"
#include "cmsis_os2.h"
#include "display_driver.h"
#include <string.h>
#include "mywatchdog.h"


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
		osEventFlagsSet(get_watchdog_flag(),watchdog_controller_flag);

		//sjekker hvilken button/slider som ble trykket
		if(osMessageQueueGet(touch_queue, &controller_touch_msg, NULL, 100) == osOK){
			//her skjer all kontrollen (ie slå av skjerm, send data)

			//for eksempel hvis skru på skjerm er (x:30-120 og y:0-40)
			if(
					controller_touch_msg.touched_x<120 &&
					controller_touch_msg.touched_x>30 &&
					controller_touch_msg.touched_y<40 &&
					controller_touch_msg.touched_y>0 &&
					(display_state==1)

			){
				display_off();
				display_sleep_in();
				HAL_GPIO_WritePin(backlight_GPIO_Port, backlight_Pin, 0);
				display_state=0;
				display_state_var=0;
			}


			//antar at sens data knappen er (x:30-120 og y:40-80)
			if(
					controller_touch_msg.touched_x<120 &&
					controller_touch_msg.touched_x>30 &&
					controller_touch_msg.touched_y<80 &&
					controller_touch_msg.touched_y>40 &&
					(display_state==1)
					){

				if(display_data==1){
					display_data=0;
					display_idle_mode_on();
				}else{
					display_data=1;
					display_idle_mode_off();
				}
			}






			//slår på display hvis det er av
			if(

					controller_touch_msg.touched_x<110 &&
					controller_touch_msg.touched_x>10 &&
					controller_touch_msg.touched_y<130 &&
					controller_touch_msg.touched_y>10 &&
					(display_state==0)

			){
				display_state_var+=1;
				if(display_state_var==3){
					display_sleep_out();
					display_on();
					HAL_GPIO_WritePin(backlight_GPIO_Port, backlight_Pin, 1);
					display_state=1;
				}
			}
		}







		if(display_data==1){

			if(osMessageQueueGet(sensor_queue, &controller_sens_msg, NULL, 100) == osOK){

				if(strcmp(controller_sens_msg.sens_type,"no sensor")==0){
					//setter at ingen sensor er koblet og sender til lvgl
					strcpy(controller_img_msg.img_showing, "Active");
					strcpy(controller_img_msg.sens_type, "Disconnected");
					controller_img_msg.sens_data=(uint32_t)0;
					controller_img_msg.percent=(uint32_t)0;
					osMessageQueuePut(img_queue, &controller_img_msg, 0,0);
				}else{

					//setter prosent for lvgl bar
					if(strcmp(controller_sens_msg.sens_type, "temperature [C]") == 0){
						//setter range mellom 20-60
						int32_t percent=(80*(controller_sens_msg.sens_data-20))/(int32_t)40;
						if(percent>80){
							percent=80;
						}else if(percent<0){
							percent=0;
						}
						controller_img_msg.percent=(uint32_t)percent;

					}else if(strcmp(controller_sens_msg.sens_type, "humidity [%]") == 0){
						//setter range mellom 20-70
						int32_t percent=(80*(controller_sens_msg.sens_data-20))/(int32_t)50;
						if(percent>80){
							percent=80;
						}else if(percent<0){
							percent=0;
						}
						controller_img_msg.percent=(uint32_t)percent;

					}else if(strcmp(controller_sens_msg.sens_type, "light [mlux]") == 0){
						//setter range mellom 0 til 2000
						int32_t percent=controller_sens_msg.sens_data/(int32_t)200;
						if(percent>80){
							percent=80;
						}else if(percent<0){
							percent=0;
						}
						controller_img_msg.percent=(uint32_t)percent;

					}else{
						controller_img_msg.percent=(uint32_t)0;
					}

					//sender sensor type, data og etc til lvgl
					strcpy(controller_img_msg.img_showing, "Active");
					strcpy(controller_img_msg.sens_type, controller_sens_msg.sens_type);
					controller_img_msg.sens_data=controller_sens_msg.sens_data;
					osMessageQueuePut(img_queue, &controller_img_msg, 0,0);
				}
			}


		}else{
			//setter at vis data er ikke aktiv og sender til lvgl
			strcpy(controller_img_msg.img_showing, "press show data");
			strcpy(controller_img_msg.sens_type, "NAN");
			controller_sens_msg.sens_data=(uint32_t)0;
			controller_img_msg.percent=(uint32_t)0;

			osMessageQueuePut(img_queue, &controller_img_msg, 0,0);

		}


		osDelay(50);

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



