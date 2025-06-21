#include"AD9516.h"
#include "sleep.h"

/********************************************************************************
Function that writes to the AD9516 via the SPI port.
********************************************************************************/
void WriteInstruction(unsigned short RegisterData)
{
	unsigned char i;

	//Write out the ControlWord
	for(i=0; i<16; i++)
	{
		SCK_L();

		if(0x8000 == (RegisterData & 0x8000))
		{
			MOSI_H();	  //Send one to SDIN pin
		}
		else
		{
			MOSI_L();	  //Send zero to SDIN pin
		}

		SCK_H();

		RegisterData <<= 1;	//Rotate data
	}
}

void WriteData(unsigned char *pRegisterData, unsigned char N)
{
	unsigned char i,j;

	//Write out the data
	for(j=0;j<N;j++)
	{
		for(i=0; i<8; i++)
		{
			SCK_L();

			if(0x80 == (pRegisterData[j] & 0x80))
			{
				MOSI_H();	  //Send one to SDIN pin
			}
			else
			{
				MOSI_L();	  //Send zero to SDIN pin
			}

			SCK_H();

		  pRegisterData[j] <<= 1;	//Rotate data
		}
	}
}

/********************************************************************************
Function that read from the AD9516 via the SPI port.
********************************************************************************/
void ReadData(unsigned char  *pRegisterData, unsigned char N)
{
	unsigned char	i= 0,j=0;
	unsigned char	iTemp = 0;

	// SPI start
	for(j=0;j<N;j++)
	{
		for(i=0; i<8; i++)
		{
			SCK_H();

			SCK_L();

			iTemp<<=1;
			iTemp |= MISO();			// P4.4->SDout
		}
		pRegisterData[j] = iTemp;
		iTemp = 0;
	}
}

//WrMode need to use macro(ONE_BYTE,TWO_BYTE...) in Ad9516.h
void WriteReg(unsigned short RegAddr, unsigned char *pData, unsigned short WrMode, unsigned char num)
{
	unsigned short tmp = 0;

	NSS_L();
	tmp = RegAddr | WrMode | WRITE;
	WriteInstruction(tmp);
	WriteData(pData,num);
	NSS_H();
	usleep(10);
}

//RdMode need to use macro(ONE_BYTE,TWO_BYTE...) in Ad9516.h
void ReadReg(unsigned short RegAddr, unsigned char *pData, unsigned short RdMode, unsigned char num)
{
	unsigned short tmp = 0;

	NSS_L(); //clear CS and begin to write address and and read the addressed register
	usleep(1);
	tmp = READ | RdMode | RegAddr;
	WriteInstruction(tmp);
	ReadData(pData,num);
	NSS_H();
	usleep(10);
}

//need to update to take registers effect after writing
void UpdateRegister(void)
{
	unsigned short tmp1;
	unsigned char tmp2;

	NSS_H();
	NSS_L();// clear CS and begin to write instruction	 and data
	usleep(1);
	tmp1 = WRITE | ONE_BYTE |0x232;
	WriteInstruction(tmp1);

	tmp2 = 0x01;
	WriteData(&tmp2,1);
}



