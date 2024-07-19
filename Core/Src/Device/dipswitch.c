/*
 * dipswitch.c
 *
 *  Created on: Jun 21, 2024
 *      Author: xuanthodo
 */


#include <Device/dipswitch.h>

#include <Hal/gpio.h>

#define NB_ELEMENT(array) sizeof(array)/sizeof(array[0])

static GPIO_info_t DIPSWITCH_gpioTable[] = {
	{GPIOB, { GPIO_PIN_13, GPIO_MODE_INPUT, GPIO_PULLUP, GPIO_SPEED_FREQ_LOW}},
	{GPIOB, { GPIO_PIN_14, GPIO_MODE_INPUT, GPIO_PULLUP, GPIO_SPEED_FREQ_LOW}},
};

void DIPSWITCH_init(void){
	for (int dipswitchIdx = 0; dipswitchIdx < NB_ELEMENT(DIPSWITCH_gpioTable); ++dipswitchIdx) {
		HAL_GPIO_Init(DIPSWITCH_gpioTable[dipswitchIdx].port, &DIPSWITCH_gpioTable[dipswitchIdx].init_info);
	}
}

void DIPSWTICH_deinit(void){

}

uint8_t DIPSWITCH_get(void){
	uint8_t ret = 0;
	for (int dipswitchIdx = 0; dipswitchIdx < NB_ELEMENT(DIPSWITCH_gpioTable); ++dipswitchIdx) {
		ret |= (uint8_t)(!HAL_GPIO_ReadPin(DIPSWITCH_gpioTable[dipswitchIdx].port, DIPSWITCH_gpioTable[dipswitchIdx].init_info.Pin)) << dipswitchIdx;
	}
	return ret;
}
