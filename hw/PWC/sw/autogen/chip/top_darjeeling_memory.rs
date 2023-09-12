// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// This file was generated automatically.
// Please do not modify content of this file directly.
// File generated by using template: "toplevel_memory.rs.tpl"
// To regenerate this file follow OpenTitan topgen documentations.

#![allow(dead_code)]

//! Rust Top-Specific Definitions.
//!
//! This file contains const definitions for use within Rust code.

/// Memory base for sram_ctrl_ret_aon_ram_ret_aon in top darjeeling.
pub const TOP_DARJEELING_RAM_RET_AON_BASE_ADDR: usize = 0x40600000;

/// Memory size for sram_ctrl_ret_aon_ram_ret_aon in top darjeeling.
pub const TOP_DARJEELING_RAM_RET_AON_SIZE_BYTES: usize = 0x1000;
/// Memory base for sram_ctrl_main_ram_main in top darjeeling.
pub const TOP_DARJEELING_RAM_MAIN_BASE_ADDR: usize = 0x10000000;

/// Memory size for sram_ctrl_main_ram_main in top darjeeling.
pub const TOP_DARJEELING_RAM_MAIN_SIZE_BYTES: usize = 0x10000;
/// Memory base for sram_ctrl_mbox_ram_mbox in top darjeeling.
pub const TOP_DARJEELING_RAM_MBOX_BASE_ADDR: usize = 0x11000000;

/// Memory size for sram_ctrl_mbox_ram_mbox in top darjeeling.
pub const TOP_DARJEELING_RAM_MBOX_SIZE_BYTES: usize = 0x1000;

/// Peripheral base address for gpio in top darjeeling.
///
/// This should be used with #mmio_region_from_addr to access the memory-mapped
/// registers associated with the peripheral (usually via a DIF).
pub const TOP_DARJEELING_GPIO_BASE_ADDR: usize = 0x30000000;

/// Peripheral size for gpio in top darjeeling.
///
/// This is the size (in bytes) of the peripheral's reserved memory area. All
/// memory-mapped registers associated with this peripheral should have an
/// address between #TOP_DARJEELING_GPIO_BASE_ADDR and
/// `TOP_DARJEELING_GPIO_BASE_ADDR + TOP_DARJEELING_GPIO_SIZE_BYTES`.
pub const TOP_DARJEELING_GPIO_SIZE_BYTES: usize = 0x40;

/// Peripheral base address for rv_timer in top darjeeling.
///
/// This should be used with #mmio_region_from_addr to access the memory-mapped
/// registers associated with the peripheral (usually via a DIF).
pub const TOP_DARJEELING_RV_TIMER_BASE_ADDR: usize = 0x30100000;

/// Peripheral size for rv_timer in top darjeeling.
///
/// This is the size (in bytes) of the peripheral's reserved memory area. All
/// memory-mapped registers associated with this peripheral should have an
/// address between #TOP_DARJEELING_RV_TIMER_BASE_ADDR and
/// `TOP_DARJEELING_RV_TIMER_BASE_ADDR + TOP_DARJEELING_RV_TIMER_SIZE_BYTES`.
pub const TOP_DARJEELING_RV_TIMER_SIZE_BYTES: usize = 0x200;

/// Peripheral base address for alert_handler in top darjeeling.
///
/// This should be used with #mmio_region_from_addr to access the memory-mapped
/// registers associated with the peripheral (usually via a DIF).
pub const TOP_DARJEELING_ALERT_HANDLER_BASE_ADDR: usize = 0x30150000;

/// Peripheral size for alert_handler in top darjeeling.
///
/// This is the size (in bytes) of the peripheral's reserved memory area. All
/// memory-mapped registers associated with this peripheral should have an
/// address between #TOP_DARJEELING_ALERT_HANDLER_BASE_ADDR and
/// `TOP_DARJEELING_ALERT_HANDLER_BASE_ADDR + TOP_DARJEELING_ALERT_HANDLER_SIZE_BYTES`.
pub const TOP_DARJEELING_ALERT_HANDLER_SIZE_BYTES: usize = 0x800;

