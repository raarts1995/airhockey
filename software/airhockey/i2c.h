#ifndef I2C_H
#define I2C_H

#include <stdint.h>
#include "system.h"

void i2c_init();
void i2c_write(uint8_t address, uint8_t *buf, int len);
void i2c_read(uint8_t address, uint8_t *buf, int len);

#endif