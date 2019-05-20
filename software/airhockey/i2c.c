#include "i2c.h"

uint32_t *i2cBase = (uint32_t*)I2C_BASE;

void i2c_init() {
	//enable i2c and set speed 400kbit/s
	i2cBase[I2C_CTRL] = I2C_CTRL_EN | I2C_CTRL_BUS_SPEED;
}

void i2c_write(uint8_t address, uint8_t *buf, int len) {
	i2cBase[I2C_TFR_CMD] = I2C_TFR_CMD_STA | ((address << 1) & I2C_TFR_CMD_ADDR_MASK);
	for (int i = 0; i < len; i++) {
		i2cBase[I2C_TFR_CMD] = ((i == len - 1) ? I2C_TFR_CMD_STO : 0) | buf[i];
	}
}

void i2c_read(uint8_t address, uint8_t *buf, int len) {
	i2cBase[I2C_TFR_CMD] = I2C_TFR_CMD_STA | ((address << 1) & I2C_TFR_CMD_ADDR_MASK) | I2C_TFR_CMD_RW;
	for (int i = 0; i < len; i++) {
		i2cBase[I2C_TFR_CMD] = ((i == len - 1) ? I2C_TFR_CMD_STO : 0);
		buf[i] = i2cBase[I2C_RX_DATA];
	}	
}