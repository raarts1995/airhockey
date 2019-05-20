#ifndef LED_H
#define LED_H

#include "system.h"

void led_set(int l, int state);
int led_get(int l);
void led_setAll(int states);
int led_getAll();
void hex_display(int nr, uint8_t seg);
void hex_number(int nr, int num);

#endif