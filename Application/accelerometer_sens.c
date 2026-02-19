#include "main.h"
#include "accelerometer_sens.h"
#include "print.h"
#include "sens_detect.h"
#include "i2c.h"
#include "cmsis_os2.h"
#include <stdbool.h>

#define a_meter_addr 0x1D
#define X_MSB_reg_addr 0x01
#define X_LSB_reg_addr 0x02
#define Y_MSB_reg_addr 0x03
#define Y_LSB_reg_addr 0x04
#define Y_MSB_reg_addr 0x05
#define Y_LSB_reg_addr 0x06

#define FIFO_reg_config_addr  0x09
#define range_reg_config_addr 0x0E
#define landscape_reg_config_addr 0x11
#define Xoffset_reg_config_addr 0x2F
#define Xoffset_reg_config_addr 0x30
#define Xoffset_reg_config_addr 0x31


void accelerometer_config(){

}

void accelormeter_thread_func(){

}


void accelerometer_INIT(){

}


