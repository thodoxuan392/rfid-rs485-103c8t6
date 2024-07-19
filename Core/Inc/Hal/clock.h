/*
 * clock.h
 *
 *  Created on: May 10, 2023
 *      Author: xuanthodo
 */

#ifndef INC_HAL_CLOCK_H_
#define INC_HAL_CLOCK_H_

#include "stdio.h"
#include "stdbool.h"

bool CLOCK_init();
uint32_t CLOCK_getTick(void);
void CLOCK_delayMs(uint32_t ms);
void CLOCK_delayUs(uint32_t us);
void CLOCK_test(void);

#endif /* INC_HAL_CLOCK_H_ */
