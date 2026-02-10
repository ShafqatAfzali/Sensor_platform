#ifndef _I2C_COM_
#define _I2C_COM_
#include <stdbool.h>

bool I2C_send(uint16_t address);
uint16_t I2C_recieve(uint16_t address);

#endif
