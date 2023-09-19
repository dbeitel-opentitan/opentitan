// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// tl_main package generated by `tlgen.py` tool

package tl_main_pkg;

  localparam logic [31:0] ADDR_SPACE_RV_DM__REGS          = 32'h 21200000;
  localparam logic [31:0] ADDR_SPACE_RV_DM__MEM           = 32'h 00040000;
  localparam logic [31:0] ADDR_SPACE_ROM_CTRL0__ROM       = 32'h 00008000;
  localparam logic [31:0] ADDR_SPACE_ROM_CTRL0__REGS      = 32'h 211e0000;
  localparam logic [31:0] ADDR_SPACE_ROM_CTRL1__ROM       = 32'h 00020000;
  localparam logic [31:0] ADDR_SPACE_ROM_CTRL1__REGS      = 32'h 211e1000;
  localparam logic [0:0][31:0] ADDR_SPACE_PERI                 = {
    32'h 30000000
  };
  localparam logic [31:0] ADDR_SPACE_SOC_PROXY__CORE      = 32'h 22030000;
  localparam logic [31:0] ADDR_SPACE_SOC_PROXY__CTN       = 32'h 40000000;
  localparam logic [31:0] ADDR_SPACE_SPI_HOST1            = 32'h 32000000;
  localparam logic [31:0] ADDR_SPACE_USBDEV               = 32'h 32010000;
  localparam logic [31:0] ADDR_SPACE_FLASH_CTRL__CORE     = 32'h 33000000;
  localparam logic [31:0] ADDR_SPACE_FLASH_CTRL__PRIM     = 32'h 33008000;
  localparam logic [31:0] ADDR_SPACE_FLASH_CTRL__MEM      = 32'h 34000000;
  localparam logic [31:0] ADDR_SPACE_HMAC                 = 32'h 21110000;
  localparam logic [31:0] ADDR_SPACE_KMAC                 = 32'h 21120000;
  localparam logic [31:0] ADDR_SPACE_AES                  = 32'h 21100000;
  localparam logic [31:0] ADDR_SPACE_CSRNG                = 32'h 21150000;
  localparam logic [31:0] ADDR_SPACE_EDN0                 = 32'h 21170000;
  localparam logic [31:0] ADDR_SPACE_EDN1                 = 32'h 21180000;
  localparam logic [31:0] ADDR_SPACE_RV_PLIC              = 32'h 28000000;
  localparam logic [31:0] ADDR_SPACE_OTBN                 = 32'h 21130000;
  localparam logic [31:0] ADDR_SPACE_KEYMGR               = 32'h 21140000;
  localparam logic [31:0] ADDR_SPACE_RV_CORE_IBEX__CFG    = 32'h 211f0000;
  localparam logic [31:0] ADDR_SPACE_SRAM_CTRL_MAIN__REGS = 32'h 211c0000;
  localparam logic [31:0] ADDR_SPACE_SRAM_CTRL_MAIN__RAM  = 32'h 10000000;
  localparam logic [31:0] ADDR_SPACE_SRAM_CTRL_MBOX__REGS = 32'h 211d0000;
  localparam logic [31:0] ADDR_SPACE_SRAM_CTRL_MBOX__RAM  = 32'h 11000000;
  localparam logic [31:0] ADDR_SPACE_DMA                  = 32'h 22010000;
  localparam logic [31:0] ADDR_SPACE_MBX0__CORE           = 32'h 22000000;
  localparam logic [31:0] ADDR_SPACE_MBX1__CORE           = 32'h 22000100;
  localparam logic [31:0] ADDR_SPACE_MBX2__CORE           = 32'h 22000200;
  localparam logic [31:0] ADDR_SPACE_MBX3__CORE           = 32'h 22000300;
  localparam logic [31:0] ADDR_SPACE_MBX4__CORE           = 32'h 22000400;
  localparam logic [31:0] ADDR_SPACE_MBX5__CORE           = 32'h 22000500;
  localparam logic [31:0] ADDR_SPACE_MBX6__CORE           = 32'h 22000600;
  localparam logic [31:0] ADDR_SPACE_MBX7__CORE           = 32'h 22000700;
  localparam logic [31:0] ADDR_SPACE_MBX_JTAG__CORE       = 32'h 22000800;
  localparam logic [31:0] ADDR_SPACE_MBX_PCIE0__CORE      = 32'h 22040000;

  localparam logic [31:0] ADDR_MASK_RV_DM__REGS          = 32'h 00000003;
  localparam logic [31:0] ADDR_MASK_RV_DM__MEM           = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_ROM_CTRL0__ROM       = 32'h 00007fff;
  localparam logic [31:0] ADDR_MASK_ROM_CTRL0__REGS      = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_ROM_CTRL1__ROM       = 32'h 0000ffff;
  localparam logic [31:0] ADDR_MASK_ROM_CTRL1__REGS      = 32'h 0000007f;
  localparam logic [0:0][31:0] ADDR_MASK_PERI                 = {
    32'h 01ffffff
  };
  localparam logic [31:0] ADDR_MASK_SOC_PROXY__CORE      = 32'h 0000000f;
  localparam logic [31:0] ADDR_MASK_SOC_PROXY__CTN       = 32'h 3fffffff;
  localparam logic [31:0] ADDR_MASK_SPI_HOST1            = 32'h 0000003f;
  localparam logic [31:0] ADDR_MASK_USBDEV               = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_FLASH_CTRL__CORE     = 32'h 000001ff;
  localparam logic [31:0] ADDR_MASK_FLASH_CTRL__PRIM     = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_FLASH_CTRL__MEM      = 32'h 000fffff;
  localparam logic [31:0] ADDR_MASK_HMAC                 = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_KMAC                 = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_AES                  = 32'h 000000ff;
  localparam logic [31:0] ADDR_MASK_CSRNG                = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_EDN0                 = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_EDN1                 = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_RV_PLIC              = 32'h 07ffffff;
  localparam logic [31:0] ADDR_MASK_OTBN                 = 32'h 0000ffff;
  localparam logic [31:0] ADDR_MASK_KEYMGR               = 32'h 000000ff;
  localparam logic [31:0] ADDR_MASK_RV_CORE_IBEX__CFG    = 32'h 000007ff;
  localparam logic [31:0] ADDR_MASK_SRAM_CTRL_MAIN__REGS = 32'h 0000001f;
  localparam logic [31:0] ADDR_MASK_SRAM_CTRL_MAIN__RAM  = 32'h 0000ffff;
  localparam logic [31:0] ADDR_MASK_SRAM_CTRL_MBOX__REGS = 32'h 0000001f;
  localparam logic [31:0] ADDR_MASK_SRAM_CTRL_MBOX__RAM  = 32'h 00000fff;
  localparam logic [31:0] ADDR_MASK_DMA                  = 32'h 000000ff;
  localparam logic [31:0] ADDR_MASK_MBX0__CORE           = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_MBX1__CORE           = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_MBX2__CORE           = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_MBX3__CORE           = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_MBX4__CORE           = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_MBX5__CORE           = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_MBX6__CORE           = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_MBX7__CORE           = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_MBX_JTAG__CORE       = 32'h 0000007f;
  localparam logic [31:0] ADDR_MASK_MBX_PCIE0__CORE      = 32'h 0000007f;

  localparam int N_HOST   = 14;
  localparam int N_DEVICE = 39;

  typedef enum int {
    TlRvDmRegs = 0,
    TlRvDmMem = 1,
    TlRomCtrl0Rom = 2,
    TlRomCtrl0Regs = 3,
    TlRomCtrl1Rom = 4,
    TlRomCtrl1Regs = 5,
    TlPeri = 6,
    TlSocProxyCore = 7,
    TlSocProxyCtn = 8,
    TlSpiHost1 = 9,
    TlUsbdev = 10,
    TlFlashCtrlCore = 11,
    TlFlashCtrlPrim = 12,
    TlFlashCtrlMem = 13,
    TlHmac = 14,
    TlKmac = 15,
    TlAes = 16,
    TlCsrng = 17,
    TlEdn0 = 18,
    TlEdn1 = 19,
    TlRvPlic = 20,
    TlOtbn = 21,
    TlKeymgr = 22,
    TlRvCoreIbexCfg = 23,
    TlSramCtrlMainRegs = 24,
    TlSramCtrlMainRam = 25,
    TlSramCtrlMboxRegs = 26,
    TlSramCtrlMboxRam = 27,
    TlDma = 28,
    TlMbx0Core = 29,
    TlMbx1Core = 30,
    TlMbx2Core = 31,
    TlMbx3Core = 32,
    TlMbx4Core = 33,
    TlMbx5Core = 34,
    TlMbx6Core = 35,
    TlMbx7Core = 36,
    TlMbxJtagCore = 37,
    TlMbxPcie0Core = 38
  } tl_device_e;

  typedef enum int {
    TlRvCoreIbexCorei = 0,
    TlRvCoreIbexCored = 1,
    TlRvDmSba = 2,
    TlDmaHost = 3,
    TlMbx0Sram = 4,
    TlMbx1Sram = 5,
    TlMbx2Sram = 6,
    TlMbx3Sram = 7,
    TlMbx4Sram = 8,
    TlMbx5Sram = 9,
    TlMbx6Sram = 10,
    TlMbx7Sram = 11,
    TlMbxJtagSram = 12,
    TlMbxPcie0Sram = 13
  } tl_host_e;

endpackage
