#include <stdint.h>
#include "system.h"
#include "lcd.h"

uint32_t *ledBase = (uint32_t*)0x00043040;

int main()
{
	/*clearDisplay(0xFFFF);
	for (uint32_t i = 0; i < 400; i++) {
		setPixel(i, 100, RGB565(0xff, 0, 0));
		setPixel(i, 120, RGB565(0, 0xff, 0));
		setPixel(i, 140, RGB565(0, 0, 0xff));
	}*/
	lcd_fillRect(0, 0, 133, LCD_HEIGHT-1, RGB565(0xff, 0, 0));
	lcd_fillRect(133, 0, 134, LCD_HEIGHT-1, RGB565(0, 0xff, 0));
	lcd_fillRect(267, 0, 133, LCD_HEIGHT-1, RGB565(0, 0, 0xff));
	lcd_drawLine(0, 0, LCD_WIDTH-1, LCD_HEIGHT-1, RGB565(0, 0, 0xff));
	//lcd_drawLine(0, LCD_HEIGHT-1, LCD_WIDTH-1, 0, RGB565(0, 0, 0xff));
	
	while (1) {
		/**ledBase = 0;
		for (int i = 0; i < 500000; i++)
			;
		*ledBase = 0x3FF;
		for (int i = 0; i < 500000; i++)
			;*/
	}
	return 0;
}
