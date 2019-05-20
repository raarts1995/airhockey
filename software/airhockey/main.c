#include <stdint.h>
#include <math.h>
#include "system.h"
#include "lcd.h"
//#include "i2c.h"
#include "led.h"

typedef struct {
	float x;
	float y;
	int r;
	float vx;
	float vy;
	float mass;
} Circle;

int circleVsCircle(Circle *a, Circle *b);
void drawPuck(Circle c, uint16_t color);
void updatePuck(Circle *c);
void drawField(int cntX, int cntY, int r, uint16_t color);

int main()
{
	//i2c_init();
	
	lcd_clearDisplay(0xffff);
	
	Circle c[]  =  {{10,  10,  10,  1, 0.5, 2},
					{100, 20,  10, -1, 0.5, 2},
					{100, 100, 10, -0.5, 1, 2},
					{50,  200, 10, -1, 1, 2},
					{50,  50,  10, 1, 1.5, 2}
					};
	
	int cLen = sizeof(c) / sizeof(Circle);
	
	hex_number(0, 9);
	hex_number(1, 8);
	hex_number(2, 7);
	hex_number(3, 6);
	hex_number(4, 5);
	hex_number(5, 4);
	
	while (1) {
		/*drawPuck(c[0], 0);
		drawPuck(c[1], 0);*/
		for (int i = 0; i < cLen; i++) {
			drawPuck(c[i], 0);
		}
		
		for (int i = 0; i < 50000; i++)
			;
		
		/*drawPuck(c[0], 0xffff);
		drawPuck(c[1], 0xffff);*/
		for (int i = 0; i < cLen; i++)
			drawPuck(c[i], 0xffff);
		
		//circleVsCircle(&c[0], &c[1]);
		for (int i = 0; i < cLen-1; i++)
			for (int j = i+1; j < cLen; j++)
				circleVsCircle(&c[i], &c[j]);
			
		/*updatePuck(&c[0]);
		updatePuck(&c[1]);*/
		for (int i = 0; i < cLen; i++)
			updatePuck(&c[i]);
		
		//drawField(9, 9, 2, RGB565(0xee, 0xee, 0xee));
		
	}
	return 0;
}

int circleVsCircle(Circle *a, Circle *b) {
	if ((pow((*a).x - (*b).x, 2) + pow((*a).y - (*b).y, 2)) < pow((*a).r + (*b).r, 2)) {

		float d = sqrt(pow((*a).x - (*b).x, 2) + pow((*a).y - (*b).y, 2));
		/*float nx = ((*a).x - (*b).x) / 2;
		float ny = ((*a).y - (*b).y) / 2;*/
		
		float nx = (*b).x - (*a).x;
		float ny = (*b).y - (*a).y;
		float len = sqrt(nx*nx + ny*ny);
		nx /= len;
		ny /= len;
		
		float p = 2 * ((*a).vx * nx + (*a).vy * ny - (*b).vx * nx - (*b).vy * ny) / ((*a).mass + (*b).mass);
		(*a).vx = (*a).vx - p * (*a).mass * nx;
		(*a).vy = (*a).vy - p * (*a).mass * ny;
		(*b).vx = (*b).vx + p * (*b).mass * nx;
		(*b).vy = (*b).vy + p * (*b).mass * ny;
		return 1;
	}
	else
		return 0;
}

void drawPuck(Circle c, uint16_t color) {
	lcd_drawCircle(c.x, c.y, c.r, color);
	//lcd_fillCircle(c.x, c.y, c.r, color);
}

void updatePuck(Circle *c) {
	(*c).x += (*c).vx;
	((*c)).y += (*c).vy;
	
	if ((*c).x - (*c).r <= 0)
		(*c).vx = ((*c).vx < 0 ? -(*c).vx : (*c).vx);
	if ((*c).x + (*c).r >= LCD_WIDTH)
		(*c).vx = ((*c).vx > 0 ? -(*c).vx : (*c).vx);
	if ((*c).y - (*c).r <= 0)
		(*c).vy = ((*c).vy < 0 ? -(*c).vy : (*c).vy);
	if ((*c).y+ (*c).r >= LCD_HEIGHT)
		(*c).vy = ((*c).vy > 0 ? -(*c).vy : (*c).vy);
}

void drawField(int cntX, int cntY, int r, uint16_t color) {
	int xSpacing = LCD_WIDTH/(cntX + 1);
	int ySpacing = LCD_HEIGHT/(cntY + 1);
	
	int x = xSpacing;
	int y = ySpacing;
	for (int yNr = 0; yNr < cntY; yNr++) {
		for (int xNr = 0; xNr < cntX; xNr++) {
			lcd_fillCircle(x, y, r, color);
			x += xSpacing;
		}
		x = xSpacing;
		y += ySpacing;
	}
	
	lcd_drawLine(LCD_WIDTH/2, 0, LCD_WIDTH/2, LCD_HEIGHT-1, RGB565(0xdd, 0, 0));
	lcd_drawCircle(LCD_WIDTH/2, LCD_HEIGHT/2, 40, RGB565(0xdd, 0, 0));
	
	lcd_fillRect(0, LCD_HEIGHT/2 - 40, 3, 80, 0);
	lcd_fillRect(LCD_WIDTH-1 - 3, LCD_HEIGHT/2 - 40, 3, 80, 0);
}

/*void drawScore(int p1, int p2) {
	
}*/
