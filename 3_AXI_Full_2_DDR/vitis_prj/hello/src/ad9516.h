/********************************************************************************
 Author              : CAST (China Applications Support Team)

 Date                : 5-24-2011

 File name           : AD9516.h

 Description         : Using ADuC7026 to control AD9516 in software SPI form through GPIO

 Hardware plateform  : ADuC7026 	+ AD9516
********************************************************************************/
//------------------------------------
//functions' prototype
//------------------------------------
#include "xgpiops.h"
#include "spi_io.h"

void WriteInstruction(unsigned short RegisterData);
void WriteData(unsigned char *pRegisterData, unsigned char N);
void ReadData(unsigned char  *pRegisterData, unsigned char N);
void WriteReg(unsigned short RegAddr, unsigned char *pData, unsigned short WrMode, unsigned char num);
void ReadReg(unsigned short RegAddr, unsigned char *pData, unsigned short RdMode, unsigned char num);

void UpdateRegister(void);


//---------------------------------------------------------------
//The format of the  16bit instruction word read as follows
// |R/W|W1|W0|A12=0|A11=0|A10=0|A9|A8|A7|A6|A5|A4|A3|A2|A1|A0|
//---------------------------------------------------------------


//READ OR WRITE
#define READ                      (0x01<<15)
#define WRITE                     (0x00<<15)

//BYTE TRANSFER COUNT
#define ONE_BYTE                   0x00
#define TWO_BYTE                  (0x01<<13)
#define THREE_BYTE                (0x10<<13)
#define STREAMING_MODE            (0x11<<13)
//--------------------------
//REGISTERS' address
//--------------------------

//serial PORT configuration
#define SERIAL_PORT_CONFIGURATION 0x00
#define READ_BACK_CONTROL         0x04


//PLL
#define PFD_CHARGE_PUMP           0x10
#define R_COUNTER_1               0x11
#define R_COUNTER_2               0x12
#define A_COUNTER                 0x13
#define B_COUNTER                 0x14
#define PLL_CONTROL_1             0x16
#define PLL_CONTROL_2             0x17
#define PLL_CONTROL_3             0x18
#define PLL_CONTROL_4             0x19
#define PLL_CONTROL_5             0x1A
#define PLL_CONTROL_6             0x1B
#define PLL_CONTROL_7             0x1C
#define PLL_CONTROL_8             0x1D
#define PLL_CONTROL_9             0x1E
#define PLL_READBACK              0x1F

//Fine Delay Adjust:OUT6 to OUT9
#define OUT6_DELAY_BYPASS         0xA0
#define OUT6_DELAY_FULL_SCALE     0xA1
#define OUT6_DELAY_FRACTION       0xA2

#define OUT7_DELAY_BYPASS         0xA3
#define OUT7_DELAY_FULL_SCALE     0xA4
#define OUT7_DELAY_FRACTION       0xA5

#define OUT8_DELAY_BYPASS         0xA6
#define OUT8_DELAY_FULL_SCALE     0xA7
#define OUT8_DELAY_FRACTION       0xA8

#define OUT9_DELAY_BYPASS         0xA9
#define OUT9_DELAY_FULL_SCALE     0xAA
#define OUT9_DELAY_FRACTION       0xAB

//LVPECL Outputs
#define OUT0                      0xF0
#define OUT1                      0xF1
#define OUT2                      0xF2
#define OUT3                      0xF3
#define OUT4                      0xF4
#define OUT5                      0xF5

//LVDS/COMOS Outputs
#define OUT6                      0x140
#define OUT7                      0x141
#define OUT8                      0x142
#define OUT9                      0x143

//LVDS/CMOS Channel Dividers
#define LVDS_CMOS_DIVIDER_3_1	0x199
#define LVDS_CMOS_DIVIDER_3_2	0x19B
#define LVDS_CMOS_DIVIDER_4_1	0x19E
#define LVDS_CMOS_DIVIDER_4_2	0x1A0

//VCO Divider and CLK Input
#define VCO_DIVIDER               0x1E0
#define INPUT_CLKS                0x1E1
#define POWER_DOWN_SYNC           0x230
#define UPDATE_ALL_REGISTERS      0x232

//function bits's configuration of used REGISTERS
#define SERIAL_DEFAULT            0x18
#define SERIAL_SDO_ACTIVE         0x81


