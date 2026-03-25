#include "lvgl_send.h"
#include "lvgl.h"
#include "cmsis_os.h"
#include "print.h"


uint8_t imgbuff[total_display_bytes/5];

img_obj img_to_send;

void my_flush_cb(lv_display_t * disp, const lv_area_t * area, uint8_t * px_buf)
{
	print("flush started \n");
    uint32_t px_count = (area->x2 - area->x1 + 1) *
                        (area->y2 - area->y1 + 1);

    // swap bytes
    for(uint32_t i = 0; i < px_count * 2; i += 2) {
        uint8_t tmp = px_buf[i];
        px_buf[i] = px_buf[i+1];
        px_buf[i+1] = tmp;
    }

	print("flush reversed data \n");


	img_to_send.XS=area->x1;
	img_to_send.XE=area->x2;
	img_to_send.YS=area->y1;
	img_to_send.YE=area->y2;
	img_to_send.pixels=px_buf;

	print("sending data to set image\n");
	display_set_img(&img_to_send);
    lv_display_flush_ready(disp);
	print("flushed\n");
}

void lvgl_thread(){
	//initialiserer lvgl og setter tick
	/*
	lv_display_set_flush_cb(mydisplay, my_flush_cb);

    lv_obj_t * label = lv_label_create(lv_screen_active());
    lv_label_set_text(label, "Hello LVGL!");
    */


	//display_test_thread();

	//display_test_single_color(0x07E0);

	//initialiserer lvgl og setter tick
	lv_init();
	display_config();
	lv_display_t *mydisplay = lv_display_create(display_width,display_height);
	lv_display_set_color_format(mydisplay, LV_COLOR_FORMAT_RGB565);
	lv_display_set_buffers(mydisplay, imgbuff, NULL, sizeof(imgbuff), LV_DISPLAY_RENDER_MODE_PARTIAL);
	lv_display_set_flush_cb(mydisplay, my_flush_cb);

    lv_obj_t * label = lv_label_create(lv_screen_active());
    lv_label_set_text(label, "hello people");
    lv_obj_center(label);


	while(1){
        lv_timer_handler();
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
