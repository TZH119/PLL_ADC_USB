/**
 * Copyright (c) 2022-2023，HelloAlpha
 *
 * Change Logs:
 * Date           Author       Notes
 */
#ifndef __SPI_CTRL_H__
#define __SPI_CTRL_H__

#include "spi_io.h"

#include "sleep.h"

#define SPI_DELAY(...)	usleep(__VA_ARGS__)

#define SPI_START_COMMUNICATION     NSS_L()
#define SPI_STOP_COMMUNICATION      NSS_H()

/**
 * CPOL 配置 SPI 总线的极性
 * CPHA 配置 SPI 总线的相位
 *
 * 模式0：CPOL=0，CPHA =0  MSB first
 *      SCK空闲为低电平，数据在SCK的上升沿被采样(提取数据)
 * 模式1：CPOL=0，CPHA =1  MSB first
 *      SCK空闲为低电平，数据在SCK的下降沿被采样(提取数据)
 * 模式2：CPOL=1，CPHA =0  MSB first
 *      SCK空闲为高电平，数据在SCK的下降沿被采样(提取数据)
 * 模式3：CPOL=1，CPHA =1  MSB first
 *      SCK空闲为高电平，数据在SCK的上升沿被采样(提取数据)
 */

/* CPOL = 0, CPHA = 0,  MSB first*/
uint8_t SOFT_SPI_RW_MODE0(uint8_t write_dat);
/* CPOL=0，CPHA=1, MSB first */
uint8_t SOFT_SPI_RW_MODE1(uint8_t write_dat);
/* CPOL=1，CPHA=0, MSB first */
uint8_t SOFT_SPI_RW_MODE2(uint8_t write_dat);
/* CPOL = 1, CPHA = 1, MSB first */
uint8_t SOFT_SPI_RW_MODE3( uint8_t write_dat );

#endif
