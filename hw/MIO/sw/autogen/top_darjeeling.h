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
 * PLIC Interrupt Source Peripheral.
 *
 * Enumeration used to determine which peripheral asserted the corresponding
 * interrupt.
 */
typedef enum top_darjeeling_plic_peripheral {
  kTopDarjeelingPlicPeripheralUnknown = 0, /**< Unknown Peripheral */
  kTopDarjeelingPlicPeripheralGpio = 1, /**< gpio */
  kTopDarjeelingPlicPeripheralRvTimer = 2, /**< rv_timer */
  kTopDarjeelingPlicPeripheralAlertHandler = 3, /**< alert_handler */
  kTopDarjeelingPlicPeripheralPwrmgrAon = 4, /**< pwrmgr_aon */
  kTopDarjeelingPlicPeripheralAonTimerAon = 5, /**< aon_timer_aon */
  kTopDarjeelingPlicPeripheralOtbn = 6, /**< otbn */
  kTopDarjeelingPlicPeripheralLast = 6, /**< \internal Final PLIC peripheral */
} top_darjeeling_plic_peripheral_t;

/**
 * PLIC Interrupt Source.
 *
 * Enumeration of all PLIC interrupt sources. The interrupt sources belonging to
 * the same peripheral are guaranteed to be consecutive.
 */
typedef enum top_darjeeling_plic_irq_id {
  kTopDarjeelingPlicIrqIdNone = 0, /**< No Interrupt */
  kTopDarjeelingPlicIrqIdGpioGpio0 = 1, /**< gpio_gpio 0 */
  kTopDarjeelingPlicIrqIdGpioGpio1 = 2, /**< gpio_gpio 1 */
  kTopDarjeelingPlicIrqIdGpioGpio2 = 3, /**< gpio_gpio 2 */
  kTopDarjeelingPlicIrqIdGpioGpio3 = 4, /**< gpio_gpio 3 */
  kTopDarjeelingPlicIrqIdGpioGpio4 = 5, /**< gpio_gpio 4 */
  kTopDarjeelingPlicIrqIdGpioGpio5 = 6, /**< gpio_gpio 5 */
  kTopDarjeelingPlicIrqIdGpioGpio6 = 7, /**< gpio_gpio 6 */
  kTopDarjeelingPlicIrqIdGpioGpio7 = 8, /**< gpio_gpio 7 */
  kTopDarjeelingPlicIrqIdGpioGpio8 = 9, /**< gpio_gpio 8 */
  kTopDarjeelingPlicIrqIdGpioGpio9 = 10, /**< gpio_gpio 9 */
  kTopDarjeelingPlicIrqIdGpioGpio10 = 11, /**< gpio_gpio 10 */
  kTopDarjeelingPlicIrqIdGpioGpio11 = 12, /**< gpio_gpio 11 */
  kTopDarjeelingPlicIrqIdGpioGpio12 = 13, /**< gpio_gpio 12 */
  kTopDarjeelingPlicIrqIdGpioGpio13 = 14, /**< gpio_gpio 13 */
  kTopDarjeelingPlicIrqIdGpioGpio14 = 15, /**< gpio_gpio 14 */
  kTopDarjeelingPlicIrqIdGpioGpio15 = 16, /**< gpio_gpio 15 */
  kTopDarjeelingPlicIrqIdGpioGpio16 = 17, /**< gpio_gpio 16 */
  kTopDarjeelingPlicIrqIdGpioGpio17 = 18, /**< gpio_gpio 17 */
  kTopDarjeelingPlicIrqIdGpioGpio18 = 19, /**< gpio_gpio 18 */
  kTopDarjeelingPlicIrqIdGpioGpio19 = 20, /**< gpio_gpio 19 */
  kTopDarjeelingPlicIrqIdGpioGpio20 = 21, /**< gpio_gpio 20 */
  kTopDarjeelingPlicIrqIdGpioGpio21 = 22, /**< gpio_gpio 21 */
  kTopDarjeelingPlicIrqIdGpioGpio22 = 23, /**< gpio_gpio 22 */
  kTopDarjeelingPlicIrqIdGpioGpio23 = 24, /**< gpio_gpio 23 */
  kTopDarjeelingPlicIrqIdGpioGpio24 = 25, /**< gpio_gpio 24 */
  kTopDarjeelingPlicIrqIdGpioGpio25 = 26, /**< gpio_gpio 25 */
  kTopDarjeelingPlicIrqIdGpioGpio26 = 27, /**< gpio_gpio 26 */
  kTopDarjeelingPlicIrqIdGpioGpio27 = 28, /**< gpio_gpio 27 */
  kTopDarjeelingPlicIrqIdGpioGpio28 = 29, /**< gpio_gpio 28 */
  kTopDarjeelingPlicIrqIdGpioGpio29 = 30, /**< gpio_gpio 29 */
  kTopDarjeelingPlicIrqIdGpioGpio30 = 31, /**< gpio_gpio 30 */
  kTopDarjeelingPlicIrqIdGpioGpio31 = 32, /**< gpio_gpio 31 */
  kTopDarjeelingPlicIrqIdRvTimerTimerExpiredHart0Timer0 = 33, /**< rv_timer_timer_expired_hart0_timer0 */
  kTopDarjeelingPlicIrqIdAlertHandlerClassa = 34, /**< alert_handler_classa */
  kTopDarjeelingPlicIrqIdAlertHandlerClassb = 35, /**< alert_handler_classb */
  kTopDarjeelingPlicIrqIdAlertHandlerClassc = 36, /**< alert_handler_classc */
  kTopDarjeelingPlicIrqIdAlertHandlerClassd = 37, /**< alert_handler_classd */
  kTopDarjeelingPlicIrqIdPwrmgrAonWakeup = 38, /**< pwrmgr_aon_wakeup */
  kTopDarjeelingPlicIrqIdAonTimerAonWkupTimerExpired = 39, /**< aon_timer_aon_wkup_timer_expired */
  kTopDarjeelingPlicIrqIdAonTimerAonWdogTimerBark = 40, /**< aon_timer_aon_wdog_timer_bark */
  kTopDarjeelingPlicIrqIdOtbnDone = 41, /**< otbn_done */
  kTopDarjeelingPlicIrqIdLast = 41, /**< \internal The Last Valid Interrupt ID. */
} top_darjeeling_plic_irq_id_t;

