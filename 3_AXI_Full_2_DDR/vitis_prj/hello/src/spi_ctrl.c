/**
 * Copyright (c) 2022-2023£¬HelloAlpha
 *
 * Change Logs:
 * Date           Author       Notes
 */
#include "spi_ctrl.h"

/* CPOL = 0, CPHA = 0, MSB first */
uint8_t SOFT_SPI_RW_MODE0(uint8_t write_dat)
{
    uint8_t i, read_dat;
    for( i = 0; i < 8; i++ )
    {
        if( write_dat & 0x80 )
            MOSI_H();
        else
            MOSI_L();
        write_dat <<= 1;
        SPI_DELAY(1);
        SCK_H();
        read_dat <<= 1;
        if( MISO() )
            read_dat++;
        SPI_DELAY(1);
        SCK_L();
        SPI_DELAY(1);
    }
    return read_dat;
}

/* CPOL=0£¬CPHA=1, MSB first */
uint8_t SOFT_SPI_RW_MODE1(uint8_t write_dat)
{
    uint8_t i, read_dat;

    for( i = 0; i < 8; i++ )
    {
        SCK_H();
        if( write_dat & 0x80 )
            MOSI_H();
        else
            MOSI_L();
        write_dat <<= 1;
        SPI_DELAY(100);
        SCK_L();
        read_dat <<= 1;
        if(MISO())
            read_dat++;
        SPI_DELAY(100);
	}
    return read_dat;
}

/* CPOL=1£¬CPHA=0, MSB first */
uint8_t SOFT_SPI_RW_MODE2(uint8_t write_dat)
{
    uint8_t i, read_dat;

    for( i = 0; i < 8; i++ )
    {
        if( write_dat & 0x80 )
            MOSI_H();
        else
            MOSI_L();
        write_dat <<= 1;
        SPI_DELAY(1);
        SCK_L();
        read_dat <<= 1;
        if(MISO())
            read_dat++;
        SPI_DELAY(1);
        SCK_H();
	}
	return read_dat;
}

/* CPOL = 1, CPHA = 1, MSB first */
uint8_t SOFT_SPI_RW_MODE3( uint8_t write_dat )
{
    uint8_t i, read_dat;
    for( i = 0; i < 8; i++ )
    {
        SCK_L();
        if( write_dat & 0x80 )
            MOSI_H();
        else
            MOSI_L();
        write_dat <<= 1;
        SPI_DELAY(1);
        SCK_H();
        read_dat <<= 1;
        if( MISO() )
            read_dat++;
        SPI_DELAY(1);
    }
    return read_dat;
}

