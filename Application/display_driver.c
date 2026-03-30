#include "display_driver.h"
#include "spi.h"
#include "main.h"
#include "cmsis_os2.h"
#include <stdint.h>
#include "print.h"
#include "lvgl_send.h"

void display_write_command(uint8_t command)
{
	HAL_GPIO_WritePin(SPI_DC_GPIO_Port, SPI_DC_Pin, 0);
	HAL_GPIO_WritePin(SPI_CS_GPIO_Port, SPI_CS_Pin, 0);
	HAL_SPI_Transmit(&hspi2, &command, 1, 100);
    HAL_GPIO_WritePin(SPI_CS_GPIO_Port, SPI_CS_Pin, 1);
}

void display_write_data(uint8_t data)
{

	HAL_GPIO_WritePin(SPI_DC_GPIO_Port, SPI_DC_Pin, 1);
	HAL_GPIO_WritePin(SPI_CS_GPIO_Port, SPI_CS_Pin, 0);
	HAL_SPI_Transmit(&hspi2, &data, 1, 100);
    HAL_GPIO_WritePin(SPI_CS_GPIO_Port, SPI_CS_Pin, 1);

}


void display_hardware_reset()
{
	HAL_GPIO_WritePin(SPI_RST_GPIO_Port, SPI_RST_Pin, 0);
    osDelay(10);
	HAL_GPIO_WritePin(SPI_RST_GPIO_Port, SPI_RST_Pin, 1);
    osDelay(120);
}

void display_software_reset(){
	display_write_command(0x01);
    osDelay(120);
}


void display_sleep_in(){
	display_write_command(0x10);
    //husk 120ms minimum before sleep out
    osDelay(121);
}

void display_sleep_out(){
	display_write_command(0x11);
    //minst 5ms før neste command
    osDelay(6);
}


//for sikkerhetskyld
void display_inversion_on(){
	display_write_command(0x21);
}

void display_on(){
	display_write_command(0x29);
}

void display_off(){
	display_write_command(0x28);
}

void display_start_frame(){
	display_write_command(0x2C);
}

void display_portait_vertical_flipped(){
	display_write_command(0x36);
	//change this later if needed
	//display_write_data(0x00);
	display_write_data(0x00);
}

//bruker dette senere som setting for å spare power
void display_idle_mode_on(){
	display_write_command(0x39);
}

void display_idle_mode_off(){
	display_write_command(0x38);
	osDelay(6);
}


void display_pixel_format_16bit(){
	//0101 16bit/pixel for RGB
	//101 16bit/pixel control
	//D3 --> 0 not used
	//0x55
	display_write_command(0x3A);
	display_write_data(0x55);
}

// setter default i init
void display_60hz_frame_rate_normal(void) {
	display_write_command(0xB1);
    // DIVA=14
	display_write_data(0x05);
    // VPA=22
	display_write_data(0x10);
}

// bruker senere når jeg skal spare power 37.4Hz egentlig
void display_40hz_frame_rate_idle(void) {
	display_write_command(0xB2);
    // DIVA=20
	display_write_data(0x14);
    // VPA=63
	display_write_data(0x3F);
}

void display_inversion_config(void) {
	display_write_command(0xB4);
    //NLA=0, NLB=1, NLC=0 dvs default
    display_write_data(0x02);
}



//XS = start kolonnen
//XE = slutt kolonnen
void display_set_columns(uint16_t XS,uint16_t XE){
	display_write_command(0x2A);
    uint8_t XSM = XS >> 8;
	display_write_data(XSM);
	uint8_t XSL = XS & 0xFF;
	display_write_data(XSL);
	uint8_t XEM = XE >> 8;
	display_write_data(XEM);
	uint8_t XEL = XE & 0xFF;
	display_write_data(XEL);
}

//samme som i x aksen
void display_set_rows(uint16_t YS,uint16_t YE){
	display_write_command(0x2B);
    uint8_t YSM = YS >> 8;
	display_write_data(YSM);
	uint8_t YSL = YS & 0xFF;
	display_write_data(YSL);
	uint8_t YEM = YE >> 8;
	display_write_data(YEM);
	uint8_t YEL = YE & 0xFF;
	display_write_data(YEL);
}


//pointer til arrays av pixel data
//pointer til areal objectet

void display_set_img(img_obj *this_img)
{
	display_set_columns(this_img->XS, this_img->XE);
	display_set_rows(this_img->YS, this_img->YE);

    // antall pixler
    uint16_t width = this_img->XE - this_img->XS + 1;
    uint16_t height = this_img->YE - this_img->YS + 1;
    uint16_t total_bytes = width * height * 2;

    // start å skrive til GRAM
	display_start_frame();

	// sender alle pixler med engang
	HAL_GPIO_WritePin(SPI_DC_GPIO_Port, SPI_DC_Pin, 1);
	HAL_GPIO_WritePin(SPI_CS_GPIO_Port, SPI_CS_Pin, 0);
	HAL_StatusTypeDef status=HAL_SPI_Transmit(&hspi2, this_img->pixels, total_bytes, HAL_MAX_DELAY);
	HAL_GPIO_WritePin(SPI_CS_GPIO_Port, SPI_CS_Pin, 1);
	if(status==HAL_OK){
		print("its sending bruh\n");
		osDelay(1);
	}else{
		print("boooooo\n");
	}
}

void display_test_single_color(uint16_t color) {
    img_obj myimg;
    myimg.pixels = imgbuff;
    myimg.XS = 0;
    myimg.XE = 127;
    myimg.YS = 0;
    myimg.YE = 159;

    for(int i = 0; i < total_display_bytes; i += 2) {
        myimg.pixels[i] = (color >> 8) & 0xFF;
        myimg.pixels[i+1] = color & 0xFF;
    }

    display_set_img(&myimg);
}

void display_config(){
	//resetter
	display_hardware_reset();
	osDelay(120);
	display_software_reset();
	osDelay(120);

	//setter ut av sleep in og enabler inversion
	//er gjort automatisk etter reset men gjør det for sikkerhets skyldx, ingen effekt uansett
	display_sleep_out();
	osDelay(120);
	display_inversion_on();
	osDelay(120);
	//setter normal pixel oppfylling, hvis flipped eller noe endrer jeg denne
	display_portait_vertical_flipped();
	osDelay(120);
	//setter 16bit/pixel for kontroll og RGB
	display_pixel_format_16bit();
	osDelay(120);

	//setter 60Hz fps i vanlig tilstand
	display_60hz_frame_rate_normal();
	osDelay(120);
	//setter 40Hz fps i idle mode (batteri sparing)
	display_40hz_frame_rate_idle();
	osDelay(120);

	//slår på slik at display får pixel info fra GRAM
	display_on();
	osDelay(120);

	//display_idle_mode_on();
}


void display_test_thread(){
	display_config();

	while(1) {
	    display_test_single_color(0xF800);
	    osDelay(2000);
	    display_test_single_color(0x07E0);
	    osDelay(2000);
	    display_test_single_color(0x001F);
	    osDelay(2000);
	}

}


void display_INIT(){

	osThreadAttr_t display_thread_attr = {
	    .name = "display_thread",
	    .priority = osPriorityNormal,
	    .stack_size = 8192
	};

    osThreadNew(display_test_thread, NULL, &display_thread_attr);

}










