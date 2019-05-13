#include "lcd.h"

#define abs(x) (x < 0 ? -x : x)

uint32_t *lcdBase = (uint32_t*)LCD_BASE;

void lcd_clearDisplay(uint16_t color) {
	for (int y = 0; y < LCD_HEIGHT; y++) {
		for (int x = 0; x < LCD_WIDTH; x++) {
			lcd_setPixel(x, y, color);
		}
	}
}

void lcd_setPixel(int x, int y, uint16_t color) {
	if (pixToAddr(x, y) >= LCD_BASE + LCD_SIZE)
		return;
	uint32_t val = lcdBase[pixToAddr(x, y)];
	if (x & 1)
		val = (val & ~0xFFFF0000) | ((uint32_t)color << 16);
	else
		val = (val & ~0x0000FFFF) | (uint32_t)color;
	lcdBase[pixToAddr(x, y)] = val;
}

uint16_t lcd_getPixel(int x, int y) {
	if (pixToAddr(x, y) >= LCD_BASE + LCD_SIZE)
		return 0;
	uint32_t val = lcdBase[pixToAddr(x, y)];
}

void lcd_fillRect(int x, int y, int w, int h, uint16_t color) {
	for (int cy = y; cy < y+h; cy++)
		for (int cx = x; cx < x+w; cx++)
			lcd_setPixel(cx, cy, color);
}

void lcd_drawLine(int x0, int y0, int x1, int y1, uint16_t color) {
	int steep = abs(y1 - y0) > abs(x1 - x0);
	int temp;
	if (steep) {
		temp = x0; x0 = y0; y0 = temp;
		temp = x1; x1 = y1; y1 = temp;
	}
	if (x0 > x1) {
		temp = x0; x0 = x1; x1 = temp;
		temp = y0; y0 = y1; y1 = temp;
	}
	
	int dx = x1 - x0;
	int dy = abs(y1 - y0);
	
	int err = dx / 2;
	int ystep = ((y0 < y1) ? 1 : -1);
	for (; x0 <= x1; x0++) {
		if (steep)
			lcd_setPixel(y0, x0, color);
		else
			lcd_setPixel(x0, y0, color);
		err -= dy;
		if (err < 0) {
			y0 += ystep;
			err += dx;
		}
	}
}