/// Peripheral base address for pwrmgr_aon in top darjeeling.
///
/// This should be used with #mmio_region_from_addr to access the memory-mapped
/// registers associated with the peripheral (usually via a DIF).
pub const TOP_DARJEELING_PWRMGR_AON_BASE_ADDR: usize = 0x30400000;

/// Peripheral size for pwrmgr_aon in top darjeeling.
///
/// This is the size (in bytes) of the peripheral's reserved memory area. All
/// memory-mapped registers associated with this peripheral should have an
/// address between #TOP_DARJEELING_PWRMGR_AON_BASE_ADDR and
/// `TOP_DARJEELING_PWRMGR_AON_BASE_ADDR + TOP_DARJEELING_PWRMGR_AON_SIZE_BYTES`.
pub const TOP_DARJEELING_PWRMGR_AON_SIZE_BYTES: usize = 0x80;

/// Peripheral base address for rstmgr_aon in top darjeeling.
///
/// This should be used with #mmio_region_from_addr to access the memory-mapped
/// registers associated with the peripheral (usually via a DIF).
pub const TOP_DARJEELING_RSTMGR_AON_BASE_ADDR: usize = 0x30410000;

/// Peripheral size for rstmgr_aon in top darjeeling.
///
/// This is the size (in bytes) of the peripheral's reserved memory area. All
/// memory-mapped registers associated with this peripheral should have an
/// address between #TOP_DARJEELING_RSTMGR_AON_BASE_ADDR and
/// `TOP_DARJEELING_RSTMGR_AON_BASE_ADDR + TOP_DARJEELING_RSTMGR_AON_SIZE_BYTES`.
pub const TOP_DARJEELING_RSTMGR_AON_SIZE_BYTES: usize = 0x80;

/// Peripheral base address for clkmgr_aon in top darjeeling.
///
/// This should be used with #mmio_region_from_addr to access the memory-mapped
/// registers associated with the peripheral (usually via a DIF).
pub const TOP_DARJEELING_CLKMGR_AON_BASE_ADDR: usize = 0x30420000;

/// Peripheral size for clkmgr_aon in top darjeeling.
///
/// This is the size (in bytes) of the peripheral's reserved memory area. All
/// memory-mapped registers associated with this peripheral should have an
/// address between #TOP_DARJEELING_CLKMGR_AON_BASE_ADDR and
/// `TOP_DARJEELING_CLKMGR_AON_BASE_ADDR + TOP_DARJEELING_CLKMGR_AON_SIZE_BYTES`.
pub const TOP_DARJEELING_CLKMGR_AON_SIZE_BYTES: usize = 0x80;

/// Peripheral base address for pinmux_aon in top darjeeling.
///
/// This should be used with #mmio_region_from_addr to access the memory-mapped
/// registers associated with the peripheral (usually via a DIF).
pub const TOP_DARJEELING_PINMUX_AON_BASE_ADDR: usize = 0x30460000;

/// Peripheral size for pinmux_aon in top darjeeling.
///
/// This is the size (in bytes) of the peripheral's reserved memory area. All
/// memory-mapped registers associated with this peripheral should have an
/// address between #TOP_DARJEELING_PINMUX_AON_BASE_ADDR and
/// `TOP_DARJEELING_PINMUX_AON_BASE_ADDR + TOP_DARJEELING_PINMUX_AON_SIZE_BYTES`.
pub const TOP_DARJEELING_PINMUX_AON_SIZE_BYTES: usize = 0x400;

/// Peripheral base address for aon_timer_aon in top darjeeling.
///
/// This should be used with #mmio_region_from_addr to access the memory-mapped
/// registers associated with the peripheral (usually via a DIF).
pub const TOP_DARJEELING_AON_TIMER_AON_BASE_ADDR: usize = 0x30470000;

