#include "led.h"

uint32_t *ledBase = (uint32_t*)LED_BASE;
uint32_t *hexBase = (uint32_t*)HEX_BASE;

void led_set(int l, int state) {
	if (l > LED_NUM)
		return;
	
	if (state)
		*ledBase |= (1 << l);
	else
		*ledBase &= ~(1 << l);
}

int led_get(int l) {
	if (l > LED_NUM)
		return 0;
	
	return (*ledBase >> l) & 1;
}

void led_setAll(int states) {
	*ledBase = states & ((1 << LED_NUM) - 1);
}

int led_getAll() {
	return *ledBase & ((1 << LED_NUM) - 1);
}

void hex_display(int nr, uint8_t seg) {
	if (nr >= HEX_NUM)
		return;
	uint32_t curHex = hexBase[nr / 4];
	curHex &= ~(0xff << (8*(nr%4)));
	curHex |= ((~seg) & 0x7F) << (8*(nr%4));
	hexBase[nr/4] = curHex;
}

void hex_number(int nr, int num) {
	if (nr >= HEX_NUM)
		return;
	
	uint8_t hex = 0;
	switch (num) {
		case 0: hex = 0x3f; break;
		case 1: hex = 0x06; break;
		case 2: hex = 0x5b; break;
		case 3: hex = 0x4f; break;
		case 4: hex = 0x66; break;
		case 5: hex = 0x6d; break;
		case 6: hex = 0x7d; break;
		case 7: hex = 0x07; break;
		case 8: hex = 0x7f; break;
		case 9: hex = 0x6f; break;
		default: break;
	}
	hex_display(nr, hex);
}