/**
 * PLIC Interrupt Source to Peripheral Map
 *
 * This array is a mapping from `top_darjeeling_plic_irq_id_t` to
 * `top_darjeeling_plic_peripheral_t`.
 */
extern const top_darjeeling_plic_peripheral_t
    top_darjeeling_plic_interrupt_for_peripheral[42];

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
  kTopDarjeelingAlertPeripheralGpio = 0, /**< gpio */
  kTopDarjeelingAlertPeripheralRvTimer = 1, /**< rv_timer */
  kTopDarjeelingAlertPeripheralPwrmgrAon = 2, /**< pwrmgr_aon */
  kTopDarjeelingAlertPeripheralRstmgrAon = 3, /**< rstmgr_aon */
  kTopDarjeelingAlertPeripheralClkmgrAon = 4, /**< clkmgr_aon */
  kTopDarjeelingAlertPeripheralPinmuxAon = 5, /**< pinmux_aon */
  kTopDarjeelingAlertPeripheralAonTimerAon = 6, /**< aon_timer_aon */
  kTopDarjeelingAlertPeripheralSramCtrlRetAon = 7, /**< sram_ctrl_ret_aon */
  kTopDarjeelingAlertPeripheralRvDm = 8, /**< rv_dm */
  kTopDarjeelingAlertPeripheralRvPlic = 9, /**< rv_plic */
  kTopDarjeelingAlertPeripheralOtbn = 10, /**< otbn */
  kTopDarjeelingAlertPeripheralSramCtrlMain = 11, /**< sram_ctrl_main */
  kTopDarjeelingAlertPeripheralSramCtrlMbox = 12, /**< sram_ctrl_mbox */
  kTopDarjeelingAlertPeripheralRvCoreIbex = 13, /**< rv_core_ibex */
  kTopDarjeelingAlertPeripheralLast = 13, /**< \internal Final Alert peripheral */
} top_darjeeling_alert_peripheral_t;

/**
 * Alert Handler Alert Source.
 *
 * Enumeration of all Alert Handler Alert Sources. The alert sources belonging to
 * the same peripheral are guaranteed to be consecutive.
 */