/// Peripheral size for aon_timer_aon in top darjeeling.
///
/// This is the size (in bytes) of the peripheral's reserved memory area. All
/// memory-mapped registers associated with this peripheral should have an
/// address between #TOP_DARJEELING_AON_TIMER_AON_BASE_ADDR and
/// `TOP_DARJEELING_AON_TIMER_AON_BASE_ADDR + TOP_DARJEELING_AON_TIMER_AON_SIZE_BYTES`.
pub const TOP_DARJEELING_AON_TIMER_AON_SIZE_BYTES: usize = 0x40;

/// Peripheral base address for ast in top darjeeling.
///
/// This should be used with #mmio_region_from_addr to access the memory-mapped
/// registers associated with the peripheral (usually via a DIF).
pub const TOP_DARJEELING_AST_BASE_ADDR: usize = 0x30480000;

/// Peripheral size for ast in top darjeeling.
///
/// This is the size (in bytes) of the peripheral's reserved memory area. All
/// memory-mapped registers associated with this peripheral should have an
/// address between #TOP_DARJEELING_AST_BASE_ADDR and
/// `TOP_DARJEELING_AST_BASE_ADDR + TOP_DARJEELING_AST_SIZE_BYTES`.
pub const TOP_DARJEELING_AST_SIZE_BYTES: usize = 0x400;

/// Peripheral base address for regs device on sram_ctrl_ret_aon in top darjeeling.
///
/// This should be used with #mmio_region_from_addr to access the memory-mapped
/// registers associated with the peripheral (usually via a DIF).
pub const TOP_DARJEELING_SRAM_CTRL_RET_AON_REGS_BASE_ADDR: usize = 0x30500000;

/// Peripheral size for regs device on sram_ctrl_ret_aon in top darjeeling.
///
/// This is the size (in bytes) of the peripheral's reserved memory area. All
/// memory-mapped registers associated with this peripheral should have an
/// address between #TOP_DARJEELING_SRAM_CTRL_RET_AON_REGS_BASE_ADDR and
/// `TOP_DARJEELING_SRAM_CTRL_RET_AON_REGS_BASE_ADDR + TOP_DARJEELING_SRAM_CTRL_RET_AON_REGS_SIZE_BYTES`.
pub const TOP_DARJEELING_SRAM_CTRL_RET_AON_REGS_SIZE_BYTES: usize = 0x20;

/// Peripheral base address for ram device on sram_ctrl_ret_aon in top darjeeling.
///
/// This should be used with #mmio_region_from_addr to access the memory-mapped
/// registers associated with the peripheral (usually via a DIF).
pub const TOP_DARJEELING_SRAM_CTRL_RET_AON_RAM_BASE_ADDR: usize = 0x40600000;

/// Peripheral size for ram device on sram_ctrl_ret_aon in top darjeeling.
///
/// This is the size (in bytes) of the peripheral's reserved memory area. All
/// memory-mapped registers associated with this peripheral should have an
/// address between #TOP_DARJEELING_SRAM_CTRL_RET_AON_RAM_BASE_ADDR and
/// `TOP_DARJEELING_SRAM_CTRL_RET_AON_RAM_BASE_ADDR + TOP_DARJEELING_SRAM_CTRL_RET_AON_RAM_SIZE_BYTES`.
pub const TOP_DARJEELING_SRAM_CTRL_RET_AON_RAM_SIZE_BYTES: usize = 0x1000;

/// Peripheral base address for regs device on rv_dm in top darjeeling.
///
/// This should be used with #mmio_region_from_addr to access the memory-mapped
/// registers associated with the peripheral (usually via a DIF).
pub const TOP_DARJEELING_RV_DM_REGS_BASE_ADDR: usize = 0x21200000;

/// Peripheral size for regs device on rv_dm in top darjeeling.
///
/// This is the size (in bytes) of the peripheral's reserved memory area. All
/// memory-mapped registers associated with this peripheral should have an
/// address between #TOP_DARJEELING_RV_DM_REGS_BASE_ADDR and
/// `TOP_DARJEELING_RV_DM_REGS_BASE_ADDR + TOP_DARJEELING_RV_DM_REGS_SIZE_BYTES`.
pub const TOP_DARJEELING_RV_DM_REGS_SIZE_BYTES: usize = 0x4;

