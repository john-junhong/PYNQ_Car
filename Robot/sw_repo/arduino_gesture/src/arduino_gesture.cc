/******************************************************************************
 *  Copyright (c) 2016, Xilinx, Inc.
 *  All rights reserved.
 *
 *  Redistribution and use in source and binary forms, with or without
 *  modification, are permitted provided that the following conditions are met:
 *
 *  1.  Redistributions of source code must retain the above copyright notice,
 *     this list of conditions and the following disclaimer.
 *
 *  2.  Redistributions in binary form must reproduce the above copyright
 *      notice, this list of conditions and the following disclaimer in the
 *      documentation and/or other materials provided with the distribution.
 *
 *  3.  Neither the name of the copyright holder nor the names of its
 *      contributors may be used to endorse or promote products derived from
 *      this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 *  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 *  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 *  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
 *  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 *  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 *  OR BUSINESS INTERRUPTION). HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 *  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 *  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 *  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 *****************************************************************************/
/******************************************************************************
 *
 *
 * @file arduino_getsture.c
 *
 * IOP code (MicroBlaze) for DFRotbot Gesture module.
 * The module has to be connected to an arduino interface
 * via a shield socket.
 *
 * <pre>
 * MODIFICATION HISTORY:
 *
 * Ver   Who  Date     Changes
 * ----- --- ------- -----------------------------------------------
 * 1.00a ljh 01/28/19 release
 *
 * </pre>
 *
 *****************************************************************************/

#include "SparkFun_APDS9960.h"
#include "I2CMultiplexer.h"
#include "circular_buffer.h"
#include "timer.h"
#include "i2c.h"

// Work on 8-bit mode
#define CONFIG_IOP_SWITCH           0x1
#define READ_GESTURE                0x3

I2CMultiplexer I2CMulti(0x70);
int main()
{
	extern i2c APDS9960_device;
	int cmd;
	// Initialization
	I2CMulti.I2CMulti_device = APDS9960_device = i2c_open_device(0);

	while(1){
		// wait and store valid command
		while((MAILBOX_CMD_ADDR & 0x01)==0);
		cmd = MAILBOX_CMD_ADDR;

		switch(cmd){
			  case CONFIG_IOP_SWITCH:
				  I2CMulti.selectPort(MAILBOX_DATA(0));
				  MAILBOX_DATA(0) = APDS9960_init();
				  MAILBOX_DATA(1) = APDS9960_enableGestureSensor(true);
				  MAILBOX_CMD_ADDR = 0x0;
				  break;
			  case READ_GESTURE:
				  if ( APDS9960_isGestureAvailable() ) {
					  MAILBOX_DATA(0) = 1;
					  MAILBOX_DATA(1) = APDS9960_readGesture();
				  } else {
					  MAILBOX_DATA(0) = 0;
					  MAILBOX_DATA(1) = 0;
				  }
				  MAILBOX_CMD_ADDR = 0x0;
				  break;
			  default:
				  MAILBOX_CMD_ADDR = 0x0; // reset command
				  break;
		}
	}
	return 0;
}

//int main()
//{
//	extern i2c APDS9960_device;
//	int gest;
//	// Initialization
//	I2CMulti.I2CMulti_device = APDS9960_device = i2c_open_device(0);
//
//	I2CMulti.selectPort(0);
//
//	APDS9960_init();
//	APDS9960_enableGestureSensor(true);
//
//	while (1) {
//		if ( APDS9960_isGestureAvailable() ) {
//			gest = APDS9960_readGesture();
//			switch ( gest ) {
//			  case DIR_UP:
//				xil_printf("UP");
//				break;
//			  case DIR_DOWN:
//				xil_printf("DOWN");
//				break;
//			  case DIR_LEFT:
//				xil_printf("LEFT");
//				break;
//			  case DIR_RIGHT:
//				xil_printf("RIGHT");
//				break;
//			  case DIR_NEAR:
//				xil_printf("NEAR");
//				break;
//			  case DIR_FAR:
//				xil_printf("FAR");
//				break;
//			  default:
//				xil_printf("NONE");
//			}
//		}
//	}
//	return 0;
//}
