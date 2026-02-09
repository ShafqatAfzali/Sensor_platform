#include "main.h"
#include "myapp.h"
#include <stdio.h>
#include <string.h>
#include "usart.h"


void myapp(int i){

	HAL_GPIO_TogglePin(Test_LED_GPIO_Port,Test_LED_Pin);
	HAL_Delay(500);

    char txt[32];
    snprintf(txt, sizeof(txt), "printed once %d\r\n", i);
	HAL_UART_Transmit(&huart2,(uint8_t*)txt, strlen(txt), HAL_MAX_DELAY);
}