/// Peripheral base address for mem device on rv_dm in top darjeeling.
///
/// This should be used with #mmio_region_from_addr to access the memory-mapped
/// registers associated with the peripheral (usually via a DIF).
pub const TOP_DARJEELING_RV_DM_MEM_BASE_ADDR: usize = 0x40000;

/// Peripheral size for mem device on rv_dm in top darjeeling.
///
/// This is the size (in bytes) of the peripheral's reserved memory area. All
/// memory-mapped registers associated with this peripheral should have an
/// address between #TOP_DARJEELING_RV_DM_MEM_BASE_ADDR and
/// `TOP_DARJEELING_RV_DM_MEM_BASE_ADDR + TOP_DARJEELING_RV_DM_MEM_SIZE_BYTES`.
pub const TOP_DARJEELING_RV_DM_MEM_SIZE_BYTES: usize = 0x1000;

/// Peripheral base address for rv_plic in top darjeeling.
///
/// This should be used with #mmio_region_from_addr to access the memory-mapped
/// registers associated with the peripheral (usually via a DIF).
pub const TOP_DARJEELING_RV_PLIC_BASE_ADDR: usize = 0x28000000;

/// Peripheral size for rv_plic in top darjeeling.
///
/// This is the size (in bytes) of the peripheral's reserved memory area. All
/// memory-mapped registers associated with this peripheral should have an
/// address between #TOP_DARJEELING_RV_PLIC_BASE_ADDR and
/// `TOP_DARJEELING_RV_PLIC_BASE_ADDR + TOP_DARJEELING_RV_PLIC_SIZE_BYTES`.
pub const TOP_DARJEELING_RV_PLIC_SIZE_BYTES: usize = 0x8000000;

/// Peripheral base address for otbn in top darjeeling.
///
/// This should be used with #mmio_region_from_addr to access the memory-mapped
/// registers associated with the peripheral (usually via a DIF).
pub const TOP_DARJEELING_OTBN_BASE_ADDR: usize = 0x21130000;

/// Peripheral size for otbn in top darjeeling.
///
/// This is the size (in bytes) of the peripheral's reserved memory area. All
/// memory-mapped registers associated with this peripheral should have an
/// address between #TOP_DARJEELING_OTBN_BASE_ADDR and
/// `TOP_DARJEELING_OTBN_BASE_ADDR + TOP_DARJEELING_OTBN_SIZE_BYTES`.
pub const TOP_DARJEELING_OTBN_SIZE_BYTES: usize = 0x10000;

/// Peripheral base address for regs device on sram_ctrl_main in top darjeeling.
///
/// This should be used with #mmio_region_from_addr to access the memory-mapped
/// registers associated with the peripheral (usually via a DIF).
pub const TOP_DARJEELING_SRAM_CTRL_MAIN_REGS_BASE_ADDR: usize = 0x211C0000;

/// Peripheral size for regs device on sram_ctrl_main in top darjeeling.
///
/// This is the size (in bytes) of the peripheral's reserved memory area. All
/// memory-mapped registers associated with this peripheral should have an
/// address between #TOP_DARJEELING_SRAM_CTRL_MAIN_REGS_BASE_ADDR and
/// `TOP_DARJEELING_SRAM_CTRL_MAIN_REGS_BASE_ADDR + TOP_DARJEELING_SRAM_CTRL_MAIN_REGS_SIZE_BYTES`.
pub const TOP_DARJEELING_SRAM_CTRL_MAIN_REGS_SIZE_BYTES: usize = 0x20;

/// Peripheral base address for ram device on sram_ctrl_main in top darjeeling.
///
/// This should be used with #mmio_region_from_addr to access the memory-mapped
/// registers associated with the peripheral (usually via a DIF).
pub const TOP_DARJEELING_SRAM_CTRL_MAIN_RAM_BASE_ADDR: usize = 0x10000000;

