#include "main.h"
#include "print.h"
#include "usart.h"
#include <stdio.h>
#include <stdarg.h>
#include <string.h>


//funksjon med variabler sopm pointer til adressen til variabel textene
void print(char *str, ...)
{
    char buffer[256];
    //type object som holder informasjon om variablene
    va_list variables;
    //mapper starten og slutten av str listen i stacken til variables
    va_start(variables, str);
    //mapper str texten basert på start og slutten av variables til buffer
    vsnprintf(buffer, 256, str, variables);
    //avslutter slik at vi ikke trenger å bruke extra ressurser
    va_end(variables);

    uint16_t size_of_buffer=strlen(buffer);

    //transmitter texten via uart2
    HAL_UART_Transmit(&huart2, (uint8_t *)buffer, size_of_buffer, HAL_MAX_DELAY);
}
