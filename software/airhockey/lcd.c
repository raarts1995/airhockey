#include "lcd.h"

uint32_t *lcdBase = (uint32_t*)LCD_BASE;

void lcd_clearDisplay(uint16_t color) {
	for (int y = 0; y < LCD_HEIGHT; y++) {
		for (int x = 0; x < LCD_WIDTH; x++) {
			lcd_setPixel(x, y, color);
		}
	}
}

void lcd_setPixel(int x, int y, uint16_t color) {
	if ((x >= LCD_WIDTH) || (x < 0) || (y >= LCD_HEIGHT) || (y < 0))
		return;
	
	uint32_t val = lcdBase[pixToAddr(x, y)];
	if (x & 1)
		val = (val & ~0xFFFF0000) | ((uint32_t)color << 16);
	else
		val = (val & ~0x0000FFFF) | (uint32_t)color;
	lcdBase[pixToAddr(x, y)] = val;
}

uint16_t lcd_getPixel(int x, int y) {
	if ((x >= LCD_WIDTH) || (x < 0) || (y >= LCD_HEIGHT) || (y < 0))
		return 0;
	uint32_t val = lcdBase[pixToAddr(x, y)];
}

void lcd_drawRect(int x, int y, int w, int h, uint16_t color) {
	for (int cx = x; cx < x+w; cx++) {
		lcd_setPixel(cx, y, color);
		lcd_setPixel(cx, y+h-1, color);
	}
	for (int cy = y; cy < y+h; cy++) {
		lcd_setPixel(x, cy, color);
		lcd_setPixel(x+w-1, cy, color);
	}
}

void lcd_fillRect(int x, int y, int w, int h, uint16_t color) {
	for (int cy = y; cy < y+h; cy++)
		for (int cx = x; cx < x+w; cx++)
			lcd_setPixel(cx, cy, color);
}

void lcd_drawCircle(int x0, int y0, int r, uint16_t color) {
	int f = 1 - r;
	int ddF_x = 1;
	int ddF_y = -2 * r;
	int x = 0;
	int y = r;
	
	lcd_setPixel(x0, y0+r, color);
	lcd_setPixel(x0, y0-r, color);
	lcd_setPixel(x0+r, y0, color);
	lcd_setPixel(x0-r, y0, color);

	while (x<y) {
		if (f >= 0) {
			y--;
			ddF_y += 2;
			f += ddF_y;
		}
		x++;
		ddF_x += 2;
		f += ddF_x;
  
		lcd_setPixel(x0 + x, y0 + y, color);
		lcd_setPixel(x0 - x, y0 + y, color);
		lcd_setPixel(x0 + x, y0 - y, color);
		lcd_setPixel(x0 - x, y0 - y, color);

		lcd_setPixel(x0 + y, y0 + x, color);
		lcd_setPixel(x0 - y, y0 + x, color);
		lcd_setPixel(x0 + y, y0 - x, color);
		lcd_setPixel(x0 - y, y0 - x, color);
	}
}

void lcd_fillCircle(int x0, int y0, int r, uint16_t color) {
	int f = 1 - r;
	int ddF_x = 1;
	int ddF_y = -2 * r;
	int x = 0;
	int y = r;
	
	int i;
	for (i=y0-r; i<=y0+r; i++) {
		lcd_setPixel(x0, i, color);
	}

	while (x<y) {
		if (f >= 0) {
			y--;
			ddF_y += 2;
			f += ddF_y;
		}
		x++;
		ddF_x += 2;
		f += ddF_x;
		
		int i;
		for (i=y0-y; i<=y0+y; i++) {
			lcd_setPixel(x0+x, i, color);
			lcd_setPixel(x0-x, i, color);
		} 
		for (i=y0-x; i<=y0+x; i++) {
			lcd_setPixel(x0+y, i, color);
			lcd_setPixel(x0-y, i, color);
		}    
	}
}

void lcd_drawLine(int x0, int y0, int x1, int y1, uint16_t color) {
	int dy = y1 - y0;
	int dx = x1 - x0;
	int absdx = (dx < 0 ? -dx : dx);
	int absdy = (dy < 0 ? -dy : dy);
	
	int steep = absdy > absdx;
	int temp;
	if (steep) {
		temp = x0; x0 = y0; y0 = temp;
		temp = x1; x1 = y1; y1 = temp;
	}
	if (x0 > x1) {
		temp = x0; x0 = x1; x1 = temp;
		temp = y0; y0 = y1; y1 = temp;
	}
	

	dy = y1 - y0;
	dx = x1 - x0;
	absdx = (dx < 0 ? -dx : dx);
	absdy = (dy < 0 ? -dy : dy);

	int err = dx / 2;
	int ystep = ((y0 < y1) ? 1 : -1);
	for (; x0 <= x1; x0++) {
		if (steep)
			lcd_setPixel(y0, x0, color);
		else
			lcd_setPixel(x0, y0, color);
		err -= absdy;
		if (err < 0) {
			y0 += ystep;
			err += dx;
		}
	}
}

void lcd_drawChar(int x, int y, unsigned char c, int size, uint16_t color) {
	if (size < 1)
		return;
	
	for (int i = 0; i < 5; i++) {
		int d = font[(c * 5) + i];
		for (int j = 0; j < 8; j++) {
			if (d & (1 << j)) {
				for (int sy = 0; sy < size; sy++) {
					for (int sx = 0; sx < size; sx++) {
						lcd_setPixel(x + i*size + sx, y + j*size + sy, color);
					}
				}
			}
		}
	}
}

void lcd_drawString(int x0, int y0, char *str, int size, uint16_t color) {
	if (size < 1)
		return;
	
	int x = x0;
	int y = y0;
	while (*str != '\0') {
		if (*str == '\n') {
			x = x0;
			y += 9*size; //8 + 1px additional space
		}
		else {
			lcd_drawChar(x, y, *str, size, color);
			x += 6*size; //5 + 1px aditional space
		}
		str++;
	}
}