typedef enum top_darjeeling_alert_id {
  kTopDarjeelingAlertIdGpioFatalFault = 0, /**< gpio_fatal_fault */
  kTopDarjeelingAlertIdRvTimerFatalFault = 1, /**< rv_timer_fatal_fault */
  kTopDarjeelingAlertIdPwrmgrAonFatalFault = 2, /**< pwrmgr_aon_fatal_fault */
  kTopDarjeelingAlertIdRstmgrAonFatalFault = 3, /**< rstmgr_aon_fatal_fault */
  kTopDarjeelingAlertIdRstmgrAonFatalCnstyFault = 4, /**< rstmgr_aon_fatal_cnsty_fault */
  kTopDarjeelingAlertIdClkmgrAonRecovFault = 5, /**< clkmgr_aon_recov_fault */
  kTopDarjeelingAlertIdClkmgrAonFatalFault = 6, /**< clkmgr_aon_fatal_fault */
  kTopDarjeelingAlertIdPinmuxAonFatalFault = 7, /**< pinmux_aon_fatal_fault */
  kTopDarjeelingAlertIdAonTimerAonFatalFault = 8, /**< aon_timer_aon_fatal_fault */
  kTopDarjeelingAlertIdSramCtrlRetAonFatalError = 9, /**< sram_ctrl_ret_aon_fatal_error */
  kTopDarjeelingAlertIdRvDmFatalFault = 10, /**< rv_dm_fatal_fault */
  kTopDarjeelingAlertIdRvPlicFatalFault = 11, /**< rv_plic_fatal_fault */
  kTopDarjeelingAlertIdOtbnFatal = 12, /**< otbn_fatal */
  kTopDarjeelingAlertIdOtbnRecov = 13, /**< otbn_recov */
  kTopDarjeelingAlertIdSramCtrlMainFatalError = 14, /**< sram_ctrl_main_fatal_error */
  kTopDarjeelingAlertIdSramCtrlMboxFatalError = 15, /**< sram_ctrl_mbox_fatal_error */
  kTopDarjeelingAlertIdRvCoreIbexFatalSwErr = 16, /**< rv_core_ibex_fatal_sw_err */
  kTopDarjeelingAlertIdRvCoreIbexRecovSwErr = 17, /**< rv_core_ibex_recov_sw_err */
  kTopDarjeelingAlertIdRvCoreIbexFatalHwErr = 18, /**< rv_core_ibex_fatal_hw_err */
  kTopDarjeelingAlertIdRvCoreIbexRecovHwErr = 19, /**< rv_core_ibex_recov_hw_err */
  kTopDarjeelingAlertIdLast = 19, /**< \internal The Last Valid Alert ID. */
} top_darjeeling_alert_id_t;

/**
 * Alert Handler Alert Source to Peripheral Map
 *
 * This array is a mapping from `top_darjeeling_alert_id_t` to
 * `top_darjeeling_alert_peripheral_t`.
 */
extern const top_darjeeling_alert_peripheral_t
    top_darjeeling_alert_for_peripheral[20];

// PERIPH_INSEL ranges from 0 to TOP_DARJEELING_NUM_MIO_PADS + 2 -1}
//  0 and 1 are tied to value 0 and 1
#define TOP_DARJEELING_NUM_MIO_PADS 1
#define TOP_DARJEELING_NUM_DIO_PADS 0

#define TOP_DARJEELING_PINMUX_MIO_PERIPH_INSEL_IDX_OFFSET 2
#define TOP_DARJEELING_PINMUX_PERIPH_OUTSEL_IDX_OFFSET 3

/**
 * Pinmux Peripheral Input.
 */
