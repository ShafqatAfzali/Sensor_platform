#include "lvgl_send.h"
#include "lvgl.h"
#include "print.h"
#include "controller.h"
#include <stdio.h>
#include <string.h>

uint8_t imgbuff[total_display_bytes/5];

img_obj img_to_send;

update_image_obj update_img_obj;


void my_flush_cb(lv_display_t * disp, const lv_area_t * area, uint8_t * px_buf)
{

    uint32_t px_count = (area->x2 - area->x1 + 1) *
                        (area->y2 - area->y1 + 1);

    // swap bytes
    for(uint32_t i = 0; i < px_count * 2; i += 2) {
        uint8_t tmp = px_buf[i];
        px_buf[i] = px_buf[i+1];
        px_buf[i+1] = tmp;
    }


	img_to_send.XS=area->x1;
	img_to_send.XE=area->x2;
	img_to_send.YS=area->y1;
	img_to_send.YE=area->y2;
	img_to_send.pixels=px_buf;

	display_set_img(&img_to_send);
    lv_display_flush_ready(disp);
	//print("flushed\n");
	osDelay(1);

}







void lvgl_thread(){

	lv_init();
	display_config();
	lv_display_t *mydisplay = lv_display_create(display_width,display_height);
	lv_display_set_color_format(mydisplay, LV_COLOR_FORMAT_RGB565);
	lv_display_set_buffers(mydisplay, imgbuff, NULL, sizeof(imgbuff), LV_DISPLAY_RENDER_MODE_PARTIAL);
	lv_display_set_flush_cb(mydisplay, my_flush_cb);


	lv_obj_t * function_label = lv_label_create(lv_screen_active());
	lv_label_set_text(function_label, "showing");
	lv_obj_align(function_label, LV_ALIGN_TOP_MID, 0, 90);

	lv_obj_t * sensor_label = lv_label_create(lv_screen_active());
	lv_label_set_text(sensor_label, "no sensor");
	lv_obj_align(sensor_label, LV_ALIGN_TOP_MID, 0, 110);

	lv_obj_t * sensor_value = lv_label_create(lv_screen_active());
	lv_label_set_text(sensor_value, "NA");
	lv_obj_align(sensor_value, LV_ALIGN_TOP_MID, 0, 130);




    // off button
    lv_obj_t * label;
	lv_obj_t * btn1 = lv_button_create(lv_screen_active());
	lv_obj_remove_style_all(btn1);
	lv_obj_set_size(btn1, 80, 40);
	lv_obj_align(btn1, LV_ALIGN_TOP_MID, 0, 0);

	lv_obj_set_style_bg_color(btn1, lv_color_hex(0x03fc17), LV_PART_MAIN);
	lv_obj_set_style_bg_opa(btn1, LV_OPA_COVER, LV_PART_MAIN);

	label = lv_label_create(btn1);
	lv_label_set_text(label, "Screen off");
	lv_obj_set_style_text_color(label, lv_color_hex(0xFFFFFF), LV_PART_MAIN);
	lv_obj_center(label);


    lv_obj_t * label2;
	lv_obj_t * btn2 = lv_button_create(lv_screen_active());
	lv_obj_remove_style_all(btn2);
	lv_obj_set_size(btn2, 80, 40);
	lv_obj_align(btn2, LV_ALIGN_TOP_MID, 0, 40);

	lv_obj_set_style_bg_color(btn2, lv_color_hex(0x030c00), LV_PART_MAIN);
	lv_obj_set_style_bg_opa(btn2, LV_OPA_COVER, LV_PART_MAIN);


	label2 = lv_label_create(btn2);
	lv_label_set_text(label2, "Show data");
	lv_obj_set_style_text_color(label2, lv_color_hex(0xFFFFFF), LV_PART_MAIN);
	lv_obj_center(label2);

	//print("kjører lvgl nå\n");

	while(1){
        lv_timer_handler();

    	if(osMessageQueueGet(img_msg_queue_get(), &update_img_obj, NULL, 0) == osOK) {
    		//print("fikk sensor data\n");



            lv_label_set_text(sensor_label, update_img_obj.sens_type);

            if(strcmp(update_img_obj.sens_type, "no sensor") == 0){
        		char buf[32]="NAN";
        		lv_label_set_text(sensor_value, buf);
        	}else if(strcmp(update_img_obj.sens_type, "Not Displaying") == 0){
        		char buf1[32]="-----";
        		lv_label_set_text(function_label, buf1);

        		char buf[32]="NAN";
        		lv_label_set_text(sensor_value, buf);
        	}else{
        		char buf1[32]="showing";
        		lv_label_set_text(function_label, buf1);

        		char buf[32];
        		snprintf(buf, sizeof(buf), "%.1f", (float)update_img_obj.sens_data);
        		lv_label_set_text(sensor_value, buf);
        	}

    	}

        osDelay(5);

	}

}


void lv_tick_thread(void *arg) {
    while (1) {
        lv_tick_inc(1);
        osDelay(1);
    }
}


void lvgl_thread_INIT(){

    const osThreadAttr_t lvgl_thread_attr = {
        .name = "lvgl_thread",
		.stack_size = 14000,
        .priority = osPriorityNormal,
    };

    osThreadNew(lvgl_thread, NULL, &lvgl_thread_attr);


    osThreadNew(lv_tick_thread, NULL, NULL);
}



