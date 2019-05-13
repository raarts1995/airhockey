#ifndef LCD_H
#define LCD_H
#include "system.h"

#define LCD_WIDTH 400
#define LCD_HEIGHT 240
#define pixToAddr(x, y) ((x + (y * LCD_WIDTH)) / 2)
#define RGB565(r, g, b) ((r & 0xF8) << 8) | ((g & 0xFC) << 3) | ((b & 0xF8) >> 3)

void lcd_fillRect(int x, int y, int w, int h, uint16_t color);
void lcd_clearDisplay(uint16_t color);
void lcd_setPixel(int x, int y, uint16_t color);
uint16_t lcd_getPixel(int x, int y);
void lcd_drawLine(int x0, int y0, int x1, int y1, uint16_t color);

#endif