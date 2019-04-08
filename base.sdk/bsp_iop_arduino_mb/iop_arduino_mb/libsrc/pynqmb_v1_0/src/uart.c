/******************************************************************************
 *  Copyright (c) 2018, Xilinx, Inc.
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
 * @file uart.c
 *
 * Implementing UART related functions for PYNQ Microblaze, 
 * including the UART read and write.
 *
 *
 * <pre>
 * MODIFICATION HISTORY:
 *
 * Ver   Who  Date     Changes
 * ----- --- ------- -----------------------------------------------
 * 1.00  yrq 01/30/18 add protection macro
 *
 * </pre>
 *
 *****************************************************************************/
#include <xparameters.h>
#include "uart.h"
#include <sleep.h>

#ifdef XPAR_XUARTLITE_NUM_INSTANCES
#include "xuartlite.h"
#include "xuartlite_i.h"
static XUartLite xuart[XPAR_XUARTLITE_NUM_INSTANCES];
XUartLite* xuart_ptr = &xuart[0];
extern XUartLite_Config XUartLite_ConfigTable[XPAR_XUARTLITE_NUM_INSTANCES];

/************************** Function Definitions ***************************/
uart uart_open_device(unsigned int device){
    int status;
    u16 dev_id;
    if (device < XPAR_XUARTLITE_NUM_INSTANCES) {
        dev_id = (u16)device;
    } else {
        int found = 0;
        for (u16 i = 0; i < XPAR_XUARTLITE_NUM_INSTANCES; ++i) {
            if (XUartLite_ConfigTable[i].RegBaseAddr == device) {
                found = 1;
                dev_id = i;
                break;
            }
        }
        if (!found) return -1;
    }
    status = XUartLite_Initialize(&xuart[dev_id], dev_id);
    if (status != XST_SUCCESS) {
        return -1;
    }
    return (uart)dev_id;
}


#ifdef XPAR_IO_SWITCH_NUM_INSTANCES
#ifdef XPAR_IO_SWITCH_0_UART0_BASEADDR
#include "xio_switch.h"
static int last_tx = -1;
static int last_rx = -1;

uart uart_open(unsigned int tx, unsigned int rx){
    if (last_tx != -1) set_pin(last_tx, GPIO);
    if (last_rx != -1) set_pin(last_rx, GPIO);
    last_tx = tx;
    last_rx = rx;
    set_pin(tx, UART0_TX);
    set_pin(rx, UART0_RX);
    return uart_open_device(XPAR_IO_SWITCH_0_UART0_BASEADDR);
}
#endif
#endif

unsigned int uart_available(uart dev_id) {
	u8 StatusRegister;
	StatusRegister = XUartLite_GetStatusReg(xuart[dev_id].RegBaseAddress);
	return StatusRegister & XUL_SR_RX_FIFO_VALID_DATA;
}


unsigned int uart_read(uart dev_id, unsigned char* read_data, unsigned int length){
	unsigned int recv = 0, temp, fail = 0;
	while (recv < length) {
		temp = XUartLite_Recv(&xuart[dev_id], read_data+recv, length-recv);
		if (temp == 0) {
			fail++;
			if (fail > 20)
				break;
			usleep(15000);
		} else {
			fail = 0;
		}
		recv+= temp;
	}
	return recv;
}


unsigned int uart_write(uart dev_id, unsigned char* write_data, unsigned int length){
	unsigned int send = 0, temp, fail = 0;
	while (send < length) {
		temp = XUartLite_Send(&xuart[dev_id], write_data + send, length-send);
		if (temp == 0) {
			fail++;
			if (fail > 20)
				break;
			usleep(15000);
		} else {
			fail = 0;
		}
    	send+=temp;
	}
	return send;
}


void uart_close(uart dev_id){
    XUartLite_ClearStats(&xuart[dev_id]);
}


unsigned int uart_get_num_devices(void){
    return XPAR_XUARTLITE_NUM_INSTANCES;
}

#endif
