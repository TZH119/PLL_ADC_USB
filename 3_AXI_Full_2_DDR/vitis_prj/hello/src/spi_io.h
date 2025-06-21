/**
 * Copyright (c) 2022-2023��HelloAlpha
 *
 * Change Logs:
 * Date           Author       Notes
 */
#ifndef __SPI_IO_H__
#define __SPI_IO_H__

#include "xgpiops.h"

#ifndef GPIO_DEVICE_ID
#define GPIO_DEVICE_ID		XPAR_XGPIOPS_0_DEVICE_ID
#endif

#define SPI_SCK_PIN             54
#define SPI_MOSI_PIN            57
#define SPI_MISO_PIN            56
#define SPI_NSS_PIN             55

#define GPIO_MODEL_INPUT        0
#define GPIO_MODEL_OUTPUT       1

#define GPIO_OUTPUT_DISABLE     0
#define GPIO_OUTPUT_ENABLE      1

#define GPIO_RESET              0
#define GPIO_SET                1

void MOSI_H(void);
void MOSI_L(void);
void SCK_H(void);
void SCK_L(void);
uint32_t MISO(void);
void NSS_H(void);
void NSS_L(void);
int Gpio_Init(u16 DeviceId);

#endif
