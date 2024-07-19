/*
 * loadcell.h
 *
 *  Created on: Apr 1, 2024
 *      Author: xuanthodo
 */

#ifndef INC_DEVICE_LOADCELL_H_
#define INC_DEVICE_LOADCELL_H_



#ifdef __cplusplus
extern "C" {
#endif


#include <stdint.h>

typedef enum {
	LOADCELL_IO_DATA_PIN,
	LOADCELL_IO_CLK_PIN
}LOADCELL_io;


void LOADCELL_init(void);
float LOADCELL_get(void);
void LOADCELL_writeIo(uint8_t io, uint8_t level);
uint8_t LOADCELL_readIo(uint8_t io);
void LOADCELL_test(void);



#ifdef __cplusplus
}
#endif


#endif /* INC_DEVICE_LOADCELL_H_ */


