/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWA RE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include <string.h>
#include "platform.h"
#include "xil_printf.h"
#include "xgpio.h"
#include "xil_io.h"
#include "xil_types.h"
#include "xil_cache.h"   // 如果使用缓存，加入这个头文件
#include "AD9516.h"
#include "sleep.h"

#define GPIO_TRIG_DEVICE_ID     XPAR_AXI_GPIO_0_DEVICE_ID
#define GPIO_TRIG_CHANNEL       1
#define READ_START_ADDR    0x00000000          // PS 可访问的 DDR 地址
#define READ_SIZE_BYTES    0x1000              // 读取 4KB 数据
#define READ_END_ADDR      (READ_START_ADDR + READ_SIZE_BYTES)
#define READ_STEP_BYTES    2                   // 每次读取 2 字节

unsigned char cdata = 0;
unsigned char slave_address[2];
unsigned char test_buf[10];

int main()
{
	int status;
	XGpio Gpio;

    init_platform();

    xil_printf("Hello World\n\r");
    xil_printf("Successfully ran Hello World application\n\r");

    //SPI初始化
    Gpio_Init(GPIO_DEVICE_ID);

    // 初始化 GPIO
	status = XGpio_Initialize(&Gpio, GPIO_TRIG_DEVICE_ID);
	if (status != XST_SUCCESS) {
		xil_printf("GPIO_TRIG init failed!\n\r");
		return XST_FAILURE;
	}
	// 设置 GPIO 为输出方向（全为输出）
	XGpio_SetDataDirection(&Gpio, GPIO_TRIG_CHANNEL, 0x0);
	// 初始拉低 GPIO
	XGpio_DiscreteWrite(&Gpio, GPIO_TRIG_CHANNEL, 0);


    usleep(100);
    NSS_H();

/*
 * 配置初始信息，打印寄存器地址检查读写功能是否正常
 */
	cdata = SERIAL_DEFAULT | SERIAL_SDO_ACTIVE;
	WriteReg(SERIAL_PORT_CONFIGURATION,&cdata,ONE_BYTE,1);
	UpdateRegister();

	usleep(100);
	ReadReg(0x003,slave_address,ONE_BYTE,1);
	UpdateRegister();

	printf("0x%x\n\r",slave_address[0]);//打印寄存器地址信息

/*
 * 配置时钟、分频数值，需要对着数据手册进行计算
 */
	//设置VCO内部参考时钟
	cdata = 0x02;
	WriteReg(0x1e1,&cdata,ONE_BYTE,1);
	ReadReg(0x1e1,test_buf,ONE_BYTE,1);
	printf("0x1e1 = 0x%x\n\r",test_buf[0]);
	UpdateRegister();

	//设置时钟差分
	cdata = 0x07;
	WriteReg(0x01c,&cdata,ONE_BYTE,1);
	ReadReg(0x01c,test_buf,ONE_BYTE,1);
	printf("0x01c = 0x%x\n\r",test_buf[0]);
	UpdateRegister();

	//PLL使能
	cdata = 0x7c;
	WriteReg(0x010,&cdata,ONE_BYTE,1);
	ReadReg(0x010,test_buf,ONE_BYTE,1);
	printf("0x010 = 0x%x\n\r",test_buf[0]);
	UpdateRegister();

	//R=1
	cdata = 0x01;
	WriteReg(0x011,&cdata,ONE_BYTE,1);
	ReadReg(0x011,test_buf,ONE_BYTE,1);
	printf("R = 0x%x\n\r",test_buf[0]);
	UpdateRegister();

	cdata = 0x00;
	WriteReg(0x012,&cdata,ONE_BYTE,1);
	ReadReg(0x012,test_buf,ONE_BYTE,1);
	printf("R = 0x%x\n\r",test_buf[0]);
	UpdateRegister();

	//P
	cdata = 0x06;
	WriteReg(0x016,&cdata,ONE_BYTE,1);
	ReadReg(0x016,test_buf,ONE_BYTE,1);
	printf("P = 0x%x\n\r",test_buf[0]);
	UpdateRegister();

	//A=0
	cdata = 0x00;
	WriteReg(0x013,&cdata,ONE_BYTE,1);
	ReadReg(0x013,test_buf,ONE_BYTE,1);
	printf("A = 0x%x\n\r",test_buf[0]);
	UpdateRegister();

	//B=57
	cdata = 0x03;
	WriteReg(0x014,&cdata,ONE_BYTE,1);
	ReadReg(0x014,test_buf,ONE_BYTE,1);
	printf("B = 0x%x\n\r",test_buf[0]);
	UpdateRegister();

	//VCO分频，Dvco=2,这里会被除以2
	cdata = 0x00;
	WriteReg(0x1e0,&cdata,ONE_BYTE,1);
	ReadReg(0x1e0,test_buf,ONE_BYTE,1);
	printf("Dvco = 0x%x\n\r",test_buf[0]);
	UpdateRegister();


/*
 * D0、D1、D2用于out0-out5分频使用，此处未用到，绕过
 * */
	//绕过D0，默认绕过
	cdata = 0x80;
	WriteReg(0x191,&cdata,ONE_BYTE,1);
	ReadReg(0x191,test_buf,ONE_BYTE,1);
	printf("DX = 0x%x\n\r",test_buf[0]);
	UpdateRegister();
	//绕过D1
	cdata = 0x80;
	WriteReg(0x194,&cdata,ONE_BYTE,1);
	ReadReg(0x194,test_buf,ONE_BYTE,1);
	printf("DX = 0x%x\n\r",test_buf[0]);
	UpdateRegister();
	//绕过D2，默认绕过
	cdata = 0x80;
	WriteReg(0x197,&cdata,ONE_BYTE,1);
	ReadReg(0x197,test_buf,ONE_BYTE,1);
	printf("DX = 0x%x\n\r",test_buf[0]);
	UpdateRegister();


	/*
	 * 200M 0X10 0X00
	 * 120M	0x12 0x00
	 * 100M 0X13 0X00
	 * */

/*
 *D3、D4用于out6-out9分频使用，需要对寄存器进行配置，可以配置相位、占空比等等
 */
	//D3.1,			ADC1		210MHz
	cdata = 0X13;
	WriteReg(0x199,&cdata,ONE_BYTE,1);
	ReadReg(0x199,test_buf,ONE_BYTE,1);
	printf("0x199 = 0x%x\n\r",test_buf[0]);
	UpdateRegister();
	//D3.2,			ADC2		210MHz
	cdata = 0x00;
	WriteReg(0x19b,&cdata,ONE_BYTE,1);
	ReadReg(0x19b,test_buf,ONE_BYTE,1);
	printf("0x19b = 0x%x\n\r",test_buf[0]);
	UpdateRegister();


	//D4.1,			MGT			125MHz
	cdata = 0X13;//120MHz
	WriteReg(0x19e,&cdata,ONE_BYTE,1);
	ReadReg(0x19e,test_buf,ONE_BYTE,1);
	printf("0x19e = 0x%x\n\r",test_buf[0]);
	UpdateRegister();
	//D4.2,			FPGA		100MHz		0x28		已实现
	cdata = 0x00;
	WriteReg(0x1a0,&cdata,ONE_BYTE,1);
	ReadReg(0x1a0,test_buf,ONE_BYTE,1);
	printf("0x1a0 = 0x%x\n\r",test_buf[0]);
	UpdateRegister();

//	cdata = 0x06;
//	WriteReg(0x018,&cdata,ONE_BYTE,1);
//	ReadReg(0x018,test_buf,ONE_BYTE,1);
//	printf("0x018 = 0x%x\n\r",test_buf[0]);
//	UpdateRegister();
//
//
//	cdata = 0x07;
//	WriteReg(0x018,&cdata,ONE_BYTE,1);
//	ReadReg(0x018,test_buf,ONE_BYTE,1);
//	printf("0x018 = 0x%x\n\r",test_buf[0]);
//	UpdateRegister();

/*
 * 对out0-9的输出状态、输出模式进行配置
 * 下面的配置对着手册查应该是没有问题的，重点是计算上面的分频值
 */
	//****************************
	//out0-5是LVPECL模式
	//****************************

	//关闭out0
	cdata = 0x0a;//查数据手册
	WriteReg(0x0f0,&cdata,ONE_BYTE,1);
	ReadReg(0x0f0,test_buf,ONE_BYTE,1);
	printf("0x0f0 = 0x%x\n\r",test_buf[0]);
	UpdateRegister();

	//关闭out1
	cdata = 0x0a;//查数据手册
	WriteReg(0x0f1,&cdata,ONE_BYTE,1);
	ReadReg(0x0f1,test_buf,ONE_BYTE,1);
	printf("0x0f1 = 0x%x\n\r",test_buf[0]);
	UpdateRegister();

	//关闭out2
	cdata = 0x0a;//查数据手册
	WriteReg(0x0f2,&cdata,ONE_BYTE,1);
	ReadReg(0x0f2,test_buf,ONE_BYTE,1);
	printf("0x0f2 = 0x%x\n\r",test_buf[0]);
	UpdateRegister();

	//关闭out3
	cdata = 0x0a;//查数据手册
	WriteReg(0x0f3,&cdata,ONE_BYTE,1);
	ReadReg(0x0f3,test_buf,ONE_BYTE,1);
	printf("0x0f3 = 0x%x\n\r",test_buf[0]);
	UpdateRegister();

	//关闭out4
	cdata = 0x0a;//查数据手册
	WriteReg(0x0f4,&cdata,ONE_BYTE,1);
	ReadReg(0x0f4,test_buf,ONE_BYTE,1);
	printf("0x0f4 = 0x%x\n\r",test_buf[0]);
	UpdateRegister();

	//关闭out5
	cdata = 0x0a;//查数据手册
	WriteReg(0x0f5,&cdata,ONE_BYTE,1);
	ReadReg(0x0f5,test_buf,ONE_BYTE,1);
	printf("0x0f5 = 0x%x\n\r",test_buf[0]);
	UpdateRegister();

	//****************************
	//out6-9	LVDS/CMOS可选
	//****************************

	//打开out6,LVDS
	cdata = 0xDA;//查数据手册
	WriteReg(0x140,&cdata,ONE_BYTE,1);
	ReadReg(0x140,test_buf,ONE_BYTE,1);
	printf("0x140 = 0x%x\n\r",test_buf[0]);
	UpdateRegister();

	//打开out7,LVDS
	cdata = 0xDA;//查数据手册
	WriteReg(0x141,&cdata,ONE_BYTE,1);
	ReadReg(0x141,test_buf,ONE_BYTE,1);
	printf("0x141 = 0x%x\n\r",test_buf[0]);
	UpdateRegister();

	//关闭out8
	cdata = 0x5A;//查数据手册
	WriteReg(0x142,&cdata,ONE_BYTE,1);
	ReadReg(0x142,test_buf,ONE_BYTE,1);
	printf("0x142 = 0x%x\n\r",test_buf[0]);
	UpdateRegister();

	//关闭out9
	cdata = 0x5A;//查数据手册
	WriteReg(0x143,&cdata,ONE_BYTE,1);
	ReadReg(0x143,test_buf,ONE_BYTE,1);
	printf("0x143 = 0x%x\n\r",test_buf[0]);
	UpdateRegister();

	//拉低片选开始工作
	NSS_L();

    while (1) {
        char cmd[16] = {0};
        xil_printf("Waiting for command:\n\r");

        // 拉低 GPIO（每次循环默认拉低）
        XGpio_DiscreteWrite(&Gpio, GPIO_TRIG_CHANNEL, 0);

        // 接收命令
        scanf("%s", cmd);

        if (strcmp(cmd, "1") == 0) {
            xil_printf("Received '1' command. GPIO high, start read.\n\r");

            // 拉高 GPIO（通知 PL 开始传输）
            XGpio_DiscreteWrite(&Gpio, GPIO_TRIG_CHANNEL, 1);

            // 可选：等待 PL 写入完成（如 sleep 1s）
            sleep(1);

            // 拉低 GPIO，通知结束
            XGpio_DiscreteWrite(&Gpio, GPIO_TRIG_CHANNEL, 0);

            // 刷新缓存，确保读的是 PL 写入的数据
            Xil_DCacheInvalidateRange(READ_START_ADDR, READ_SIZE_BYTES);

            // 从 PL 写入的地址读取数据（2 字节）
            for (u32 addr = READ_START_ADDR; addr < READ_END_ADDR; addr += READ_STEP_BYTES) {
                u16 data = Xil_In16(addr);

//                // 每 256 字节打印一次地址和数据
//                if (((addr - READ_START_ADDR) % 256) == 0) {
                    xil_printf("Addr 0x%08X = 0x%04X\n\r", addr, data);
//                }
            }

            xil_printf("Read complete. GPIO pulled low.\n\r");

        } else {
            xil_printf("Unknown command: %s\n\r", cmd);
        }
    }
    cleanup_platform();
    return 0;
}


