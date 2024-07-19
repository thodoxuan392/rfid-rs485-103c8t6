/*
 * loadcell.c
 *
 *  Created on: Apr 1, 2024
 *      Author: xuanthodo
 */



#include <Device/loadcell.h>

#include <Hal/gpio.h>
#include <HX711/HX711.h>

#define LOADCELL_CALIBRATION_FACTOR_DEFAULT 	-120525.f

#ifdef __cplusplus
extern "C" {
#endif


static GPIO_info_t LOADCELL_ioTable[] = {
	[LOADCELL_IO_DATA_PIN] = {GPIOA, { GPIO_PIN_1, GPIO_MODE_INPUT, GPIO_NOPULL, GPIO_SPEED_FREQ_LOW}},
	[LOADCELL_IO_CLK_PIN] = {GPIOA, { GPIO_PIN_3, GPIO_MODE_OUTPUT_PP, GPIO_PULLUP, GPIO_SPEED_FREQ_LOW}},
};

static HX711 LOADCELL_hx711;


void LOADCELL_init(void){
	for (uint8_t io = LOADCELL_IO_DATA_PIN; io <= LOADCELL_IO_CLK_PIN; ++io) {
		HAL_GPIO_Init(LOADCELL_ioTable[io].port, &LOADCELL_ioTable[io].init_info);
	}
	LOADCELL_hx711.begin(LOADCELL_IO_DATA_PIN, LOADCELL_IO_CLK_PIN);
	LOADCELL_hx711.set_scale(LOADCELL_CALIBRATION_FACTOR_DEFAULT);
	LOADCELL_hx711.tare();
}

float LOADCELL_get(void){
	return LOADCELL_hx711.get_units();
}

void LOADCELL_writeIo(uint8_t io, uint8_t level){
	HAL_GPIO_WritePin(LOADCELL_ioTable[io].port, LOADCELL_ioTable[io].init_info.Pin, (GPIO_PinState)level);
}

uint8_t LOADCELL_readIo(uint8_t io){
	uint8_t state = HAL_GPIO_ReadPin(LOADCELL_ioTable[io].port, LOADCELL_ioTable[io].init_info.Pin);
	return state;
}

void LOADCELL_test(void){
	while(1){
		float data = LOADCELL_get();
		uint8_t a = 1;
//		CLOCK_delayMs(1000);
	}
}


#ifdef __cplusplus
}
#endif