/// Peripheral size for ram device on sram_ctrl_main in top darjeeling.
///
/// This is the size (in bytes) of the peripheral's reserved memory area. All
/// memory-mapped registers associated with this peripheral should have an
/// address between #TOP_DARJEELING_SRAM_CTRL_MAIN_RAM_BASE_ADDR and
/// `TOP_DARJEELING_SRAM_CTRL_MAIN_RAM_BASE_ADDR + TOP_DARJEELING_SRAM_CTRL_MAIN_RAM_SIZE_BYTES`.
pub const TOP_DARJEELING_SRAM_CTRL_MAIN_RAM_SIZE_BYTES: usize = 0x10000;

/// Peripheral base address for regs device on sram_ctrl_mbox in top darjeeling.
///
/// This should be used with #mmio_region_from_addr to access the memory-mapped
/// registers associated with the peripheral (usually via a DIF).
pub const TOP_DARJEELING_SRAM_CTRL_MBOX_REGS_BASE_ADDR: usize = 0x211D0000;

/// Peripheral size for regs device on sram_ctrl_mbox in top darjeeling.
///
/// This is the size (in bytes) of the peripheral's reserved memory area. All
/// memory-mapped registers associated with this peripheral should have an
/// address between #TOP_DARJEELING_SRAM_CTRL_MBOX_REGS_BASE_ADDR and
/// `TOP_DARJEELING_SRAM_CTRL_MBOX_REGS_BASE_ADDR + TOP_DARJEELING_SRAM_CTRL_MBOX_REGS_SIZE_BYTES`.
pub const TOP_DARJEELING_SRAM_CTRL_MBOX_REGS_SIZE_BYTES: usize = 0x20;

/// Peripheral base address for ram device on sram_ctrl_mbox in top darjeeling.
///
/// This should be used with #mmio_region_from_addr to access the memory-mapped
/// registers associated with the peripheral (usually via a DIF).
pub const TOP_DARJEELING_SRAM_CTRL_MBOX_RAM_BASE_ADDR: usize = 0x11000000;

/// Peripheral size for ram device on sram_ctrl_mbox in top darjeeling.
///
/// This is the size (in bytes) of the peripheral's reserved memory area. All
/// memory-mapped registers associated with this peripheral should have an
/// address between #TOP_DARJEELING_SRAM_CTRL_MBOX_RAM_BASE_ADDR and
/// `TOP_DARJEELING_SRAM_CTRL_MBOX_RAM_BASE_ADDR + TOP_DARJEELING_SRAM_CTRL_MBOX_RAM_SIZE_BYTES`.
pub const TOP_DARJEELING_SRAM_CTRL_MBOX_RAM_SIZE_BYTES: usize = 0x1000;

/// Peripheral base address for cfg device on rv_core_ibex in top darjeeling.
///
/// This should be used with #mmio_region_from_addr to access the memory-mapped
/// registers associated with the peripheral (usually via a DIF).
pub const TOP_DARJEELING_RV_CORE_IBEX_CFG_BASE_ADDR: usize = 0x211F0000;

/// Peripheral size for cfg device on rv_core_ibex in top darjeeling.
///
/// This is the size (in bytes) of the peripheral's reserved memory area. All
/// memory-mapped registers associated with this peripheral should have an
/// address between #TOP_DARJEELING_RV_CORE_IBEX_CFG_BASE_ADDR and
/// `TOP_DARJEELING_RV_CORE_IBEX_CFG_BASE_ADDR + TOP_DARJEELING_RV_CORE_IBEX_CFG_SIZE_BYTES`.
pub const TOP_DARJEELING_RV_CORE_IBEX_CFG_SIZE_BYTES: usize = 0x800;

/// MMIO Region
///
/// MMIO region excludes any memory that is separate from the module
/// configuration space, i.e. ROM, main SRAM, and flash are excluded but
/// retention SRAM, spi_device memory, or usbdev memory are included.
pub const TOP_DARJEELING_MMIO_BASE_ADDR: usize = 0x21130000;
pub const TOP_DARJEELING_MMIO_SIZE_BYTES: usize = 0xF3D0020;
