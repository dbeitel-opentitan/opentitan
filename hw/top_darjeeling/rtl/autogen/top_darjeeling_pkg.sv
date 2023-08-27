// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// ------------------- W A R N I N G: A U T O - G E N E R A T E D   C O D E !! -------------------//
// PLEASE DO NOT HAND-EDIT THIS FILE. IT HAS BEEN AUTO-GENERATED WITH THE FOLLOWING COMMAND:
//
// util/topgen.py -t hw/top_darjeeling/data/top_darjeeling.hjson \
//                -o hw/top_darjeeling/ \
//                --rnd_cnst_seed 4881560218908238235

package top_darjeeling_pkg;
  /**
   * Peripheral base address for uart0 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_UART0_BASE_ADDR = 32'h30010000;

  /**
   * Peripheral size in bytes for uart0 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_UART0_SIZE_BYTES = 32'h40;

  /**
   * Peripheral base address for uart1 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_UART1_BASE_ADDR = 32'h31000000;

  /**
   * Peripheral size in bytes for uart1 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_UART1_SIZE_BYTES = 32'h40;

  /**
   * Peripheral base address for uart2 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_UART2_BASE_ADDR = 32'h31010000;

  /**
   * Peripheral size in bytes for uart2 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_UART2_SIZE_BYTES = 32'h40;

  /**
   * Peripheral base address for uart3 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_UART3_BASE_ADDR = 32'h31020000;

  /**
   * Peripheral size in bytes for uart3 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_UART3_SIZE_BYTES = 32'h40;

  /**
   * Peripheral base address for gpio in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_GPIO_BASE_ADDR = 32'h30000000;

  /**
   * Peripheral size in bytes for gpio in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_GPIO_SIZE_BYTES = 32'h40;

  /**
   * Peripheral base address for spi_device in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SPI_DEVICE_BASE_ADDR = 32'h30310000;

  /**
   * Peripheral size in bytes for spi_device in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SPI_DEVICE_SIZE_BYTES = 32'h2000;

  /**
   * Peripheral base address for i2c0 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_I2C0_BASE_ADDR = 32'h30080000;

  /**
   * Peripheral size in bytes for i2c0 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_I2C0_SIZE_BYTES = 32'h80;

  /**
   * Peripheral base address for i2c1 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_I2C1_BASE_ADDR = 32'h31030000;

  /**
   * Peripheral size in bytes for i2c1 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_I2C1_SIZE_BYTES = 32'h80;

  /**
   * Peripheral base address for i2c2 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_I2C2_BASE_ADDR = 32'h31040000;

  /**
   * Peripheral size in bytes for i2c2 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_I2C2_SIZE_BYTES = 32'h80;

  /**
   * Peripheral base address for rv_timer in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_RV_TIMER_BASE_ADDR = 32'h30100000;

  /**
   * Peripheral size in bytes for rv_timer in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_RV_TIMER_SIZE_BYTES = 32'h200;

  /**
   * Peripheral base address for core device on otp_ctrl in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_OTP_CTRL_CORE_BASE_ADDR = 32'h30130000;

  /**
   * Peripheral size in bytes for core device on otp_ctrl in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_OTP_CTRL_CORE_SIZE_BYTES = 32'h2000;

  /**
   * Peripheral base address for prim device on otp_ctrl in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_OTP_CTRL_PRIM_BASE_ADDR = 32'h30134000;

  /**
   * Peripheral size in bytes for prim device on otp_ctrl in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_OTP_CTRL_PRIM_SIZE_BYTES = 32'h20;

  /**
   * Peripheral base address for lc_ctrl in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_LC_CTRL_BASE_ADDR = 32'h30140000;

  /**
   * Peripheral size in bytes for lc_ctrl in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_LC_CTRL_SIZE_BYTES = 32'h100;

  /**
   * Peripheral base address for alert_handler in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_ALERT_HANDLER_BASE_ADDR = 32'h30150000;

  /**
   * Peripheral size in bytes for alert_handler in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_ALERT_HANDLER_SIZE_BYTES = 32'h800;

  /**
   * Peripheral base address for spi_host0 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SPI_HOST0_BASE_ADDR = 32'h30300000;

  /**
   * Peripheral size in bytes for spi_host0 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SPI_HOST0_SIZE_BYTES = 32'h40;

  /**
   * Peripheral base address for spi_host1 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SPI_HOST1_BASE_ADDR = 32'h32000000;

  /**
   * Peripheral size in bytes for spi_host1 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SPI_HOST1_SIZE_BYTES = 32'h40;

  /**
   * Peripheral base address for usbdev in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_USBDEV_BASE_ADDR = 32'h32010000;

  /**
   * Peripheral size in bytes for usbdev in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_USBDEV_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for pwrmgr_aon in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_PWRMGR_AON_BASE_ADDR = 32'h30400000;

  /**
   * Peripheral size in bytes for pwrmgr_aon in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_PWRMGR_AON_SIZE_BYTES = 32'h80;

  /**
   * Peripheral base address for rstmgr_aon in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_RSTMGR_AON_BASE_ADDR = 32'h30410000;

  /**
   * Peripheral size in bytes for rstmgr_aon in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_RSTMGR_AON_SIZE_BYTES = 32'h80;

  /**
   * Peripheral base address for clkmgr_aon in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_CLKMGR_AON_BASE_ADDR = 32'h30420000;

  /**
   * Peripheral size in bytes for clkmgr_aon in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_CLKMGR_AON_SIZE_BYTES = 32'h80;

  /**
   * Peripheral base address for sysrst_ctrl_aon in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SYSRST_CTRL_AON_BASE_ADDR = 32'h31060000;

  /**
   * Peripheral size in bytes for sysrst_ctrl_aon in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SYSRST_CTRL_AON_SIZE_BYTES = 32'h100;

  /**
   * Peripheral base address for adc_ctrl_aon in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_ADC_CTRL_AON_BASE_ADDR = 32'h31070000;

  /**
   * Peripheral size in bytes for adc_ctrl_aon in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_ADC_CTRL_AON_SIZE_BYTES = 32'h80;

  /**
   * Peripheral base address for pinmux_aon in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_PINMUX_AON_BASE_ADDR = 32'h30460000;

  /**
   * Peripheral size in bytes for pinmux_aon in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_PINMUX_AON_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for aon_timer_aon in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_AON_TIMER_AON_BASE_ADDR = 32'h30470000;

  /**
   * Peripheral size in bytes for aon_timer_aon in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_AON_TIMER_AON_SIZE_BYTES = 32'h40;

  /**
   * Peripheral base address for ast in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_AST_BASE_ADDR = 32'h30480000;

  /**
   * Peripheral size in bytes for ast in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_AST_SIZE_BYTES = 32'h400;

  /**
   * Peripheral base address for sensor_ctrl in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SENSOR_CTRL_BASE_ADDR = 32'h30020000;

  /**
   * Peripheral size in bytes for sensor_ctrl in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SENSOR_CTRL_SIZE_BYTES = 32'h40;

  /**
   * Peripheral base address for core device on soc_proxy in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SOC_PROXY_CORE_BASE_ADDR = 32'h22030000;

  /**
   * Peripheral size in bytes for core device on soc_proxy in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SOC_PROXY_CORE_SIZE_BYTES = 32'h4;

  /**
   * Peripheral base address for ctn device on soc_proxy in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SOC_PROXY_CTN_BASE_ADDR = 32'h40000000;

  /**
   * Peripheral size in bytes for ctn device on soc_proxy in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SOC_PROXY_CTN_SIZE_BYTES = 32'h40000000;

  /**
   * Peripheral base address for regs device on sram_ctrl_ret_aon in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SRAM_CTRL_RET_AON_REGS_BASE_ADDR = 32'h30500000;

  /**
   * Peripheral size in bytes for regs device on sram_ctrl_ret_aon in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SRAM_CTRL_RET_AON_REGS_SIZE_BYTES = 32'h20;

  /**
   * Peripheral base address for ram device on sram_ctrl_ret_aon in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SRAM_CTRL_RET_AON_RAM_BASE_ADDR = 32'h30600000;

  /**
   * Peripheral size in bytes for ram device on sram_ctrl_ret_aon in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SRAM_CTRL_RET_AON_RAM_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for core device on flash_ctrl in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_FLASH_CTRL_CORE_BASE_ADDR = 32'h33000000;

  /**
   * Peripheral size in bytes for core device on flash_ctrl in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_FLASH_CTRL_CORE_SIZE_BYTES = 32'h200;

  /**
   * Peripheral base address for prim device on flash_ctrl in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_FLASH_CTRL_PRIM_BASE_ADDR = 32'h33008000;

  /**
   * Peripheral size in bytes for prim device on flash_ctrl in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_FLASH_CTRL_PRIM_SIZE_BYTES = 32'h80;

  /**
   * Peripheral base address for mem device on flash_ctrl in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_FLASH_CTRL_MEM_BASE_ADDR = 32'h34000000;

  /**
   * Peripheral size in bytes for mem device on flash_ctrl in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_FLASH_CTRL_MEM_SIZE_BYTES = 32'h100000;

  /**
   * Peripheral base address for regs device on rv_dm in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_RV_DM_REGS_BASE_ADDR = 32'h21200000;

  /**
   * Peripheral size in bytes for regs device on rv_dm in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_RV_DM_REGS_SIZE_BYTES = 32'h4;

  /**
   * Peripheral base address for mem device on rv_dm in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_RV_DM_MEM_BASE_ADDR = 32'h40000;

  /**
   * Peripheral size in bytes for mem device on rv_dm in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_RV_DM_MEM_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for rv_plic in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_RV_PLIC_BASE_ADDR = 32'h28000000;

  /**
   * Peripheral size in bytes for rv_plic in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_RV_PLIC_SIZE_BYTES = 32'h8000000;

  /**
   * Peripheral base address for aes in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_AES_BASE_ADDR = 32'h21100000;

  /**
   * Peripheral size in bytes for aes in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_AES_SIZE_BYTES = 32'h100;

  /**
   * Peripheral base address for hmac in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_HMAC_BASE_ADDR = 32'h21110000;

  /**
   * Peripheral size in bytes for hmac in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_HMAC_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for kmac in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_KMAC_BASE_ADDR = 32'h21120000;

  /**
   * Peripheral size in bytes for kmac in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_KMAC_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for otbn in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_OTBN_BASE_ADDR = 32'h21130000;

  /**
   * Peripheral size in bytes for otbn in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_OTBN_SIZE_BYTES = 32'h10000;

  /**
   * Peripheral base address for keymgr in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_KEYMGR_BASE_ADDR = 32'h21140000;

  /**
   * Peripheral size in bytes for keymgr in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_KEYMGR_SIZE_BYTES = 32'h100;

  /**
   * Peripheral base address for csrng in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_CSRNG_BASE_ADDR = 32'h21150000;

  /**
   * Peripheral size in bytes for csrng in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_CSRNG_SIZE_BYTES = 32'h80;

  /**
   * Peripheral base address for entropy_src in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_ENTROPY_SRC_BASE_ADDR = 32'h21160000;

  /**
   * Peripheral size in bytes for entropy_src in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_ENTROPY_SRC_SIZE_BYTES = 32'h100;

  /**
   * Peripheral base address for edn0 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_EDN0_BASE_ADDR = 32'h21170000;

  /**
   * Peripheral size in bytes for edn0 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_EDN0_SIZE_BYTES = 32'h80;

  /**
   * Peripheral base address for edn1 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_EDN1_BASE_ADDR = 32'h21180000;

  /**
   * Peripheral size in bytes for edn1 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_EDN1_SIZE_BYTES = 32'h80;

  /**
   * Peripheral base address for regs device on sram_ctrl_main in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SRAM_CTRL_MAIN_REGS_BASE_ADDR = 32'h211C0000;

  /**
   * Peripheral size in bytes for regs device on sram_ctrl_main in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SRAM_CTRL_MAIN_REGS_SIZE_BYTES = 32'h20;

  /**
   * Peripheral base address for ram device on sram_ctrl_main in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SRAM_CTRL_MAIN_RAM_BASE_ADDR = 32'h10000000;

  /**
   * Peripheral size in bytes for ram device on sram_ctrl_main in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SRAM_CTRL_MAIN_RAM_SIZE_BYTES = 32'h10000;

  /**
   * Peripheral base address for regs device on sram_ctrl_mbox in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SRAM_CTRL_MBOX_REGS_BASE_ADDR = 32'h211D0000;

  /**
   * Peripheral size in bytes for regs device on sram_ctrl_mbox in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SRAM_CTRL_MBOX_REGS_SIZE_BYTES = 32'h20;

  /**
   * Peripheral base address for ram device on sram_ctrl_mbox in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SRAM_CTRL_MBOX_RAM_BASE_ADDR = 32'h11000000;

  /**
   * Peripheral size in bytes for ram device on sram_ctrl_mbox in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_SRAM_CTRL_MBOX_RAM_SIZE_BYTES = 32'h1000;

  /**
   * Peripheral base address for regs device on rom_ctrl0 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_ROM_CTRL0_REGS_BASE_ADDR = 32'h211E0000;

  /**
   * Peripheral size in bytes for regs device on rom_ctrl0 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_ROM_CTRL0_REGS_SIZE_BYTES = 32'h80;

  /**
   * Peripheral base address for rom device on rom_ctrl0 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_ROM_CTRL0_ROM_BASE_ADDR = 32'h8000;

  /**
   * Peripheral size in bytes for rom device on rom_ctrl0 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_ROM_CTRL0_ROM_SIZE_BYTES = 32'h8000;

  /**
   * Peripheral base address for regs device on rom_ctrl1 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_ROM_CTRL1_REGS_BASE_ADDR = 32'h211E1000;

  /**
   * Peripheral size in bytes for regs device on rom_ctrl1 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_ROM_CTRL1_REGS_SIZE_BYTES = 32'h80;

  /**
   * Peripheral base address for rom device on rom_ctrl1 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_ROM_CTRL1_ROM_BASE_ADDR = 32'h10000;

  /**
   * Peripheral size in bytes for rom device on rom_ctrl1 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_ROM_CTRL1_ROM_SIZE_BYTES = 32'h10000;

  /**
   * Peripheral base address for cfg device on rv_core_ibex in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_RV_CORE_IBEX_CFG_BASE_ADDR = 32'h211F0000;

  /**
   * Peripheral size in bytes for cfg device on rv_core_ibex in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_RV_CORE_IBEX_CFG_SIZE_BYTES = 32'h800;

  /**
   * Memory base address for ctn in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_CTN_BASE_ADDR = 32'h40000000;

  /**
   * Memory size for ctn in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_CTN_SIZE_BYTES = 32'h40000000;

  /**
   * Memory base address for ram_ret_aon in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_RAM_RET_AON_BASE_ADDR = 32'h30600000;

  /**
   * Memory size for ram_ret_aon in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_RAM_RET_AON_SIZE_BYTES = 32'h1000;

  /**
   * Memory base address for eflash in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_EFLASH_BASE_ADDR = 32'h34000000;

  /**
   * Memory size for eflash in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_EFLASH_SIZE_BYTES = 32'h100000;

  /**
   * Memory base address for ram_main in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_RAM_MAIN_BASE_ADDR = 32'h10000000;

  /**
   * Memory size for ram_main in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_RAM_MAIN_SIZE_BYTES = 32'h10000;

  /**
   * Memory base address for ram_mbox in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_RAM_MBOX_BASE_ADDR = 32'h11000000;

  /**
   * Memory size for ram_mbox in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_RAM_MBOX_SIZE_BYTES = 32'h1000;

  /**
   * Memory base address for rom0 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_ROM0_BASE_ADDR = 32'h8000;

  /**
   * Memory size for rom0 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_ROM0_SIZE_BYTES = 32'h8000;

  /**
   * Memory base address for rom1 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_ROM1_BASE_ADDR = 32'h10000;

  /**
   * Memory size for rom1 in top darjeeling.
   */
  parameter int unsigned TOP_DARJEELING_ROM1_SIZE_BYTES = 32'h10000;


  // Enumeration of alert modules
  typedef enum int unsigned {
    TopDarjeelingAlertPeripheralUart0 = 0,
    TopDarjeelingAlertPeripheralUart1 = 1,
    TopDarjeelingAlertPeripheralUart2 = 2,
    TopDarjeelingAlertPeripheralUart3 = 3,
    TopDarjeelingAlertPeripheralGpio = 4,
    TopDarjeelingAlertPeripheralSpiDevice = 5,
    TopDarjeelingAlertPeripheralI2c0 = 6,
    TopDarjeelingAlertPeripheralI2c1 = 7,
    TopDarjeelingAlertPeripheralI2c2 = 8,
    TopDarjeelingAlertPeripheralRvTimer = 9,
    TopDarjeelingAlertPeripheralOtpCtrl = 10,
    TopDarjeelingAlertPeripheralLcCtrl = 11,
    TopDarjeelingAlertPeripheralSpiHost0 = 12,
    TopDarjeelingAlertPeripheralSpiHost1 = 13,
    TopDarjeelingAlertPeripheralUsbdev = 14,
    TopDarjeelingAlertPeripheralPwrmgrAon = 15,
    TopDarjeelingAlertPeripheralRstmgrAon = 16,
    TopDarjeelingAlertPeripheralClkmgrAon = 17,
    TopDarjeelingAlertPeripheralSysrstCtrlAon = 18,
    TopDarjeelingAlertPeripheralAdcCtrlAon = 19,
    TopDarjeelingAlertPeripheralPinmuxAon = 20,
    TopDarjeelingAlertPeripheralAonTimerAon = 21,
    TopDarjeelingAlertPeripheralSensorCtrl = 22,
    TopDarjeelingAlertPeripheralSocProxy = 23,
    TopDarjeelingAlertPeripheralSramCtrlRetAon = 24,
    TopDarjeelingAlertPeripheralFlashCtrl = 25,
    TopDarjeelingAlertPeripheralRvDm = 26,
    TopDarjeelingAlertPeripheralRvPlic = 27,
    TopDarjeelingAlertPeripheralAes = 28,
    TopDarjeelingAlertPeripheralHmac = 29,
    TopDarjeelingAlertPeripheralKmac = 30,
    TopDarjeelingAlertPeripheralOtbn = 31,
    TopDarjeelingAlertPeripheralKeymgr = 32,
    TopDarjeelingAlertPeripheralCsrng = 33,
    TopDarjeelingAlertPeripheralEntropySrc = 34,
    TopDarjeelingAlertPeripheralEdn0 = 35,
    TopDarjeelingAlertPeripheralEdn1 = 36,
    TopDarjeelingAlertPeripheralSramCtrlMain = 37,
    TopDarjeelingAlertPeripheralSramCtrlMbox = 38,
    TopDarjeelingAlertPeripheralRomCtrl0 = 39,
    TopDarjeelingAlertPeripheralRomCtrl1 = 40,
    TopDarjeelingAlertPeripheralRvCoreIbex = 41,
    TopDarjeelingAlertPeripheralCount
  } alert_peripheral_e;

  // Enumeration of alerts
  typedef enum int unsigned {
    TopDarjeelingAlertIdUart0FatalFault = 0,
    TopDarjeelingAlertIdUart1FatalFault = 1,
    TopDarjeelingAlertIdUart2FatalFault = 2,
    TopDarjeelingAlertIdUart3FatalFault = 3,
    TopDarjeelingAlertIdGpioFatalFault = 4,
    TopDarjeelingAlertIdSpiDeviceFatalFault = 5,
    TopDarjeelingAlertIdI2c0FatalFault = 6,
    TopDarjeelingAlertIdI2c1FatalFault = 7,
    TopDarjeelingAlertIdI2c2FatalFault = 8,
    TopDarjeelingAlertIdRvTimerFatalFault = 9,
    TopDarjeelingAlertIdOtpCtrlFatalMacroError = 10,
    TopDarjeelingAlertIdOtpCtrlFatalCheckError = 11,
    TopDarjeelingAlertIdOtpCtrlFatalBusIntegError = 12,
    TopDarjeelingAlertIdOtpCtrlFatalPrimOtpAlert = 13,
    TopDarjeelingAlertIdOtpCtrlRecovPrimOtpAlert = 14,
    TopDarjeelingAlertIdLcCtrlFatalProgError = 15,
    TopDarjeelingAlertIdLcCtrlFatalStateError = 16,
    TopDarjeelingAlertIdLcCtrlFatalBusIntegError = 17,
    TopDarjeelingAlertIdSpiHost0FatalFault = 18,
    TopDarjeelingAlertIdSpiHost1FatalFault = 19,
    TopDarjeelingAlertIdUsbdevFatalFault = 20,
    TopDarjeelingAlertIdPwrmgrAonFatalFault = 21,
    TopDarjeelingAlertIdRstmgrAonFatalFault = 22,
    TopDarjeelingAlertIdRstmgrAonFatalCnstyFault = 23,
    TopDarjeelingAlertIdClkmgrAonRecovFault = 24,
    TopDarjeelingAlertIdClkmgrAonFatalFault = 25,
    TopDarjeelingAlertIdSysrstCtrlAonFatalFault = 26,
    TopDarjeelingAlertIdAdcCtrlAonFatalFault = 27,
    TopDarjeelingAlertIdPinmuxAonFatalFault = 28,
    TopDarjeelingAlertIdAonTimerAonFatalFault = 29,
    TopDarjeelingAlertIdSensorCtrlRecovAlert = 30,
    TopDarjeelingAlertIdSensorCtrlFatalAlert = 31,
    TopDarjeelingAlertIdSocProxyFatalAlertIntg = 32,
    TopDarjeelingAlertIdSramCtrlRetAonFatalError = 33,
    TopDarjeelingAlertIdFlashCtrlRecovErr = 34,
    TopDarjeelingAlertIdFlashCtrlFatalStdErr = 35,
    TopDarjeelingAlertIdFlashCtrlFatalErr = 36,
    TopDarjeelingAlertIdFlashCtrlFatalPrimFlashAlert = 37,
    TopDarjeelingAlertIdFlashCtrlRecovPrimFlashAlert = 38,
    TopDarjeelingAlertIdRvDmFatalFault = 39,
    TopDarjeelingAlertIdRvPlicFatalFault = 40,
    TopDarjeelingAlertIdAesRecovCtrlUpdateErr = 41,
    TopDarjeelingAlertIdAesFatalFault = 42,
    TopDarjeelingAlertIdHmacFatalFault = 43,
    TopDarjeelingAlertIdKmacRecovOperationErr = 44,
    TopDarjeelingAlertIdKmacFatalFaultErr = 45,
    TopDarjeelingAlertIdOtbnFatal = 46,
    TopDarjeelingAlertIdOtbnRecov = 47,
    TopDarjeelingAlertIdKeymgrRecovOperationErr = 48,
    TopDarjeelingAlertIdKeymgrFatalFaultErr = 49,
    TopDarjeelingAlertIdCsrngRecovAlert = 50,
    TopDarjeelingAlertIdCsrngFatalAlert = 51,
    TopDarjeelingAlertIdEntropySrcRecovAlert = 52,
    TopDarjeelingAlertIdEntropySrcFatalAlert = 53,
    TopDarjeelingAlertIdEdn0RecovAlert = 54,
    TopDarjeelingAlertIdEdn0FatalAlert = 55,
    TopDarjeelingAlertIdEdn1RecovAlert = 56,
    TopDarjeelingAlertIdEdn1FatalAlert = 57,
    TopDarjeelingAlertIdSramCtrlMainFatalError = 58,
    TopDarjeelingAlertIdSramCtrlMboxFatalError = 59,
    TopDarjeelingAlertIdRomCtrl0Fatal = 60,
    TopDarjeelingAlertIdRomCtrl1Fatal = 61,
    TopDarjeelingAlertIdRvCoreIbexFatalSwErr = 62,
    TopDarjeelingAlertIdRvCoreIbexRecovSwErr = 63,
    TopDarjeelingAlertIdRvCoreIbexFatalHwErr = 64,
    TopDarjeelingAlertIdRvCoreIbexRecovHwErr = 65,
    TopDarjeelingAlertIdCount
  } alert_id_e;

  // Enumeration of IO power domains.
  // Only used in ASIC target.
  typedef enum logic [2:0] {
    IoBankVcc = 0,
    IoBankAvcc = 1,
    IoBankVioa = 2,
    IoBankViob = 3,
    IoBankCount = 4
  } pwr_dom_e;

  // Enumeration for MIO signals on the top-level.
  typedef enum int unsigned {
    MioInGpioGpio0 = 0,
    MioInGpioGpio1 = 1,
    MioInGpioGpio2 = 2,
    MioInGpioGpio3 = 3,
    MioInGpioGpio4 = 4,
    MioInGpioGpio5 = 5,
    MioInGpioGpio6 = 6,
    MioInGpioGpio7 = 7,
    MioInGpioGpio8 = 8,
    MioInGpioGpio9 = 9,
    MioInGpioGpio10 = 10,
    MioInGpioGpio11 = 11,
    MioInGpioGpio12 = 12,
    MioInGpioGpio13 = 13,
    MioInGpioGpio14 = 14,
    MioInGpioGpio15 = 15,
    MioInGpioGpio16 = 16,
    MioInGpioGpio17 = 17,
    MioInGpioGpio18 = 18,
    MioInGpioGpio19 = 19,
    MioInGpioGpio20 = 20,
    MioInGpioGpio21 = 21,
    MioInGpioGpio22 = 22,
    MioInGpioGpio23 = 23,
    MioInGpioGpio24 = 24,
    MioInGpioGpio25 = 25,
    MioInGpioGpio26 = 26,
    MioInGpioGpio27 = 27,
    MioInGpioGpio28 = 28,
    MioInGpioGpio29 = 29,
    MioInGpioGpio30 = 30,
    MioInGpioGpio31 = 31,
    MioInI2c0Sda = 32,
    MioInI2c0Scl = 33,
    MioInI2c1Sda = 34,
    MioInI2c1Scl = 35,
    MioInI2c2Sda = 36,
    MioInI2c2Scl = 37,
    MioInSpiHost1Sd0 = 38,
    MioInSpiHost1Sd1 = 39,
    MioInSpiHost1Sd2 = 40,
    MioInSpiHost1Sd3 = 41,
    MioInUart0Rx = 42,
    MioInUart1Rx = 43,
    MioInUart2Rx = 44,
    MioInUart3Rx = 45,
    MioInSpiDeviceTpmCsb = 46,
    MioInFlashCtrlTck = 47,
    MioInFlashCtrlTms = 48,
    MioInFlashCtrlTdi = 49,
    MioInSysrstCtrlAonAcPresent = 50,
    MioInSysrstCtrlAonKey0In = 51,
    MioInSysrstCtrlAonKey1In = 52,
    MioInSysrstCtrlAonKey2In = 53,
    MioInSysrstCtrlAonPwrbIn = 54,
    MioInSysrstCtrlAonLidOpen = 55,
    MioInUsbdevSense = 56,
    MioInCount = 57
  } mio_in_e;

  typedef enum {
    MioOutGpioGpio0 = 0,
    MioOutGpioGpio1 = 1,
    MioOutGpioGpio2 = 2,
    MioOutGpioGpio3 = 3,
    MioOutGpioGpio4 = 4,
    MioOutGpioGpio5 = 5,
    MioOutGpioGpio6 = 6,
    MioOutGpioGpio7 = 7,
    MioOutGpioGpio8 = 8,
    MioOutGpioGpio9 = 9,
    MioOutGpioGpio10 = 10,
    MioOutGpioGpio11 = 11,
    MioOutGpioGpio12 = 12,
    MioOutGpioGpio13 = 13,
    MioOutGpioGpio14 = 14,
    MioOutGpioGpio15 = 15,
    MioOutGpioGpio16 = 16,
    MioOutGpioGpio17 = 17,
    MioOutGpioGpio18 = 18,
    MioOutGpioGpio19 = 19,
    MioOutGpioGpio20 = 20,
    MioOutGpioGpio21 = 21,
    MioOutGpioGpio22 = 22,
    MioOutGpioGpio23 = 23,
    MioOutGpioGpio24 = 24,
    MioOutGpioGpio25 = 25,
    MioOutGpioGpio26 = 26,
    MioOutGpioGpio27 = 27,
    MioOutGpioGpio28 = 28,
    MioOutGpioGpio29 = 29,
    MioOutGpioGpio30 = 30,
    MioOutGpioGpio31 = 31,
    MioOutI2c0Sda = 32,
    MioOutI2c0Scl = 33,
    MioOutI2c1Sda = 34,
    MioOutI2c1Scl = 35,
    MioOutI2c2Sda = 36,
    MioOutI2c2Scl = 37,
    MioOutSpiHost1Sd0 = 38,
    MioOutSpiHost1Sd1 = 39,
    MioOutSpiHost1Sd2 = 40,
    MioOutSpiHost1Sd3 = 41,
    MioOutUart0Tx = 42,
    MioOutUart1Tx = 43,
    MioOutUart2Tx = 44,
    MioOutUart3Tx = 45,
    MioOutSpiHost1Sck = 46,
    MioOutSpiHost1Csb = 47,
    MioOutFlashCtrlTdo = 48,
    MioOutSensorCtrlAstDebugOut0 = 49,
    MioOutSensorCtrlAstDebugOut1 = 50,
    MioOutSensorCtrlAstDebugOut2 = 51,
    MioOutSensorCtrlAstDebugOut3 = 52,
    MioOutSensorCtrlAstDebugOut4 = 53,
    MioOutSensorCtrlAstDebugOut5 = 54,
    MioOutSensorCtrlAstDebugOut6 = 55,
    MioOutSensorCtrlAstDebugOut7 = 56,
    MioOutSensorCtrlAstDebugOut8 = 57,
    MioOutOtpCtrlTest0 = 58,
    MioOutSysrstCtrlAonBatDisable = 59,
    MioOutSysrstCtrlAonKey0Out = 60,
    MioOutSysrstCtrlAonKey1Out = 61,
    MioOutSysrstCtrlAonKey2Out = 62,
    MioOutSysrstCtrlAonPwrbOut = 63,
    MioOutSysrstCtrlAonZ3Wakeup = 64,
    MioOutCount = 65
  } mio_out_e;

  // Enumeration for DIO signals, used on both the top and chip-levels.
  typedef enum int unsigned {
    DioUsbdevUsbDp = 0,
    DioUsbdevUsbDn = 1,
    DioSpiHost0Sd0 = 2,
    DioSpiHost0Sd1 = 3,
    DioSpiHost0Sd2 = 4,
    DioSpiHost0Sd3 = 5,
    DioSpiDeviceSd0 = 6,
    DioSpiDeviceSd1 = 7,
    DioSpiDeviceSd2 = 8,
    DioSpiDeviceSd3 = 9,
    DioSysrstCtrlAonEcRstL = 10,
    DioSysrstCtrlAonFlashWpL = 11,
    DioSpiDeviceSck = 12,
    DioSpiDeviceCsb = 13,
    DioSpiHost0Sck = 14,
    DioSpiHost0Csb = 15,
    DioCount = 16
  } dio_e;

  // Enumeration for the types of pads.
  typedef enum {
    MioPad,
    DioPad
  } pad_type_e;

  // Raw MIO/DIO input array indices on chip-level.
  // TODO: Does not account for target specific stubbed/added pads.
  // Need to make a target-specific package for those.
  typedef enum int unsigned {
    MioPadIoa0 = 0,
    MioPadIoa1 = 1,
    MioPadIoa2 = 2,
    MioPadIoa3 = 3,
    MioPadIoa4 = 4,
    MioPadIoa5 = 5,
    MioPadIoa6 = 6,
    MioPadIoa7 = 7,
    MioPadIoa8 = 8,
    MioPadIob0 = 9,
    MioPadIob1 = 10,
    MioPadIob2 = 11,
    MioPadIob3 = 12,
    MioPadIob4 = 13,
    MioPadIob5 = 14,
    MioPadIob6 = 15,
    MioPadIob7 = 16,
    MioPadIob8 = 17,
    MioPadIob9 = 18,
    MioPadIob10 = 19,
    MioPadIob11 = 20,
    MioPadIob12 = 21,
    MioPadIoc0 = 22,
    MioPadIoc1 = 23,
    MioPadIoc2 = 24,
    MioPadIoc3 = 25,
    MioPadIoc4 = 26,
    MioPadIoc5 = 27,
    MioPadIoc6 = 28,
    MioPadIoc7 = 29,
    MioPadIoc8 = 30,
    MioPadIoc9 = 31,
    MioPadIoc10 = 32,
    MioPadIoc11 = 33,
    MioPadIoc12 = 34,
    MioPadIor0 = 35,
    MioPadIor1 = 36,
    MioPadIor2 = 37,
    MioPadIor3 = 38,
    MioPadIor4 = 39,
    MioPadIor5 = 40,
    MioPadIor6 = 41,
    MioPadIor7 = 42,
    MioPadIor10 = 43,
    MioPadIor11 = 44,
    MioPadIor12 = 45,
    MioPadIor13 = 46,
    MioPadCount
  } mio_pad_e;

  typedef enum int unsigned {
    DioPadPorN = 0,
    DioPadUsbP = 1,
    DioPadUsbN = 2,
    DioPadCc1 = 3,
    DioPadCc2 = 4,
    DioPadOtpExtVolt = 5,
    DioPadSpiHostD0 = 6,
    DioPadSpiHostD1 = 7,
    DioPadSpiHostD2 = 8,
    DioPadSpiHostD3 = 9,
    DioPadSpiHostClk = 10,
    DioPadSpiHostCsL = 11,
    DioPadSpiDevD0 = 12,
    DioPadSpiDevD1 = 13,
    DioPadSpiDevD2 = 14,
    DioPadSpiDevD3 = 15,
    DioPadSpiDevClk = 16,
    DioPadSpiDevCsL = 17,
    DioPadIor8 = 18,
    DioPadIor9 = 19,
    DioPadCount
  } dio_pad_e;

  // List of peripheral instantiated in this chip.
  typedef enum {
    PeripheralAdcCtrlAon,
    PeripheralAes,
    PeripheralAlertHandler,
    PeripheralAonTimerAon,
    PeripheralAst,
    PeripheralClkmgrAon,
    PeripheralCsrng,
    PeripheralEdn0,
    PeripheralEdn1,
    PeripheralEntropySrc,
    PeripheralFlashCtrl,
    PeripheralGpio,
    PeripheralHmac,
    PeripheralI2c0,
    PeripheralI2c1,
    PeripheralI2c2,
    PeripheralKeymgr,
    PeripheralKmac,
    PeripheralLcCtrl,
    PeripheralOtbn,
    PeripheralOtpCtrl,
    PeripheralPinmuxAon,
    PeripheralPwrmgrAon,
    PeripheralRomCtrl0,
    PeripheralRomCtrl1,
    PeripheralRstmgrAon,
    PeripheralRvCoreIbex,
    PeripheralRvDm,
    PeripheralRvPlic,
    PeripheralRvTimer,
    PeripheralSensorCtrl,
    PeripheralSocProxy,
    PeripheralSpiDevice,
    PeripheralSpiHost0,
    PeripheralSpiHost1,
    PeripheralSramCtrlMain,
    PeripheralSramCtrlMbox,
    PeripheralSramCtrlRetAon,
    PeripheralSysrstCtrlAon,
    PeripheralUart0,
    PeripheralUart1,
    PeripheralUart2,
    PeripheralUart3,
    PeripheralUsbdev,
    PeripheralCount
  } peripheral_e;

  // TODO: Enumeration for PLIC Interrupt source peripheral.
  // TODO: Enumeration for PLIC Interrupt Ids.

// MACROs for AST analog simulation support
`ifdef ANALOGSIM
  `define INOUT_AI input ast_pkg::awire_t
  `define INOUT_AO output ast_pkg::awire_t
`else
  `define INOUT_AI inout
  `define INOUT_AO inout
`endif

endpackage
