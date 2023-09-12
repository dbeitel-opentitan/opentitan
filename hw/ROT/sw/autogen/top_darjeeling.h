// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#ifndef OPENTITAN_SW_AUTOGEN_TOP_DARJEELING_H_
#define OPENTITAN_SW_AUTOGEN_TOP_DARJEELING_H_

/**
 * @file
 * @brief Top-specific Definitions
 *
 * This file contains preprocessor and type definitions for use within the
 * device C/C++ codebase.
 *
 * These definitions are for information that depends on the top-specific chip
 * configuration, which includes:
 * - Device Memory Information (for Peripherals and Memory)
 * - PLIC Interrupt ID Names and Source Mappings
 * - Alert ID Names and Source Mappings
 * - Pinmux Pin/Select Names
 * - Power Manager Wakeups
 */

#ifdef __cplusplus
extern "C" {
#endif

/**
 * Peripheral base address for uart0 in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_UART0_BASE_ADDR 0x30010000u

/**
 * Peripheral size for uart0 in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_UART0_BASE_ADDR and
 * `TOP_DARJEELING_UART0_BASE_ADDR + TOP_DARJEELING_UART0_SIZE_BYTES`.
 */
#define TOP_DARJEELING_UART0_SIZE_BYTES 0x40u

/**
 * Peripheral base address for gpio in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_GPIO_BASE_ADDR 0x30000000u

/**
 * Peripheral size for gpio in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_GPIO_BASE_ADDR and
 * `TOP_DARJEELING_GPIO_BASE_ADDR + TOP_DARJEELING_GPIO_SIZE_BYTES`.
 */
#define TOP_DARJEELING_GPIO_SIZE_BYTES 0x40u

/**
 * Peripheral base address for spi_device in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_SPI_DEVICE_BASE_ADDR 0x30310000u

/**
 * Peripheral size for spi_device in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_SPI_DEVICE_BASE_ADDR and
 * `TOP_DARJEELING_SPI_DEVICE_BASE_ADDR + TOP_DARJEELING_SPI_DEVICE_SIZE_BYTES`.
 */
#define TOP_DARJEELING_SPI_DEVICE_SIZE_BYTES 0x2000u

/**
 * Peripheral base address for i2c0 in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_I2C0_BASE_ADDR 0x30080000u

/**
 * Peripheral size for i2c0 in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_I2C0_BASE_ADDR and
 * `TOP_DARJEELING_I2C0_BASE_ADDR + TOP_DARJEELING_I2C0_SIZE_BYTES`.
 */
#define TOP_DARJEELING_I2C0_SIZE_BYTES 0x80u

/**
 * Peripheral base address for rv_timer in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_RV_TIMER_BASE_ADDR 0x30100000u

/**
 * Peripheral size for rv_timer in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_RV_TIMER_BASE_ADDR and
 * `TOP_DARJEELING_RV_TIMER_BASE_ADDR + TOP_DARJEELING_RV_TIMER_SIZE_BYTES`.
 */
#define TOP_DARJEELING_RV_TIMER_SIZE_BYTES 0x200u

/**
 * Peripheral base address for core device on otp_ctrl in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_OTP_CTRL_CORE_BASE_ADDR 0x30130000u

/**
 * Peripheral size for core device on otp_ctrl in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_OTP_CTRL_CORE_BASE_ADDR and
 * `TOP_DARJEELING_OTP_CTRL_CORE_BASE_ADDR + TOP_DARJEELING_OTP_CTRL_CORE_SIZE_BYTES`.
 */
#define TOP_DARJEELING_OTP_CTRL_CORE_SIZE_BYTES 0x2000u

/**
 * Peripheral base address for prim device on otp_ctrl in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_OTP_CTRL_PRIM_BASE_ADDR 0x30134000u

/**
 * Peripheral size for prim device on otp_ctrl in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_OTP_CTRL_PRIM_BASE_ADDR and
 * `TOP_DARJEELING_OTP_CTRL_PRIM_BASE_ADDR + TOP_DARJEELING_OTP_CTRL_PRIM_SIZE_BYTES`.
 */
#define TOP_DARJEELING_OTP_CTRL_PRIM_SIZE_BYTES 0x20u

/**
 * Peripheral base address for lc_ctrl in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_LC_CTRL_BASE_ADDR 0x30140000u

/**
 * Peripheral size for lc_ctrl in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_LC_CTRL_BASE_ADDR and
 * `TOP_DARJEELING_LC_CTRL_BASE_ADDR + TOP_DARJEELING_LC_CTRL_SIZE_BYTES`.
 */
#define TOP_DARJEELING_LC_CTRL_SIZE_BYTES 0x100u

/**
 * Peripheral base address for alert_handler in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_ALERT_HANDLER_BASE_ADDR 0x30150000u

/**
 * Peripheral size for alert_handler in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_ALERT_HANDLER_BASE_ADDR and
 * `TOP_DARJEELING_ALERT_HANDLER_BASE_ADDR + TOP_DARJEELING_ALERT_HANDLER_SIZE_BYTES`.
 */
#define TOP_DARJEELING_ALERT_HANDLER_SIZE_BYTES 0x800u

/**
 * Peripheral base address for spi_host0 in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_SPI_HOST0_BASE_ADDR 0x30300000u

/**
 * Peripheral size for spi_host0 in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_SPI_HOST0_BASE_ADDR and
 * `TOP_DARJEELING_SPI_HOST0_BASE_ADDR + TOP_DARJEELING_SPI_HOST0_SIZE_BYTES`.
 */
#define TOP_DARJEELING_SPI_HOST0_SIZE_BYTES 0x40u

/**
 * Peripheral base address for pwrmgr_aon in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_PWRMGR_AON_BASE_ADDR 0x30400000u

/**
 * Peripheral size for pwrmgr_aon in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_PWRMGR_AON_BASE_ADDR and
 * `TOP_DARJEELING_PWRMGR_AON_BASE_ADDR + TOP_DARJEELING_PWRMGR_AON_SIZE_BYTES`.
 */
#define TOP_DARJEELING_PWRMGR_AON_SIZE_BYTES 0x80u

/**
 * Peripheral base address for rstmgr_aon in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_RSTMGR_AON_BASE_ADDR 0x30410000u

/**
 * Peripheral size for rstmgr_aon in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_RSTMGR_AON_BASE_ADDR and
 * `TOP_DARJEELING_RSTMGR_AON_BASE_ADDR + TOP_DARJEELING_RSTMGR_AON_SIZE_BYTES`.
 */
#define TOP_DARJEELING_RSTMGR_AON_SIZE_BYTES 0x80u

/**
 * Peripheral base address for clkmgr_aon in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_CLKMGR_AON_BASE_ADDR 0x30420000u

/**
 * Peripheral size for clkmgr_aon in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_CLKMGR_AON_BASE_ADDR and
 * `TOP_DARJEELING_CLKMGR_AON_BASE_ADDR + TOP_DARJEELING_CLKMGR_AON_SIZE_BYTES`.
 */
#define TOP_DARJEELING_CLKMGR_AON_SIZE_BYTES 0x80u

/**
 * Peripheral base address for pinmux_aon in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_PINMUX_AON_BASE_ADDR 0x30460000u

/**
 * Peripheral size for pinmux_aon in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_PINMUX_AON_BASE_ADDR and
 * `TOP_DARJEELING_PINMUX_AON_BASE_ADDR + TOP_DARJEELING_PINMUX_AON_SIZE_BYTES`.
 */
#define TOP_DARJEELING_PINMUX_AON_SIZE_BYTES 0x400u

/**
 * Peripheral base address for aon_timer_aon in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_AON_TIMER_AON_BASE_ADDR 0x30470000u

/**
 * Peripheral size for aon_timer_aon in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_AON_TIMER_AON_BASE_ADDR and
 * `TOP_DARJEELING_AON_TIMER_AON_BASE_ADDR + TOP_DARJEELING_AON_TIMER_AON_SIZE_BYTES`.
 */
#define TOP_DARJEELING_AON_TIMER_AON_SIZE_BYTES 0x40u

/**
 * Peripheral base address for ast in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_AST_BASE_ADDR 0x30480000u

/**
 * Peripheral size for ast in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_AST_BASE_ADDR and
 * `TOP_DARJEELING_AST_BASE_ADDR + TOP_DARJEELING_AST_SIZE_BYTES`.
 */
#define TOP_DARJEELING_AST_SIZE_BYTES 0x400u

/**
 * Peripheral base address for regs device on sram_ctrl_ret_aon in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_SRAM_CTRL_RET_AON_REGS_BASE_ADDR 0x30500000u

/**
 * Peripheral size for regs device on sram_ctrl_ret_aon in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_SRAM_CTRL_RET_AON_REGS_BASE_ADDR and
 * `TOP_DARJEELING_SRAM_CTRL_RET_AON_REGS_BASE_ADDR + TOP_DARJEELING_SRAM_CTRL_RET_AON_REGS_SIZE_BYTES`.
 */
#define TOP_DARJEELING_SRAM_CTRL_RET_AON_REGS_SIZE_BYTES 0x20u

/**
 * Peripheral base address for ram device on sram_ctrl_ret_aon in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_SRAM_CTRL_RET_AON_RAM_BASE_ADDR 0x40600000u

/**
 * Peripheral size for ram device on sram_ctrl_ret_aon in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_SRAM_CTRL_RET_AON_RAM_BASE_ADDR and
 * `TOP_DARJEELING_SRAM_CTRL_RET_AON_RAM_BASE_ADDR + TOP_DARJEELING_SRAM_CTRL_RET_AON_RAM_SIZE_BYTES`.
 */
#define TOP_DARJEELING_SRAM_CTRL_RET_AON_RAM_SIZE_BYTES 0x1000u

/**
 * Peripheral base address for regs device on rv_dm in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_RV_DM_REGS_BASE_ADDR 0x21200000u

/**
 * Peripheral size for regs device on rv_dm in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_RV_DM_REGS_BASE_ADDR and
 * `TOP_DARJEELING_RV_DM_REGS_BASE_ADDR + TOP_DARJEELING_RV_DM_REGS_SIZE_BYTES`.
 */
#define TOP_DARJEELING_RV_DM_REGS_SIZE_BYTES 0x4u

/**
 * Peripheral base address for mem device on rv_dm in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_RV_DM_MEM_BASE_ADDR 0x40000u

/**
 * Peripheral size for mem device on rv_dm in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_RV_DM_MEM_BASE_ADDR and
 * `TOP_DARJEELING_RV_DM_MEM_BASE_ADDR + TOP_DARJEELING_RV_DM_MEM_SIZE_BYTES`.
 */
#define TOP_DARJEELING_RV_DM_MEM_SIZE_BYTES 0x1000u

/**
 * Peripheral base address for rv_plic in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_RV_PLIC_BASE_ADDR 0x28000000u

/**
 * Peripheral size for rv_plic in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_RV_PLIC_BASE_ADDR and
 * `TOP_DARJEELING_RV_PLIC_BASE_ADDR + TOP_DARJEELING_RV_PLIC_SIZE_BYTES`.
 */
#define TOP_DARJEELING_RV_PLIC_SIZE_BYTES 0x8000000u

/**
 * Peripheral base address for aes in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_AES_BASE_ADDR 0x21100000u

/**
 * Peripheral size for aes in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_AES_BASE_ADDR and
 * `TOP_DARJEELING_AES_BASE_ADDR + TOP_DARJEELING_AES_SIZE_BYTES`.
 */
#define TOP_DARJEELING_AES_SIZE_BYTES 0x100u

/**
 * Peripheral base address for hmac in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_HMAC_BASE_ADDR 0x21110000u

/**
 * Peripheral size for hmac in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_HMAC_BASE_ADDR and
 * `TOP_DARJEELING_HMAC_BASE_ADDR + TOP_DARJEELING_HMAC_SIZE_BYTES`.
 */
#define TOP_DARJEELING_HMAC_SIZE_BYTES 0x1000u

/**
 * Peripheral base address for kmac in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_KMAC_BASE_ADDR 0x21120000u

/**
 * Peripheral size for kmac in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_KMAC_BASE_ADDR and
 * `TOP_DARJEELING_KMAC_BASE_ADDR + TOP_DARJEELING_KMAC_SIZE_BYTES`.
 */
#define TOP_DARJEELING_KMAC_SIZE_BYTES 0x1000u

/**
 * Peripheral base address for otbn in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_OTBN_BASE_ADDR 0x21130000u

/**
 * Peripheral size for otbn in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_OTBN_BASE_ADDR and
 * `TOP_DARJEELING_OTBN_BASE_ADDR + TOP_DARJEELING_OTBN_SIZE_BYTES`.
 */
#define TOP_DARJEELING_OTBN_SIZE_BYTES 0x10000u

/**
 * Peripheral base address for keymgr in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_KEYMGR_BASE_ADDR 0x21140000u

/**
 * Peripheral size for keymgr in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_KEYMGR_BASE_ADDR and
 * `TOP_DARJEELING_KEYMGR_BASE_ADDR + TOP_DARJEELING_KEYMGR_SIZE_BYTES`.
 */
#define TOP_DARJEELING_KEYMGR_SIZE_BYTES 0x100u

/**
 * Peripheral base address for csrng in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_CSRNG_BASE_ADDR 0x21150000u

/**
 * Peripheral size for csrng in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_CSRNG_BASE_ADDR and
 * `TOP_DARJEELING_CSRNG_BASE_ADDR + TOP_DARJEELING_CSRNG_SIZE_BYTES`.
 */
#define TOP_DARJEELING_CSRNG_SIZE_BYTES 0x80u

/**
 * Peripheral base address for entropy_src in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_ENTROPY_SRC_BASE_ADDR 0x21160000u

/**
 * Peripheral size for entropy_src in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_ENTROPY_SRC_BASE_ADDR and
 * `TOP_DARJEELING_ENTROPY_SRC_BASE_ADDR + TOP_DARJEELING_ENTROPY_SRC_SIZE_BYTES`.
 */
#define TOP_DARJEELING_ENTROPY_SRC_SIZE_BYTES 0x100u

/**
 * Peripheral base address for edn0 in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_EDN0_BASE_ADDR 0x21170000u

/**
 * Peripheral size for edn0 in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_EDN0_BASE_ADDR and
 * `TOP_DARJEELING_EDN0_BASE_ADDR + TOP_DARJEELING_EDN0_SIZE_BYTES`.
 */
#define TOP_DARJEELING_EDN0_SIZE_BYTES 0x80u

/**
 * Peripheral base address for edn1 in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_EDN1_BASE_ADDR 0x21180000u

/**
 * Peripheral size for edn1 in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_EDN1_BASE_ADDR and
 * `TOP_DARJEELING_EDN1_BASE_ADDR + TOP_DARJEELING_EDN1_SIZE_BYTES`.
 */
#define TOP_DARJEELING_EDN1_SIZE_BYTES 0x80u

/**
 * Peripheral base address for regs device on sram_ctrl_main in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_SRAM_CTRL_MAIN_REGS_BASE_ADDR 0x211C0000u

/**
 * Peripheral size for regs device on sram_ctrl_main in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_SRAM_CTRL_MAIN_REGS_BASE_ADDR and
 * `TOP_DARJEELING_SRAM_CTRL_MAIN_REGS_BASE_ADDR + TOP_DARJEELING_SRAM_CTRL_MAIN_REGS_SIZE_BYTES`.
 */
#define TOP_DARJEELING_SRAM_CTRL_MAIN_REGS_SIZE_BYTES 0x20u

/**
 * Peripheral base address for ram device on sram_ctrl_main in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_SRAM_CTRL_MAIN_RAM_BASE_ADDR 0x10000000u

/**
 * Peripheral size for ram device on sram_ctrl_main in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_SRAM_CTRL_MAIN_RAM_BASE_ADDR and
 * `TOP_DARJEELING_SRAM_CTRL_MAIN_RAM_BASE_ADDR + TOP_DARJEELING_SRAM_CTRL_MAIN_RAM_SIZE_BYTES`.
 */
#define TOP_DARJEELING_SRAM_CTRL_MAIN_RAM_SIZE_BYTES 0x10000u

/**
 * Peripheral base address for regs device on sram_ctrl_mbox in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_SRAM_CTRL_MBOX_REGS_BASE_ADDR 0x211D0000u

/**
 * Peripheral size for regs device on sram_ctrl_mbox in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_SRAM_CTRL_MBOX_REGS_BASE_ADDR and
 * `TOP_DARJEELING_SRAM_CTRL_MBOX_REGS_BASE_ADDR + TOP_DARJEELING_SRAM_CTRL_MBOX_REGS_SIZE_BYTES`.
 */
#define TOP_DARJEELING_SRAM_CTRL_MBOX_REGS_SIZE_BYTES 0x20u

/**
 * Peripheral base address for ram device on sram_ctrl_mbox in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_SRAM_CTRL_MBOX_RAM_BASE_ADDR 0x11000000u

/**
 * Peripheral size for ram device on sram_ctrl_mbox in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_SRAM_CTRL_MBOX_RAM_BASE_ADDR and
 * `TOP_DARJEELING_SRAM_CTRL_MBOX_RAM_BASE_ADDR + TOP_DARJEELING_SRAM_CTRL_MBOX_RAM_SIZE_BYTES`.
 */
#define TOP_DARJEELING_SRAM_CTRL_MBOX_RAM_SIZE_BYTES 0x1000u

/**
 * Peripheral base address for regs device on rom_ctrl0 in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_ROM_CTRL0_REGS_BASE_ADDR 0x211E0000u

/**
 * Peripheral size for regs device on rom_ctrl0 in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_ROM_CTRL0_REGS_BASE_ADDR and
 * `TOP_DARJEELING_ROM_CTRL0_REGS_BASE_ADDR + TOP_DARJEELING_ROM_CTRL0_REGS_SIZE_BYTES`.
 */
#define TOP_DARJEELING_ROM_CTRL0_REGS_SIZE_BYTES 0x80u

/**
 * Peripheral base address for rom device on rom_ctrl0 in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_ROM_CTRL0_ROM_BASE_ADDR 0x0u

/**
 * Peripheral size for rom device on rom_ctrl0 in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_ROM_CTRL0_ROM_BASE_ADDR and
 * `TOP_DARJEELING_ROM_CTRL0_ROM_BASE_ADDR + TOP_DARJEELING_ROM_CTRL0_ROM_SIZE_BYTES`.
 */
#define TOP_DARJEELING_ROM_CTRL0_ROM_SIZE_BYTES 0x8000u

/**
 * Peripheral base address for regs device on rom_ctrl1 in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_ROM_CTRL1_REGS_BASE_ADDR 0x211E1000u

/**
 * Peripheral size for regs device on rom_ctrl1 in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_ROM_CTRL1_REGS_BASE_ADDR and
 * `TOP_DARJEELING_ROM_CTRL1_REGS_BASE_ADDR + TOP_DARJEELING_ROM_CTRL1_REGS_SIZE_BYTES`.
 */
#define TOP_DARJEELING_ROM_CTRL1_REGS_SIZE_BYTES 0x80u

/**
 * Peripheral base address for rom device on rom_ctrl1 in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_ROM_CTRL1_ROM_BASE_ADDR 0x10000u

/**
 * Peripheral size for rom device on rom_ctrl1 in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_ROM_CTRL1_ROM_BASE_ADDR and
 * `TOP_DARJEELING_ROM_CTRL1_ROM_BASE_ADDR + TOP_DARJEELING_ROM_CTRL1_ROM_SIZE_BYTES`.
 */
#define TOP_DARJEELING_ROM_CTRL1_ROM_SIZE_BYTES 0x10000u

/**
 * Peripheral base address for cfg device on rv_core_ibex in top darjeeling.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
#define TOP_DARJEELING_RV_CORE_IBEX_CFG_BASE_ADDR 0x211F0000u

/**
 * Peripheral size for cfg device on rv_core_ibex in top darjeeling.
 *
 * This is the size (in bytes) of the peripheral's reserved memory area. All
 * memory-mapped registers associated with this peripheral should have an
 * address between #TOP_DARJEELING_RV_CORE_IBEX_CFG_BASE_ADDR and
 * `TOP_DARJEELING_RV_CORE_IBEX_CFG_BASE_ADDR + TOP_DARJEELING_RV_CORE_IBEX_CFG_SIZE_BYTES`.
 */
#define TOP_DARJEELING_RV_CORE_IBEX_CFG_SIZE_BYTES 0x800u


/**
 * Memory base address for ram_ret_aon in top darjeeling.
 */
#define TOP_DARJEELING_RAM_RET_AON_BASE_ADDR 0x40600000u

/**
 * Memory size for ram_ret_aon in top darjeeling.
 */
#define TOP_DARJEELING_RAM_RET_AON_SIZE_BYTES 0x1000u

/**
 * Memory base address for ram_main in top darjeeling.
 */
#define TOP_DARJEELING_RAM_MAIN_BASE_ADDR 0x10000000u

/**
 * Memory size for ram_main in top darjeeling.
 */
#define TOP_DARJEELING_RAM_MAIN_SIZE_BYTES 0x10000u

/**
 * Memory base address for ram_mbox in top darjeeling.
 */
#define TOP_DARJEELING_RAM_MBOX_BASE_ADDR 0x11000000u

/**
 * Memory size for ram_mbox in top darjeeling.
 */
#define TOP_DARJEELING_RAM_MBOX_SIZE_BYTES 0x1000u

/**
 * Memory base address for rom0 in top darjeeling.
 */
#define TOP_DARJEELING_ROM0_BASE_ADDR 0x0u

/**
 * Memory size for rom0 in top darjeeling.
 */
#define TOP_DARJEELING_ROM0_SIZE_BYTES 0x8000u

/**
 * Memory base address for rom1 in top darjeeling.
 */
#define TOP_DARJEELING_ROM1_BASE_ADDR 0x10000u

/**
 * Memory size for rom1 in top darjeeling.
 */
#define TOP_DARJEELING_ROM1_SIZE_BYTES 0x10000u


/**
 * PLIC Interrupt Source Peripheral.
 *
 * Enumeration used to determine which peripheral asserted the corresponding
 * interrupt.
 */
typedef enum top_darjeeling_plic_peripheral {
  kTopDarjeelingPlicPeripheralUnknown = 0, /**< Unknown Peripheral */
  kTopDarjeelingPlicPeripheralUart0 = 1, /**< uart0 */
  kTopDarjeelingPlicPeripheralGpio = 2, /**< gpio */
  kTopDarjeelingPlicPeripheralSpiDevice = 3, /**< spi_device */
  kTopDarjeelingPlicPeripheralI2c0 = 4, /**< i2c0 */
  kTopDarjeelingPlicPeripheralRvTimer = 5, /**< rv_timer */
  kTopDarjeelingPlicPeripheralOtpCtrl = 6, /**< otp_ctrl */
  kTopDarjeelingPlicPeripheralAlertHandler = 7, /**< alert_handler */
  kTopDarjeelingPlicPeripheralSpiHost0 = 8, /**< spi_host0 */
  kTopDarjeelingPlicPeripheralPwrmgrAon = 9, /**< pwrmgr_aon */
  kTopDarjeelingPlicPeripheralAonTimerAon = 10, /**< aon_timer_aon */
  kTopDarjeelingPlicPeripheralHmac = 11, /**< hmac */
  kTopDarjeelingPlicPeripheralKmac = 12, /**< kmac */
  kTopDarjeelingPlicPeripheralOtbn = 13, /**< otbn */
  kTopDarjeelingPlicPeripheralKeymgr = 14, /**< keymgr */
  kTopDarjeelingPlicPeripheralCsrng = 15, /**< csrng */
  kTopDarjeelingPlicPeripheralEntropySrc = 16, /**< entropy_src */
  kTopDarjeelingPlicPeripheralEdn0 = 17, /**< edn0 */
  kTopDarjeelingPlicPeripheralEdn1 = 18, /**< edn1 */
  kTopDarjeelingPlicPeripheralLast = 18, /**< \internal Final PLIC peripheral */
} top_darjeeling_plic_peripheral_t;

/**
 * PLIC Interrupt Source.
 *
 * Enumeration of all PLIC interrupt sources. The interrupt sources belonging to
 * the same peripheral are guaranteed to be consecutive.
 */
typedef enum top_darjeeling_plic_irq_id {
  kTopDarjeelingPlicIrqIdNone = 0, /**< No Interrupt */
  kTopDarjeelingPlicIrqIdUart0TxWatermark = 1, /**< uart0_tx_watermark */
  kTopDarjeelingPlicIrqIdUart0RxWatermark = 2, /**< uart0_rx_watermark */
  kTopDarjeelingPlicIrqIdUart0TxEmpty = 3, /**< uart0_tx_empty */
  kTopDarjeelingPlicIrqIdUart0RxOverflow = 4, /**< uart0_rx_overflow */
  kTopDarjeelingPlicIrqIdUart0RxFrameErr = 5, /**< uart0_rx_frame_err */
  kTopDarjeelingPlicIrqIdUart0RxBreakErr = 6, /**< uart0_rx_break_err */
  kTopDarjeelingPlicIrqIdUart0RxTimeout = 7, /**< uart0_rx_timeout */
  kTopDarjeelingPlicIrqIdUart0RxParityErr = 8, /**< uart0_rx_parity_err */
  kTopDarjeelingPlicIrqIdGpioGpio0 = 9, /**< gpio_gpio 0 */
  kTopDarjeelingPlicIrqIdGpioGpio1 = 10, /**< gpio_gpio 1 */
  kTopDarjeelingPlicIrqIdGpioGpio2 = 11, /**< gpio_gpio 2 */
  kTopDarjeelingPlicIrqIdGpioGpio3 = 12, /**< gpio_gpio 3 */
  kTopDarjeelingPlicIrqIdGpioGpio4 = 13, /**< gpio_gpio 4 */
  kTopDarjeelingPlicIrqIdGpioGpio5 = 14, /**< gpio_gpio 5 */
  kTopDarjeelingPlicIrqIdGpioGpio6 = 15, /**< gpio_gpio 6 */
  kTopDarjeelingPlicIrqIdGpioGpio7 = 16, /**< gpio_gpio 7 */
  kTopDarjeelingPlicIrqIdGpioGpio8 = 17, /**< gpio_gpio 8 */
  kTopDarjeelingPlicIrqIdGpioGpio9 = 18, /**< gpio_gpio 9 */
  kTopDarjeelingPlicIrqIdGpioGpio10 = 19, /**< gpio_gpio 10 */
  kTopDarjeelingPlicIrqIdGpioGpio11 = 20, /**< gpio_gpio 11 */
  kTopDarjeelingPlicIrqIdGpioGpio12 = 21, /**< gpio_gpio 12 */
  kTopDarjeelingPlicIrqIdGpioGpio13 = 22, /**< gpio_gpio 13 */
  kTopDarjeelingPlicIrqIdGpioGpio14 = 23, /**< gpio_gpio 14 */
  kTopDarjeelingPlicIrqIdGpioGpio15 = 24, /**< gpio_gpio 15 */
  kTopDarjeelingPlicIrqIdGpioGpio16 = 25, /**< gpio_gpio 16 */
  kTopDarjeelingPlicIrqIdGpioGpio17 = 26, /**< gpio_gpio 17 */
  kTopDarjeelingPlicIrqIdGpioGpio18 = 27, /**< gpio_gpio 18 */
  kTopDarjeelingPlicIrqIdGpioGpio19 = 28, /**< gpio_gpio 19 */
  kTopDarjeelingPlicIrqIdGpioGpio20 = 29, /**< gpio_gpio 20 */
  kTopDarjeelingPlicIrqIdGpioGpio21 = 30, /**< gpio_gpio 21 */
  kTopDarjeelingPlicIrqIdGpioGpio22 = 31, /**< gpio_gpio 22 */
  kTopDarjeelingPlicIrqIdGpioGpio23 = 32, /**< gpio_gpio 23 */
  kTopDarjeelingPlicIrqIdGpioGpio24 = 33, /**< gpio_gpio 24 */
  kTopDarjeelingPlicIrqIdGpioGpio25 = 34, /**< gpio_gpio 25 */
  kTopDarjeelingPlicIrqIdGpioGpio26 = 35, /**< gpio_gpio 26 */
  kTopDarjeelingPlicIrqIdGpioGpio27 = 36, /**< gpio_gpio 27 */
  kTopDarjeelingPlicIrqIdGpioGpio28 = 37, /**< gpio_gpio 28 */
  kTopDarjeelingPlicIrqIdGpioGpio29 = 38, /**< gpio_gpio 29 */
  kTopDarjeelingPlicIrqIdGpioGpio30 = 39, /**< gpio_gpio 30 */
  kTopDarjeelingPlicIrqIdGpioGpio31 = 40, /**< gpio_gpio 31 */
  kTopDarjeelingPlicIrqIdSpiDeviceGenericRxFull = 41, /**< spi_device_generic_rx_full */
  kTopDarjeelingPlicIrqIdSpiDeviceGenericRxWatermark = 42, /**< spi_device_generic_rx_watermark */
  kTopDarjeelingPlicIrqIdSpiDeviceGenericTxWatermark = 43, /**< spi_device_generic_tx_watermark */
  kTopDarjeelingPlicIrqIdSpiDeviceGenericRxError = 44, /**< spi_device_generic_rx_error */
  kTopDarjeelingPlicIrqIdSpiDeviceGenericRxOverflow = 45, /**< spi_device_generic_rx_overflow */
  kTopDarjeelingPlicIrqIdSpiDeviceGenericTxUnderflow = 46, /**< spi_device_generic_tx_underflow */
  kTopDarjeelingPlicIrqIdSpiDeviceUploadCmdfifoNotEmpty = 47, /**< spi_device_upload_cmdfifo_not_empty */
  kTopDarjeelingPlicIrqIdSpiDeviceUploadPayloadNotEmpty = 48, /**< spi_device_upload_payload_not_empty */
  kTopDarjeelingPlicIrqIdSpiDeviceUploadPayloadOverflow = 49, /**< spi_device_upload_payload_overflow */
  kTopDarjeelingPlicIrqIdSpiDeviceReadbufWatermark = 50, /**< spi_device_readbuf_watermark */
  kTopDarjeelingPlicIrqIdSpiDeviceReadbufFlip = 51, /**< spi_device_readbuf_flip */
  kTopDarjeelingPlicIrqIdSpiDeviceTpmHeaderNotEmpty = 52, /**< spi_device_tpm_header_not_empty */
  kTopDarjeelingPlicIrqIdI2c0FmtThreshold = 53, /**< i2c0_fmt_threshold */
  kTopDarjeelingPlicIrqIdI2c0RxThreshold = 54, /**< i2c0_rx_threshold */
  kTopDarjeelingPlicIrqIdI2c0FmtOverflow = 55, /**< i2c0_fmt_overflow */
  kTopDarjeelingPlicIrqIdI2c0RxOverflow = 56, /**< i2c0_rx_overflow */
  kTopDarjeelingPlicIrqIdI2c0Nak = 57, /**< i2c0_nak */
  kTopDarjeelingPlicIrqIdI2c0SclInterference = 58, /**< i2c0_scl_interference */
  kTopDarjeelingPlicIrqIdI2c0SdaInterference = 59, /**< i2c0_sda_interference */
  kTopDarjeelingPlicIrqIdI2c0StretchTimeout = 60, /**< i2c0_stretch_timeout */
  kTopDarjeelingPlicIrqIdI2c0SdaUnstable = 61, /**< i2c0_sda_unstable */
  kTopDarjeelingPlicIrqIdI2c0CmdComplete = 62, /**< i2c0_cmd_complete */
  kTopDarjeelingPlicIrqIdI2c0TxStretch = 63, /**< i2c0_tx_stretch */
  kTopDarjeelingPlicIrqIdI2c0TxOverflow = 64, /**< i2c0_tx_overflow */
  kTopDarjeelingPlicIrqIdI2c0AcqFull = 65, /**< i2c0_acq_full */
  kTopDarjeelingPlicIrqIdI2c0UnexpStop = 66, /**< i2c0_unexp_stop */
  kTopDarjeelingPlicIrqIdI2c0HostTimeout = 67, /**< i2c0_host_timeout */
  kTopDarjeelingPlicIrqIdRvTimerTimerExpiredHart0Timer0 = 68, /**< rv_timer_timer_expired_hart0_timer0 */
  kTopDarjeelingPlicIrqIdOtpCtrlOtpOperationDone = 69, /**< otp_ctrl_otp_operation_done */
  kTopDarjeelingPlicIrqIdOtpCtrlOtpError = 70, /**< otp_ctrl_otp_error */
  kTopDarjeelingPlicIrqIdAlertHandlerClassa = 71, /**< alert_handler_classa */
  kTopDarjeelingPlicIrqIdAlertHandlerClassb = 72, /**< alert_handler_classb */
  kTopDarjeelingPlicIrqIdAlertHandlerClassc = 73, /**< alert_handler_classc */
  kTopDarjeelingPlicIrqIdAlertHandlerClassd = 74, /**< alert_handler_classd */
  kTopDarjeelingPlicIrqIdSpiHost0Error = 75, /**< spi_host0_error */
  kTopDarjeelingPlicIrqIdSpiHost0SpiEvent = 76, /**< spi_host0_spi_event */
  kTopDarjeelingPlicIrqIdPwrmgrAonWakeup = 77, /**< pwrmgr_aon_wakeup */
  kTopDarjeelingPlicIrqIdAonTimerAonWkupTimerExpired = 78, /**< aon_timer_aon_wkup_timer_expired */
  kTopDarjeelingPlicIrqIdAonTimerAonWdogTimerBark = 79, /**< aon_timer_aon_wdog_timer_bark */
  kTopDarjeelingPlicIrqIdHmacHmacDone = 80, /**< hmac_hmac_done */
  kTopDarjeelingPlicIrqIdHmacFifoEmpty = 81, /**< hmac_fifo_empty */
  kTopDarjeelingPlicIrqIdHmacHmacErr = 82, /**< hmac_hmac_err */
  kTopDarjeelingPlicIrqIdKmacKmacDone = 83, /**< kmac_kmac_done */
  kTopDarjeelingPlicIrqIdKmacFifoEmpty = 84, /**< kmac_fifo_empty */
  kTopDarjeelingPlicIrqIdKmacKmacErr = 85, /**< kmac_kmac_err */
  kTopDarjeelingPlicIrqIdOtbnDone = 86, /**< otbn_done */
  kTopDarjeelingPlicIrqIdKeymgrOpDone = 87, /**< keymgr_op_done */
  kTopDarjeelingPlicIrqIdCsrngCsCmdReqDone = 88, /**< csrng_cs_cmd_req_done */
  kTopDarjeelingPlicIrqIdCsrngCsEntropyReq = 89, /**< csrng_cs_entropy_req */
  kTopDarjeelingPlicIrqIdCsrngCsHwInstExc = 90, /**< csrng_cs_hw_inst_exc */
  kTopDarjeelingPlicIrqIdCsrngCsFatalErr = 91, /**< csrng_cs_fatal_err */
  kTopDarjeelingPlicIrqIdEntropySrcEsEntropyValid = 92, /**< entropy_src_es_entropy_valid */
  kTopDarjeelingPlicIrqIdEntropySrcEsHealthTestFailed = 93, /**< entropy_src_es_health_test_failed */
  kTopDarjeelingPlicIrqIdEntropySrcEsObserveFifoReady = 94, /**< entropy_src_es_observe_fifo_ready */
  kTopDarjeelingPlicIrqIdEntropySrcEsFatalErr = 95, /**< entropy_src_es_fatal_err */
  kTopDarjeelingPlicIrqIdEdn0EdnCmdReqDone = 96, /**< edn0_edn_cmd_req_done */
  kTopDarjeelingPlicIrqIdEdn0EdnFatalErr = 97, /**< edn0_edn_fatal_err */
  kTopDarjeelingPlicIrqIdEdn1EdnCmdReqDone = 98, /**< edn1_edn_cmd_req_done */
  kTopDarjeelingPlicIrqIdEdn1EdnFatalErr = 99, /**< edn1_edn_fatal_err */
  kTopDarjeelingPlicIrqIdLast = 99, /**< \internal The Last Valid Interrupt ID. */
} top_darjeeling_plic_irq_id_t;

/**
 * PLIC Interrupt Source to Peripheral Map
 *
 * This array is a mapping from `top_darjeeling_plic_irq_id_t` to
 * `top_darjeeling_plic_peripheral_t`.
 */
extern const top_darjeeling_plic_peripheral_t
    top_darjeeling_plic_interrupt_for_peripheral[100];

/**
 * PLIC Interrupt Target.
 *
 * Enumeration used to determine which set of IE, CC, threshold registers to
 * access for a given interrupt target.
 */
typedef enum top_darjeeling_plic_target {
  kTopDarjeelingPlicTargetIbex0 = 0, /**< Ibex Core 0 */
  kTopDarjeelingPlicTargetLast = 0, /**< \internal Final PLIC target */
} top_darjeeling_plic_target_t;

/**
 * Alert Handler Source Peripheral.
 *
 * Enumeration used to determine which peripheral asserted the corresponding
 * alert.
 */
typedef enum top_darjeeling_alert_peripheral {
  kTopDarjeelingAlertPeripheralUart0 = 0, /**< uart0 */
  kTopDarjeelingAlertPeripheralGpio = 1, /**< gpio */
  kTopDarjeelingAlertPeripheralSpiDevice = 2, /**< spi_device */
  kTopDarjeelingAlertPeripheralI2c0 = 3, /**< i2c0 */
  kTopDarjeelingAlertPeripheralRvTimer = 4, /**< rv_timer */
  kTopDarjeelingAlertPeripheralOtpCtrl = 5, /**< otp_ctrl */
  kTopDarjeelingAlertPeripheralLcCtrl = 6, /**< lc_ctrl */
  kTopDarjeelingAlertPeripheralSpiHost0 = 7, /**< spi_host0 */
  kTopDarjeelingAlertPeripheralPwrmgrAon = 8, /**< pwrmgr_aon */
  kTopDarjeelingAlertPeripheralRstmgrAon = 9, /**< rstmgr_aon */
  kTopDarjeelingAlertPeripheralClkmgrAon = 10, /**< clkmgr_aon */
  kTopDarjeelingAlertPeripheralPinmuxAon = 11, /**< pinmux_aon */
  kTopDarjeelingAlertPeripheralAonTimerAon = 12, /**< aon_timer_aon */
  kTopDarjeelingAlertPeripheralSramCtrlRetAon = 13, /**< sram_ctrl_ret_aon */
  kTopDarjeelingAlertPeripheralRvDm = 14, /**< rv_dm */
  kTopDarjeelingAlertPeripheralRvPlic = 15, /**< rv_plic */
  kTopDarjeelingAlertPeripheralAes = 16, /**< aes */
  kTopDarjeelingAlertPeripheralHmac = 17, /**< hmac */
  kTopDarjeelingAlertPeripheralKmac = 18, /**< kmac */
  kTopDarjeelingAlertPeripheralOtbn = 19, /**< otbn */
  kTopDarjeelingAlertPeripheralKeymgr = 20, /**< keymgr */
  kTopDarjeelingAlertPeripheralCsrng = 21, /**< csrng */
  kTopDarjeelingAlertPeripheralEntropySrc = 22, /**< entropy_src */
  kTopDarjeelingAlertPeripheralEdn0 = 23, /**< edn0 */
  kTopDarjeelingAlertPeripheralEdn1 = 24, /**< edn1 */
  kTopDarjeelingAlertPeripheralSramCtrlMain = 25, /**< sram_ctrl_main */
  kTopDarjeelingAlertPeripheralSramCtrlMbox = 26, /**< sram_ctrl_mbox */
  kTopDarjeelingAlertPeripheralRomCtrl0 = 27, /**< rom_ctrl0 */
  kTopDarjeelingAlertPeripheralRomCtrl1 = 28, /**< rom_ctrl1 */
  kTopDarjeelingAlertPeripheralRvCoreIbex = 29, /**< rv_core_ibex */
  kTopDarjeelingAlertPeripheralLast = 29, /**< \internal Final Alert peripheral */
} top_darjeeling_alert_peripheral_t;

/**
 * Alert Handler Alert Source.
 *
 * Enumeration of all Alert Handler Alert Sources. The alert sources belonging to
 * the same peripheral are guaranteed to be consecutive.
 */
typedef enum top_darjeeling_alert_id {
  kTopDarjeelingAlertIdUart0FatalFault = 0, /**< uart0_fatal_fault */
  kTopDarjeelingAlertIdGpioFatalFault = 1, /**< gpio_fatal_fault */
  kTopDarjeelingAlertIdSpiDeviceFatalFault = 2, /**< spi_device_fatal_fault */
  kTopDarjeelingAlertIdI2c0FatalFault = 3, /**< i2c0_fatal_fault */
  kTopDarjeelingAlertIdRvTimerFatalFault = 4, /**< rv_timer_fatal_fault */
  kTopDarjeelingAlertIdOtpCtrlFatalMacroError = 5, /**< otp_ctrl_fatal_macro_error */
  kTopDarjeelingAlertIdOtpCtrlFatalCheckError = 6, /**< otp_ctrl_fatal_check_error */
  kTopDarjeelingAlertIdOtpCtrlFatalBusIntegError = 7, /**< otp_ctrl_fatal_bus_integ_error */
  kTopDarjeelingAlertIdOtpCtrlFatalPrimOtpAlert = 8, /**< otp_ctrl_fatal_prim_otp_alert */
  kTopDarjeelingAlertIdOtpCtrlRecovPrimOtpAlert = 9, /**< otp_ctrl_recov_prim_otp_alert */
  kTopDarjeelingAlertIdLcCtrlFatalProgError = 10, /**< lc_ctrl_fatal_prog_error */
  kTopDarjeelingAlertIdLcCtrlFatalStateError = 11, /**< lc_ctrl_fatal_state_error */
  kTopDarjeelingAlertIdLcCtrlFatalBusIntegError = 12, /**< lc_ctrl_fatal_bus_integ_error */
  kTopDarjeelingAlertIdSpiHost0FatalFault = 13, /**< spi_host0_fatal_fault */
  kTopDarjeelingAlertIdPwrmgrAonFatalFault = 14, /**< pwrmgr_aon_fatal_fault */
  kTopDarjeelingAlertIdRstmgrAonFatalFault = 15, /**< rstmgr_aon_fatal_fault */
  kTopDarjeelingAlertIdRstmgrAonFatalCnstyFault = 16, /**< rstmgr_aon_fatal_cnsty_fault */
  kTopDarjeelingAlertIdClkmgrAonRecovFault = 17, /**< clkmgr_aon_recov_fault */
  kTopDarjeelingAlertIdClkmgrAonFatalFault = 18, /**< clkmgr_aon_fatal_fault */
  kTopDarjeelingAlertIdPinmuxAonFatalFault = 19, /**< pinmux_aon_fatal_fault */
  kTopDarjeelingAlertIdAonTimerAonFatalFault = 20, /**< aon_timer_aon_fatal_fault */
  kTopDarjeelingAlertIdSramCtrlRetAonFatalError = 21, /**< sram_ctrl_ret_aon_fatal_error */
  kTopDarjeelingAlertIdRvDmFatalFault = 22, /**< rv_dm_fatal_fault */
  kTopDarjeelingAlertIdRvPlicFatalFault = 23, /**< rv_plic_fatal_fault */
  kTopDarjeelingAlertIdAesRecovCtrlUpdateErr = 24, /**< aes_recov_ctrl_update_err */
  kTopDarjeelingAlertIdAesFatalFault = 25, /**< aes_fatal_fault */
  kTopDarjeelingAlertIdHmacFatalFault = 26, /**< hmac_fatal_fault */
  kTopDarjeelingAlertIdKmacRecovOperationErr = 27, /**< kmac_recov_operation_err */
  kTopDarjeelingAlertIdKmacFatalFaultErr = 28, /**< kmac_fatal_fault_err */
  kTopDarjeelingAlertIdOtbnFatal = 29, /**< otbn_fatal */
  kTopDarjeelingAlertIdOtbnRecov = 30, /**< otbn_recov */
  kTopDarjeelingAlertIdKeymgrRecovOperationErr = 31, /**< keymgr_recov_operation_err */
  kTopDarjeelingAlertIdKeymgrFatalFaultErr = 32, /**< keymgr_fatal_fault_err */
  kTopDarjeelingAlertIdCsrngRecovAlert = 33, /**< csrng_recov_alert */
  kTopDarjeelingAlertIdCsrngFatalAlert = 34, /**< csrng_fatal_alert */
  kTopDarjeelingAlertIdEntropySrcRecovAlert = 35, /**< entropy_src_recov_alert */
  kTopDarjeelingAlertIdEntropySrcFatalAlert = 36, /**< entropy_src_fatal_alert */
  kTopDarjeelingAlertIdEdn0RecovAlert = 37, /**< edn0_recov_alert */
  kTopDarjeelingAlertIdEdn0FatalAlert = 38, /**< edn0_fatal_alert */
  kTopDarjeelingAlertIdEdn1RecovAlert = 39, /**< edn1_recov_alert */
  kTopDarjeelingAlertIdEdn1FatalAlert = 40, /**< edn1_fatal_alert */
  kTopDarjeelingAlertIdSramCtrlMainFatalError = 41, /**< sram_ctrl_main_fatal_error */
  kTopDarjeelingAlertIdSramCtrlMboxFatalError = 42, /**< sram_ctrl_mbox_fatal_error */
  kTopDarjeelingAlertIdRomCtrl0Fatal = 43, /**< rom_ctrl0_fatal */
  kTopDarjeelingAlertIdRomCtrl1Fatal = 44, /**< rom_ctrl1_fatal */
  kTopDarjeelingAlertIdRvCoreIbexFatalSwErr = 45, /**< rv_core_ibex_fatal_sw_err */
  kTopDarjeelingAlertIdRvCoreIbexRecovSwErr = 46, /**< rv_core_ibex_recov_sw_err */
  kTopDarjeelingAlertIdRvCoreIbexFatalHwErr = 47, /**< rv_core_ibex_fatal_hw_err */
  kTopDarjeelingAlertIdRvCoreIbexRecovHwErr = 48, /**< rv_core_ibex_recov_hw_err */
  kTopDarjeelingAlertIdLast = 48, /**< \internal The Last Valid Alert ID. */
} top_darjeeling_alert_id_t;

/**
 * Alert Handler Alert Source to Peripheral Map
 *
 * This array is a mapping from `top_darjeeling_alert_id_t` to
 * `top_darjeeling_alert_peripheral_t`.
 */
extern const top_darjeeling_alert_peripheral_t
    top_darjeeling_alert_for_peripheral[49];

// PERIPH_INSEL ranges from 0 to TOP_DARJEELING_NUM_MIO_PADS + 2 -1}
//  0 and 1 are tied to value 0 and 1
#define TOP_DARJEELING_NUM_MIO_PADS 3
#define TOP_DARJEELING_NUM_DIO_PADS 11

#define TOP_DARJEELING_PINMUX_MIO_PERIPH_INSEL_IDX_OFFSET 2
#define TOP_DARJEELING_PINMUX_PERIPH_OUTSEL_IDX_OFFSET 3

/**
 * Pinmux Peripheral Input.
 */
typedef enum top_darjeeling_pinmux_peripheral_in {
  kTopDarjeelingPinmuxPeripheralInSpiDeviceSd0 = 0, /**< Peripheral Input 0 */
  kTopDarjeelingPinmuxPeripheralInSpiDeviceSd1 = 1, /**< Peripheral Input 1 */
  kTopDarjeelingPinmuxPeripheralInSpiDeviceSd2 = 2, /**< Peripheral Input 2 */
  kTopDarjeelingPinmuxPeripheralInSpiDeviceSd3 = 3, /**< Peripheral Input 3 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio0 = 4, /**< Peripheral Input 4 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio1 = 5, /**< Peripheral Input 5 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio2 = 6, /**< Peripheral Input 6 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio3 = 7, /**< Peripheral Input 7 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio4 = 8, /**< Peripheral Input 8 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio5 = 9, /**< Peripheral Input 9 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio6 = 10, /**< Peripheral Input 10 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio7 = 11, /**< Peripheral Input 11 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio8 = 12, /**< Peripheral Input 12 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio9 = 13, /**< Peripheral Input 13 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio10 = 14, /**< Peripheral Input 14 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio11 = 15, /**< Peripheral Input 15 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio12 = 16, /**< Peripheral Input 16 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio13 = 17, /**< Peripheral Input 17 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio14 = 18, /**< Peripheral Input 18 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio15 = 19, /**< Peripheral Input 19 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio16 = 20, /**< Peripheral Input 20 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio17 = 21, /**< Peripheral Input 21 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio18 = 22, /**< Peripheral Input 22 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio19 = 23, /**< Peripheral Input 23 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio20 = 24, /**< Peripheral Input 24 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio21 = 25, /**< Peripheral Input 25 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio22 = 26, /**< Peripheral Input 26 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio23 = 27, /**< Peripheral Input 27 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio24 = 28, /**< Peripheral Input 28 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio25 = 29, /**< Peripheral Input 29 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio26 = 30, /**< Peripheral Input 30 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio27 = 31, /**< Peripheral Input 31 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio28 = 32, /**< Peripheral Input 32 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio29 = 33, /**< Peripheral Input 33 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio30 = 34, /**< Peripheral Input 34 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio31 = 35, /**< Peripheral Input 35 */
  kTopDarjeelingPinmuxPeripheralInLast = 35, /**< \internal Last valid peripheral input */
} top_darjeeling_pinmux_peripheral_in_t;

/**
 * Pinmux MIO Input Selector.
 */
typedef enum top_darjeeling_pinmux_insel {
  kTopDarjeelingPinmuxInselConstantZero = 0, /**< Tie constantly to zero */
  kTopDarjeelingPinmuxInselConstantOne = 1, /**< Tie constantly to one */
  kTopDarjeelingPinmuxInselSpi_device_fwload_mosi = 2, /**< MIO Pad 0 */
  kTopDarjeelingPinmuxInselSpi_device_fwload_miso = 3, /**< MIO Pad 1 */
  kTopDarjeelingPinmuxInselSpi_host_bootrot_reset_l = 4, /**< MIO Pad 2 */
  kTopDarjeelingPinmuxInselLast = 4, /**< \internal Last valid insel value */
} top_darjeeling_pinmux_insel_t;

/**
 * Pinmux MIO Output.
 */
typedef enum top_darjeeling_pinmux_mio_out {
  kTopDarjeelingPinmuxMioOutSpiDeviceFwloadMosi = 0, /**< MIO Pad 0 */
  kTopDarjeelingPinmuxMioOutSpiDeviceFwloadMiso = 1, /**< MIO Pad 1 */
  kTopDarjeelingPinmuxMioOutSpiHostBootrotResetL = 2, /**< MIO Pad 2 */
  kTopDarjeelingPinmuxMioOutLast = 2, /**< \internal Last valid mio output */
} top_darjeeling_pinmux_mio_out_t;

/**
 * Pinmux Peripheral Output Selector.
 */
typedef enum top_darjeeling_pinmux_outsel {
  kTopDarjeelingPinmuxOutselConstantZero = 0, /**< Tie constantly to zero */
  kTopDarjeelingPinmuxOutselConstantOne = 1, /**< Tie constantly to one */
  kTopDarjeelingPinmuxOutselConstantHighZ = 2, /**< Tie constantly to high-Z */
  kTopDarjeelingPinmuxOutselSpiDeviceSd0 = 3, /**< Peripheral Output 0 */
  kTopDarjeelingPinmuxOutselSpiDeviceSd1 = 4, /**< Peripheral Output 1 */
  kTopDarjeelingPinmuxOutselSpiDeviceSd2 = 5, /**< Peripheral Output 2 */
  kTopDarjeelingPinmuxOutselSpiDeviceSd3 = 6, /**< Peripheral Output 3 */
  kTopDarjeelingPinmuxOutselGpioGpio0 = 7, /**< Peripheral Output 4 */
  kTopDarjeelingPinmuxOutselGpioGpio1 = 8, /**< Peripheral Output 5 */
  kTopDarjeelingPinmuxOutselGpioGpio2 = 9, /**< Peripheral Output 6 */
  kTopDarjeelingPinmuxOutselGpioGpio3 = 10, /**< Peripheral Output 7 */
  kTopDarjeelingPinmuxOutselGpioGpio4 = 11, /**< Peripheral Output 8 */
  kTopDarjeelingPinmuxOutselGpioGpio5 = 12, /**< Peripheral Output 9 */
  kTopDarjeelingPinmuxOutselGpioGpio6 = 13, /**< Peripheral Output 10 */
  kTopDarjeelingPinmuxOutselGpioGpio7 = 14, /**< Peripheral Output 11 */
  kTopDarjeelingPinmuxOutselGpioGpio8 = 15, /**< Peripheral Output 12 */
  kTopDarjeelingPinmuxOutselGpioGpio9 = 16, /**< Peripheral Output 13 */
  kTopDarjeelingPinmuxOutselGpioGpio10 = 17, /**< Peripheral Output 14 */
  kTopDarjeelingPinmuxOutselGpioGpio11 = 18, /**< Peripheral Output 15 */
  kTopDarjeelingPinmuxOutselGpioGpio12 = 19, /**< Peripheral Output 16 */
  kTopDarjeelingPinmuxOutselGpioGpio13 = 20, /**< Peripheral Output 17 */
  kTopDarjeelingPinmuxOutselGpioGpio14 = 21, /**< Peripheral Output 18 */
  kTopDarjeelingPinmuxOutselGpioGpio15 = 22, /**< Peripheral Output 19 */
  kTopDarjeelingPinmuxOutselGpioGpio16 = 23, /**< Peripheral Output 20 */
  kTopDarjeelingPinmuxOutselGpioGpio17 = 24, /**< Peripheral Output 21 */
  kTopDarjeelingPinmuxOutselGpioGpio18 = 25, /**< Peripheral Output 22 */
  kTopDarjeelingPinmuxOutselGpioGpio19 = 26, /**< Peripheral Output 23 */
  kTopDarjeelingPinmuxOutselGpioGpio20 = 27, /**< Peripheral Output 24 */
  kTopDarjeelingPinmuxOutselGpioGpio21 = 28, /**< Peripheral Output 25 */
  kTopDarjeelingPinmuxOutselGpioGpio22 = 29, /**< Peripheral Output 26 */
  kTopDarjeelingPinmuxOutselGpioGpio23 = 30, /**< Peripheral Output 27 */
  kTopDarjeelingPinmuxOutselGpioGpio24 = 31, /**< Peripheral Output 28 */
  kTopDarjeelingPinmuxOutselGpioGpio25 = 32, /**< Peripheral Output 29 */
  kTopDarjeelingPinmuxOutselGpioGpio26 = 33, /**< Peripheral Output 30 */
  kTopDarjeelingPinmuxOutselGpioGpio27 = 34, /**< Peripheral Output 31 */
  kTopDarjeelingPinmuxOutselGpioGpio28 = 35, /**< Peripheral Output 32 */
  kTopDarjeelingPinmuxOutselGpioGpio29 = 36, /**< Peripheral Output 33 */
  kTopDarjeelingPinmuxOutselGpioGpio30 = 37, /**< Peripheral Output 34 */
  kTopDarjeelingPinmuxOutselGpioGpio31 = 38, /**< Peripheral Output 35 */
  kTopDarjeelingPinmuxOutselLast = 38, /**< \internal Last valid outsel value */
} top_darjeeling_pinmux_outsel_t;

/**
 * Dedicated Pad Selects
 */
typedef enum top_darjeeling_direct_pads {
  kTopDarjeelingDirectPadsSpiHost0Sd0 = 0, /**<  */
  kTopDarjeelingDirectPadsSpiHost0Sd1 = 1, /**<  */
  kTopDarjeelingDirectPadsSpiHost0Sd2 = 2, /**<  */
  kTopDarjeelingDirectPadsSpiHost0Sd3 = 3, /**<  */
  kTopDarjeelingDirectPadsI2c0Scl = 4, /**<  */
  kTopDarjeelingDirectPadsI2c0Sda = 5, /**<  */
  kTopDarjeelingDirectPadsSpiDeviceSck = 6, /**<  */
  kTopDarjeelingDirectPadsSpiDeviceCsb = 7, /**<  */
  kTopDarjeelingDirectPadsSpiHost0Sck = 8, /**<  */
  kTopDarjeelingDirectPadsSpiHost0Csb = 9, /**<  */
  kTopDarjeelingDirectPadsUart0Tx = 10, /**<  */
  kTopDarjeelingDirectPadsLast = 10, /**< \internal Last valid direct pad */
} top_darjeeling_direct_pads_t;

/**
 * Muxed Pad Selects
 */
typedef enum top_darjeeling_muxed_pads {
  kTopDarjeelingMuxedPadsSpiDeviceFwloadMosi = 0, /**<  */
  kTopDarjeelingMuxedPadsSpiDeviceFwloadMiso = 1, /**<  */
  kTopDarjeelingMuxedPadsSpiHostBootrotResetL = 2, /**<  */
  kTopDarjeelingMuxedPadsLast = 2, /**< \internal Last valid muxed pad */
} top_darjeeling_muxed_pads_t;

/**
 * Power Manager Wakeup Signals
 */
typedef enum top_darjeeling_power_manager_wake_ups {
  kTopDarjeelingPowerManagerWakeUpsPinmuxAonPinWkupReq = 0, /**<  */
  kTopDarjeelingPowerManagerWakeUpsPinmuxAonUsbWkupReq = 1, /**<  */
  kTopDarjeelingPowerManagerWakeUpsAonTimerAonWkupReq = 2, /**<  */
  kTopDarjeelingPowerManagerWakeUpsLast = 2, /**< \internal Last valid pwrmgr wakeup signal */
} top_darjeeling_power_manager_wake_ups_t;

/**
 * Reset Manager Software Controlled Resets
 */
typedef enum top_darjeeling_reset_manager_sw_resets {
  kTopDarjeelingResetManagerSwResetsSpiDevice = 0, /**<  */
  kTopDarjeelingResetManagerSwResetsSpiHost0 = 1, /**<  */
  kTopDarjeelingResetManagerSwResetsSpiHost1 = 2, /**<  */
  kTopDarjeelingResetManagerSwResetsUsb = 3, /**<  */
  kTopDarjeelingResetManagerSwResetsUsbAon = 4, /**<  */
  kTopDarjeelingResetManagerSwResetsI2c0 = 5, /**<  */
  kTopDarjeelingResetManagerSwResetsI2c1 = 6, /**<  */
  kTopDarjeelingResetManagerSwResetsI2c2 = 7, /**<  */
  kTopDarjeelingResetManagerSwResetsLast = 7, /**< \internal Last valid rstmgr software reset request */
} top_darjeeling_reset_manager_sw_resets_t;

/**
 * Power Manager Reset Request Signals
 */
typedef enum top_darjeeling_power_manager_reset_requests {
  kTopDarjeelingPowerManagerResetRequestsAonTimerAonAonTimerRstReq = 0, /**<  */
  kTopDarjeelingPowerManagerResetRequestsLast = 0, /**< \internal Last valid pwrmgr reset_request signal */
} top_darjeeling_power_manager_reset_requests_t;

/**
 * Clock Manager Software-Controlled ("Gated") Clocks.
 *
 * The Software has full control over these clocks.
 */
typedef enum top_darjeeling_gateable_clocks {
  kTopDarjeelingGateableClocksIoDiv4Peri = 0, /**< Clock clk_io_div4_peri in group peri */
  kTopDarjeelingGateableClocksIoDiv2Peri = 1, /**< Clock clk_io_div2_peri in group peri */
  kTopDarjeelingGateableClocksUsbPeri = 2, /**< Clock clk_usb_peri in group peri */
  kTopDarjeelingGateableClocksIoPeri = 3, /**< Clock clk_io_peri in group peri */
  kTopDarjeelingGateableClocksLast = 3, /**< \internal Last Valid Gateable Clock */
} top_darjeeling_gateable_clocks_t;

/**
 * Clock Manager Software-Hinted Clocks.
 *
 * The Software has partial control over these clocks. It can ask them to stop,
 * but the clock manager is in control of whether the clock actually is stopped.
 */
typedef enum top_darjeeling_hintable_clocks {
  kTopDarjeelingHintableClocksMainAes = 0, /**< Clock clk_main_aes in group trans */
  kTopDarjeelingHintableClocksMainHmac = 1, /**< Clock clk_main_hmac in group trans */
  kTopDarjeelingHintableClocksMainKmac = 2, /**< Clock clk_main_kmac in group trans */
  kTopDarjeelingHintableClocksMainOtbn = 3, /**< Clock clk_main_otbn in group trans */
  kTopDarjeelingHintableClocksLast = 3, /**< \internal Last Valid Hintable Clock */
} top_darjeeling_hintable_clocks_t;

/**
 * MMIO Region
 *
 * MMIO region excludes any memory that is separate from the module
 * configuration space, i.e. ROM, main SRAM, and flash are excluded but
 * retention SRAM, spi_device memory, or usbdev memory are included.
 */
#define TOP_DARJEELING_MMIO_BASE_ADDR 0x21100000u
#define TOP_DARJEELING_MMIO_SIZE_BYTES 0xF400020u

// Header Extern Guard
#ifdef __cplusplus
}  // extern "C"
#endif

#endif  // OPENTITAN_SW_AUTOGEN_TOP_DARJEELING_H_
