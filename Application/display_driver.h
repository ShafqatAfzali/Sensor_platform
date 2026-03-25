#ifndef _DISPLAY_DRIVER_
#define _DISPLAY_DRIVER_
#include <stdint.h>

#define display_width  128
#define display_height 160
//høydexbreddex2
#define total_display_bytes 40960


typedef struct {
	uint8_t *pixels;
	uint16_t XS;
	uint16_t XE;
	uint16_t YS;
	uint16_t YE;

} img_obj;

/*
void display_write_command(uint8_t command, char *type);
void display_write_data(uint8_t data, char *type);
*/

void display_write_command(uint8_t command);
void display_write_data(uint8_t data);
void display_hardware_reset(void);
void display_software_reset(void);
void display_sleep_in(void);
void display_sleep_out(void);
void display_inversion_on(void);
void display_on(void);
void display_off(void);
void display_start_frame(void);
void display_portait_vertical_flipped(void);
void display_idle_mode_on(void);
void display_idle_mode_off(void);
void display_pixel_format_16bit(void);
void display_60hz_frame_rate_normal(void);
void display_40hz_frame_rate_idle(void);
void display_inversion_config(void);
void display_set_columns(uint16_t XS, uint16_t XE);
void display_set_rows(uint16_t YS, uint16_t YE);
void display_set_img(img_obj *this_img);
void display_config();
void display_INIT();
void display_test_thread();
void display_test_single_color(uint16_t color);


#endif

