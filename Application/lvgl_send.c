#include "lvgl_send.h"
#include "lvgl.h"
#include "controller.h"
#include <stdio.h>
#include <string.h>
#include "mywatchdog.h"

uint8_t imgbuff[total_display_bytes/5];

img_obj img_to_send;

update_image_obj update_img_obj;


void my_flush_cb(lv_display_t * disp, const lv_area_t * area, uint8_t * px_buf)
{

    uint32_t px_count = (area->x2 - area->x1 + 1) *
                        (area->y2 - area->y1 + 1);

    // omformer bytes (byte0 <--> byte1) på grunn av hvordan skjermen vil ha pixel data
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
	lv_label_set_text(sensor_value, "------");
	lv_obj_align(sensor_value, LV_ALIGN_TOP_MID, 0, 130);




    // off button
    lv_obj_t * label;
	lv_obj_t * btn1 = lv_button_create(lv_screen_active());
	lv_obj_remove_style_all(btn1);
	lv_obj_set_size(btn1, 90, 38);
	lv_obj_align(btn1, LV_ALIGN_TOP_RIGHT, -2, 2);

	lv_obj_set_style_bg_color(btn1, lv_color_hex(0xff0000), LV_PART_MAIN);
	lv_obj_set_style_bg_opa(btn1, LV_OPA_COVER, LV_PART_MAIN);

	label = lv_label_create(btn1);
	lv_label_set_text(label, "Screen off");
	lv_obj_set_style_text_color(label, lv_color_hex(0xFFFFFF), LV_PART_MAIN);
	lv_obj_center(label);


    lv_obj_t * label2;
	lv_obj_t * btn2 = lv_button_create(lv_screen_active());
	lv_obj_remove_style_all(btn2);
	lv_obj_set_size(btn2, 90, 38);
	lv_obj_align(btn2, LV_ALIGN_TOP_RIGHT, -2, 42);

	lv_obj_set_style_bg_color(btn2, lv_color_hex(0x1427d9), LV_PART_MAIN);
	lv_obj_set_style_bg_opa(btn2, LV_OPA_COVER, LV_PART_MAIN);


	label2 = lv_label_create(btn2);
	lv_label_set_text(label2, "Show data");
	lv_obj_set_style_text_color(label2, lv_color_hex(0xFFFFFF), LV_PART_MAIN);
	lv_obj_center(label2);



    // Vertical sensor bar
    lv_obj_t * sensor_bar = lv_bar_create(lv_screen_active());
    // size: width=30px, height=80px
    lv_obj_set_size(sensor_bar, 30, 80);
    // place to the LEFT of buttons (top right area)
    lv_obj_align(sensor_bar, LV_ALIGN_TOP_RIGHT, -100, 0);
    // range 0 -> 80
    lv_bar_set_range(sensor_bar, 0, 80);
    // initial value
    lv_bar_set_value(sensor_bar, 0, LV_ANIM_OFF);
    // make bar vertical
    lv_obj_set_style_bg_color(sensor_bar, lv_color_hex(0x1427d9), LV_PART_MAIN);
    // indicator color
    lv_obj_set_style_bg_color(sensor_bar, lv_color_hex(0x010b0b), LV_PART_INDICATOR);
    // optional rounded corners
    lv_obj_set_style_radius(sensor_bar, 0, LV_PART_MAIN);
    lv_obj_set_style_radius(sensor_bar, 0, LV_PART_INDICATOR);


	while(1){
		osEventFlagsSet(get_watchdog_flag(),watchdog_lvgl_flag);

        lv_timer_handler();

    	if(osMessageQueueGet(img_msg_queue_get(), &update_img_obj, NULL, 0) == osOK) {

            lv_label_set_text(function_label, update_img_obj.img_showing);

            lv_label_set_text(sensor_label, update_img_obj.sens_type);

    		//oppdaterer vertikal bar
    		lv_bar_set_value(sensor_bar, update_img_obj.percent,LV_ANIM_ON);

            if((strcmp(update_img_obj.sens_type, "Disconnected") == 0) | ((strcmp(update_img_obj.sens_type, "NAN") == 0))){
        		char buf[32]="------";
        		lv_label_set_text(sensor_value, buf);
        	}else{
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



