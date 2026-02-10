#include "main.h"
#include "myapp.h"
#include <stdio.h>
#include <string.h>
#include "usart.h"
#include "print.h"


void myapp(int i){

	HAL_GPIO_TogglePin(Test_LED_GPIO_Port,Test_LED_Pin);
	HAL_Delay(500);
	print("this is the %i print\n", i);
}
