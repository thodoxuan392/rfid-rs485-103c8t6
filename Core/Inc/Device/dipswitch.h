/*
 * dipswitch.h
 *
 *  Created on: Jun 21, 2024
 *      Author: xuanthodo
 */

#ifndef INC_DEVICE_DIPSWITCH_H_
#define INC_DEVICE_DIPSWITCH_H_

#include <stdint.h>

void DIPSWITCH_init(void);
void DIPSWTICH_deinit(void);

uint8_t DIPSWITCH_get(void);

#endif /* INC_DEVICE_DIPSWITCH_H_ */
