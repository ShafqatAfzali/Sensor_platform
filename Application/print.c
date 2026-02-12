#include "main.h"
#include "print.h"
#include "usart.h"
#include <stdio.h>
#include <stdarg.h>
#include <string.h>


void print(char *str, ...)
{
    char buffer[256];

    va_list variables;
    va_start(variables, str);
    vsnprintf(buffer, 256, str, variables);
    va_end(variables);

    uint16_t size_of_buffer=strlen(buffer);
    HAL_UART_Transmit(&huart2, (uint8_t *)buffer, size_of_buffer, HAL_MAX_DELAY);
}