typedef enum top_darjeeling_pinmux_peripheral_in {
  kTopDarjeelingPinmuxPeripheralInGpioGpio0 = 0, /**< Peripheral Input 0 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio1 = 1, /**< Peripheral Input 1 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio2 = 2, /**< Peripheral Input 2 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio3 = 3, /**< Peripheral Input 3 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio4 = 4, /**< Peripheral Input 4 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio5 = 5, /**< Peripheral Input 5 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio6 = 6, /**< Peripheral Input 6 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio7 = 7, /**< Peripheral Input 7 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio8 = 8, /**< Peripheral Input 8 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio9 = 9, /**< Peripheral Input 9 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio10 = 10, /**< Peripheral Input 10 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio11 = 11, /**< Peripheral Input 11 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio12 = 12, /**< Peripheral Input 12 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio13 = 13, /**< Peripheral Input 13 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio14 = 14, /**< Peripheral Input 14 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio15 = 15, /**< Peripheral Input 15 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio16 = 16, /**< Peripheral Input 16 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio17 = 17, /**< Peripheral Input 17 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio18 = 18, /**< Peripheral Input 18 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio19 = 19, /**< Peripheral Input 19 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio20 = 20, /**< Peripheral Input 20 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio21 = 21, /**< Peripheral Input 21 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio22 = 22, /**< Peripheral Input 22 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio23 = 23, /**< Peripheral Input 23 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio24 = 24, /**< Peripheral Input 24 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio25 = 25, /**< Peripheral Input 25 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio26 = 26, /**< Peripheral Input 26 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio27 = 27, /**< Peripheral Input 27 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio28 = 28, /**< Peripheral Input 28 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio29 = 29, /**< Peripheral Input 29 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio30 = 30, /**< Peripheral Input 30 */
  kTopDarjeelingPinmuxPeripheralInGpioGpio31 = 31, /**< Peripheral Input 31 */
  kTopDarjeelingPinmuxPeripheralInLast = 31, /**< \internal Last valid peripheral input */
} top_darjeeling_pinmux_peripheral_in_t;

/**
 * Pinmux MIO Input Selector.
 */
typedef enum top_darjeeling_pinmux_insel {
  kTopDarjeelingPinmuxInselConstantZero = 0, /**< Tie constantly to zero */
  kTopDarjeelingPinmuxInselConstantOne = 1, /**< Tie constantly to one */
  kTopDarjeelingPinmuxInselMio_spare_0 = 2, /**< MIO Pad 0 */
  kTopDarjeelingPinmuxInselLast = 2, /**< \internal Last valid insel value */
} top_darjeeling_pinmux_insel_t;

/**
 * Pinmux MIO Output.
 */
typedef enum top_darjeeling_pinmux_mio_out {
  kTopDarjeelingPinmuxMioOutMioSpare0 = 0, /**< MIO Pad 0 */
  kTopDarjeelingPinmuxMioOutLast = 0, /**< \internal Last valid mio output */
} top_darjeeling_pinmux_mio_out_t;

/**
 * Pinmux Peripheral Output Selector.
 */
