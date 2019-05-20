#ifndef SYSTEM_H
#define SYSTEM_H

#include <stdint.h>

#define LCD_BASE 0x00000000
#define LCD_SIZE 0x0002EE00

#define LED_BASE 0x00061020
#define LED_NUM  10

#define HEX_BASE 0x00061030
#define HEX_NUM  6

#define TOUCH_BASE 0x00061000

/*#define I2C_BASE 0x00061000
#define I2C_TFR_CMD          0
#define I2C_RX_DATA          1
#define I2C_CTRL             2
#define I2C_ISER             3
#define I2C_ISR              4
#define I2C_STATUS           5
#define I2C_TFR_CMD_FIFO_LVL 6
#define I2C_RX_DATA_FIFO_LVL 7
#define I2C_SCL_LOW          8
#define I2C_HIGH             9
#define I2C_HOLD             10

#define I2C_TFR_CMD_STA (1 << 9)
#define I2C_TFR_CMD_STO (1 << 8)
#define I2C_TFR_CMD_ADDR_MASK 0xFE
#define I2C_TFR_CMD_RW  (1 << 0)

#define I2C_CTRL_BUS_SPEED (1 << 1) //0: 100kbit/s 1:400kbit/s
#define I2C_CTRL_EN (1 << 0)*/

#endif