typedef enum top_darjeeling_pinmux_outsel {
  kTopDarjeelingPinmuxOutselConstantZero = 0, /**< Tie constantly to zero */
  kTopDarjeelingPinmuxOutselConstantOne = 1, /**< Tie constantly to one */
  kTopDarjeelingPinmuxOutselConstantHighZ = 2, /**< Tie constantly to high-Z */
  kTopDarjeelingPinmuxOutselGpioGpio0 = 3, /**< Peripheral Output 0 */
  kTopDarjeelingPinmuxOutselGpioGpio1 = 4, /**< Peripheral Output 1 */
  kTopDarjeelingPinmuxOutselGpioGpio2 = 5, /**< Peripheral Output 2 */
  kTopDarjeelingPinmuxOutselGpioGpio3 = 6, /**< Peripheral Output 3 */
  kTopDarjeelingPinmuxOutselGpioGpio4 = 7, /**< Peripheral Output 4 */
  kTopDarjeelingPinmuxOutselGpioGpio5 = 8, /**< Peripheral Output 5 */
  kTopDarjeelingPinmuxOutselGpioGpio6 = 9, /**< Peripheral Output 6 */
  kTopDarjeelingPinmuxOutselGpioGpio7 = 10, /**< Peripheral Output 7 */
  kTopDarjeelingPinmuxOutselGpioGpio8 = 11, /**< Peripheral Output 8 */
  kTopDarjeelingPinmuxOutselGpioGpio9 = 12, /**< Peripheral Output 9 */
  kTopDarjeelingPinmuxOutselGpioGpio10 = 13, /**< Peripheral Output 10 */
  kTopDarjeelingPinmuxOutselGpioGpio11 = 14, /**< Peripheral Output 11 */
  kTopDarjeelingPinmuxOutselGpioGpio12 = 15, /**< Peripheral Output 12 */
  kTopDarjeelingPinmuxOutselGpioGpio13 = 16, /**< Peripheral Output 13 */
  kTopDarjeelingPinmuxOutselGpioGpio14 = 17, /**< Peripheral Output 14 */
  kTopDarjeelingPinmuxOutselGpioGpio15 = 18, /**< Peripheral Output 15 */
  kTopDarjeelingPinmuxOutselGpioGpio16 = 19, /**< Peripheral Output 16 */
  kTopDarjeelingPinmuxOutselGpioGpio17 = 20, /**< Peripheral Output 17 */
  kTopDarjeelingPinmuxOutselGpioGpio18 = 21, /**< Peripheral Output 18 */
  kTopDarjeelingPinmuxOutselGpioGpio19 = 22, /**< Peripheral Output 19 */
  kTopDarjeelingPinmuxOutselGpioGpio20 = 23, /**< Peripheral Output 20 */
  kTopDarjeelingPinmuxOutselGpioGpio21 = 24, /**< Peripheral Output 21 */
  kTopDarjeelingPinmuxOutselGpioGpio22 = 25, /**< Peripheral Output 22 */
  kTopDarjeelingPinmuxOutselGpioGpio23 = 26, /**< Peripheral Output 23 */
  kTopDarjeelingPinmuxOutselGpioGpio24 = 27, /**< Peripheral Output 24 */
  kTopDarjeelingPinmuxOutselGpioGpio25 = 28, /**< Peripheral Output 25 */
  kTopDarjeelingPinmuxOutselGpioGpio26 = 29, /**< Peripheral Output 26 */
  kTopDarjeelingPinmuxOutselGpioGpio27 = 30, /**< Peripheral Output 27 */
  kTopDarjeelingPinmuxOutselGpioGpio28 = 31, /**< Peripheral Output 28 */
  kTopDarjeelingPinmuxOutselGpioGpio29 = 32, /**< Peripheral Output 29 */
  kTopDarjeelingPinmuxOutselGpioGpio30 = 33, /**< Peripheral Output 30 */
  kTopDarjeelingPinmuxOutselGpioGpio31 = 34, /**< Peripheral Output 31 */
  kTopDarjeelingPinmuxOutselLast = 34, /**< \internal Last valid outsel value */
} top_darjeeling_pinmux_outsel_t;

/**
 * Dedicated Pad Selects
 */
typedef enum top_darjeeling_direct_pads {
} top_darjeeling_direct_pads_t;

/**
 * Muxed Pad Selects
 */
typedef enum top_darjeeling_muxed_pads {
  kTopDarjeelingMuxedPadsMioSpare0 = 0, /**<  */
  kTopDarjeelingMuxedPadsLast = 0, /**< \internal Last valid muxed pad */
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
  kTopDarjeelingGateableClocksUsbPeri = 1, /**< Clock clk_usb_peri in group peri */
  kTopDarjeelingGateableClocksIoPeri = 2, /**< Clock clk_io_peri in group peri */
  kTopDarjeelingGateableClocksLast = 2, /**< \internal Last Valid Gateable Clock */
} top_darjeeling_gateable_clocks_t;

/**
 * Clock Manager Software-Hinted Clocks.
 *
 * The Software has partial control over these clocks. It can ask them to stop,
 * but the clock manager is in control of whether the clock actually is stopped.
 */
typedef enum top_darjeeling_hintable_clocks {
  kTopDarjeelingHintableClocksMainOtbn = 0, /**< Clock clk_main_otbn in group trans */
  kTopDarjeelingHintableClocksLast = 0, /**< \internal Last Valid Hintable Clock */
} top_darjeeling_hintable_clocks_t;

/**
 * MMIO Region
 *
 * MMIO region excludes any memory that is separate from the module
 * configuration space, i.e. ROM, main SRAM, and flash are excluded but
 * retention SRAM, spi_device memory, or usbdev memory are included.
 */
#define TOP_DARJEELING_MMIO_BASE_ADDR 0x21130000u
#define TOP_DARJEELING_MMIO_SIZE_BYTES 0xF3D0020u

// Header Extern Guard
#ifdef __cplusplus
}  // extern "C"
#endif

#endif  // OPENTITAN_SW_AUTOGEN_TOP_DARJEELING_H_
