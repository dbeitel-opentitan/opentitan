// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "sw/device/silicon_creator/lib/drivers/otp.h"
#include "sw/device/silicon_creator/lib/drivers/pinmux.h"
#include "sw/device/silicon_creator/lib/drivers/uart.h"
#include "sw/lib/sw/device/arch/device.h"
#include "sw/lib/sw/device/base/abs_mmio.h"
#include "sw/lib/sw/device/base/bitfield.h"
#include "sw/lib/sw/device/base/csr.h"
#include "sw/lib/sw/device/base/hardened.h"
#include "sw/lib/sw/device/runtime/hart.h"
#include "sw/lib/sw/device/runtime/log.h"
#include "sw/lib/sw/device/runtime/print.h"
#include "sw/lib/sw/device/silicon_creator/error.h"
#include "sw/lib/sw/device/silicon_creator/manifest_def.h"

#include "hw/top_darjeeling/sw/autogen/top_darjeeling.h"
#include "otp_ctrl_regs.h"
#include "pinmux_regs.h"
#include "uart_regs.h"

enum {
  /**
   * Base address of the pinmux registers.
   */
  kPinmuxBase = TOP_DARJEELING_PINMUX_AON_BASE_ADDR,
  /**
   * Base address of the UART registers.
   */
  kUartBase = TOP_DARJEELING_UART0_BASE_ADDR,
};

/**
 * Set up peripherals for printing.
 *
 * This clobbers the existing pinmux/UART configuration and should only be used
 * at the very end of the test (e.g. to print a message saying whether the
 * tests passed or failed).
 *
 * Must be called before using `LOG_INFO` or `LOG_ERROR`.
 */
static void setup_stdout(void) {
  pinmux_init();
  uart_init(kUartNCOValue);
  base_set_stdout((buffer_sink_t){
      .data = NULL,
      .sink = uart_sink,
  });
}

/**
 * Trigger an instruction access fault.
 */
static void fault(void) {
  ((void (*)(void))TOP_DARJEELING_SRAM_CTRL_MAIN_RAM_BASE_ADDR)();
}

/**
 * Trigger an instruction access fault if the values are not equal.
 */
#define CHECK_EQ(lhs_, rhs_, name_)                                        \
  do {                                                                     \
    if (lhs_ != rhs_) {                                                    \
      setup_stdout();                                                      \
      LOG_ERROR("Check failed: %s (0x%08x != 0x%08x)", name_, lhs_, rhs_); \
      fault();                                                             \
    }                                                                      \
  } while (false)

/**
 * Get device-specific mask for MIO pad attributes.
 *
 * Bits are set if the attribute is legal for the current device. This mask
 * should match the result of writing UINT32_MAX to the pad attribute register
 * and then reading back, because the pad attribute registers have
 * write-any-read-legal behavior.
 */
static uint32_t pad_attr_mask_get(void) {
  CHECK_EQ(kDeviceType, kDeviceFpgaCw310,
           "This test is only supported for CW310");

  // The only legal attributes on CW310 are `invert` and `virtual_od_en`.
  uint32_t mask = 0;
  mask = bitfield_bit32_write(mask, PINMUX_MIO_PAD_ATTR_0_INVERT_0_BIT, true);
  mask = bitfield_bit32_write(mask, PINMUX_MIO_PAD_ATTR_0_VIRTUAL_OD_EN_0_BIT,
                              true);

  // Save the original attributes for pad 0.
  uint32_t attr0_orig =
      abs_mmio_read32(kPinmuxBase + PINMUX_MIO_PAD_ATTR_0_REG_OFFSET);

  // Check that the mask is correct by writing UINT32_MAX to the attribute
  // register for pad 0, and then reading back.
  abs_mmio_write32(kPinmuxBase + PINMUX_MIO_PAD_ATTR_0_REG_OFFSET, UINT32_MAX);
  uint32_t attr0_legal =
      abs_mmio_read32(kPinmuxBase + PINMUX_MIO_PAD_ATTR_0_REG_OFFSET);
  CHECK_EQ(attr0_legal, mask, "Pad attribute mask check");

  // Restore the original register value.
  abs_mmio_write32(kPinmuxBase + PINMUX_MIO_PAD_ATTR_0_REG_OFFSET, attr0_orig);

  return mask;
}

/**
 * Check that the pinmux has been initialized correctly.
 *
 * Expected configuration:
 * - If the OTP BOOTSTRAP_EN option is set, then pinmux should be configured
 *   with the following peripheral/pad mapping, with pull-down enabled for all
 *   pads:
 *     * GPIO22 -> GPIO22 (DIO32)
 *     * GPIO23 -> GPIO23 (DIO33)
 *     * GPIO24 -> GPIO24 (DIO34)
 */
static void pinmux_init_test(void) {
  uint32_t bootstrap_dis =
      otp_read32(OTP_CTRL_PARAM_OWNER_SW_CFG_ROM_BOOTSTRAP_DIS_OFFSET);
  if (bootstrap_dis != kHardenedBoolTrue) {
    uint32_t attr_mask = pad_attr_mask_get();

    // GPIO 22 attributes (DIO32): pull-down selected and enabled (if legal).
    uint32_t attr22 =
        abs_mmio_read32(kPinmuxBase + PINMUX_DIO_PAD_ATTR_32_REG_OFFSET);
    CHECK_EQ(
        bitfield_bit32_read(attr22, PINMUX_DIO_PAD_ATTR_32_PULL_EN_32_BIT),
        bitfield_bit32_read(attr_mask, PINMUX_DIO_PAD_ATTR_32_PULL_EN_32_BIT),
        "GPIO 22 pull enable");
    CHECK_EQ(
        bitfield_bit32_read(attr22, PINMUX_DIO_PAD_ATTR_32_PULL_SELECT_32_BIT),
        false, "GPIO 22 pull select");

    // GPIO 23 attributes (DIO33): pull-down selected and enabled (if legal).
    uint32_t attr23 =
        abs_mmio_read32(kPinmuxBase + PINMUX_DIO_PAD_ATTR_33_REG_OFFSET);
    CHECK_EQ(
        bitfield_bit32_read(attr23, PINMUX_DIO_PAD_ATTR_33_PULL_EN_33_BIT),
        bitfield_bit32_read(attr_mask, PINMUX_DIO_PAD_ATTR_33_PULL_EN_33_BIT),
        "GPIO 23 pull enable");
    CHECK_EQ(
        bitfield_bit32_read(attr23, PINMUX_DIO_PAD_ATTR_33_PULL_SELECT_33_BIT),
        false, "GPIO 23 pull select");

    // GPIO 24 attributes (DIO34): pull-down selected and enabled (if legal).
    uint32_t attr24 =
        abs_mmio_read32(kPinmuxBase + PINMUX_DIO_PAD_ATTR_34_REG_OFFSET);
    CHECK_EQ(
        bitfield_bit32_read(attr24, PINMUX_DIO_PAD_ATTR_34_PULL_EN_34_BIT),
        bitfield_bit32_read(attr_mask, PINMUX_DIO_PAD_ATTR_34_PULL_EN_34_BIT),
        "GPIO 24 pull enable");
    CHECK_EQ(
        bitfield_bit32_read(attr24, PINMUX_DIO_PAD_ATTR_34_PULL_SELECT_34_BIT),
        false, "GPIO 24 pull select");
  }
}

/**
 * Check that the UART has been initialized correctly.
 *
 * Expected configuration:
 * - `CTRL.TX` (TX enable) bit is true
 * - `CTRL.RX` (RX enable) bit is false
 * - `CTRL.SLPBK` (system loopback) bit is false
 * - `CTRL.LLPBK` (line loopback) bit is false
 * - `CTRL.NCO` is set to the precomputed `kUartNCOValue` for this device
 * - `CTRL.PARITY_EN` (parity enable) bit is false
 * - All interrupts are disabled
 * - All FIFOs have been cleared (both Rx and Tx are empty)
 */
static void uart_init_test(void) {
  // Check the control register values.
  uint32_t ctrl = abs_mmio_read32(kUartBase + UART_CTRL_REG_OFFSET);
  CHECK_EQ(bitfield_bit32_read(ctrl, UART_CTRL_TX_BIT), true,
           "UART.CTRL.TX_BIT");
  CHECK_EQ(bitfield_bit32_read(ctrl, UART_CTRL_RX_BIT), false,
           "UART.CTRL.RX_BIT");
  CHECK_EQ(bitfield_bit32_read(ctrl, UART_CTRL_SLPBK_BIT), false,
           "UART.CTRL.SLPBK_BIT");
  CHECK_EQ(bitfield_bit32_read(ctrl, UART_CTRL_LLPBK_BIT), false,
           "UART.CTRL.LLPBK_BIT");
  CHECK_EQ(bitfield_field32_read(ctrl, UART_CTRL_NCO_FIELD), kUartNCOValue,
           "UART.CTRL.NCO_FIELD");
  CHECK_EQ(bitfield_bit32_read(ctrl, UART_CTRL_PARITY_EN_BIT), false,
           "UART.CTRL.PARITY_EN_BIT");

  // Check that all interrupts are disabled.
  uint32_t intr_enable =
      abs_mmio_read32(kUartBase + UART_INTR_ENABLE_REG_OFFSET);
  CHECK_EQ(intr_enable, 0x0, "UART.INTR_ENABLE");

  // Check that both FIFOs are idle and empty.
  uint32_t status = abs_mmio_read32(kUartBase + UART_STATUS_REG_OFFSET);
  CHECK_EQ(bitfield_bit32_read(status, UART_STATUS_TXIDLE_BIT), true,
           "UART.STATUS.TXIDLE_BIT");
  CHECK_EQ(bitfield_bit32_read(status, UART_STATUS_RXIDLE_BIT), true,
           "UART.STATUS.RXIDLE_BIT");
  CHECK_EQ(bitfield_bit32_read(status, UART_STATUS_TXEMPTY_BIT), true,
           "UART.STATUS.TXEMPTY_BIT");
  CHECK_EQ(bitfield_bit32_read(status, UART_STATUS_RXEMPTY_BIT), true,
           "UART.STATUS.RXEMPTY_BIT");
}

/**
 * Check that the CPUCTRL CSR has been initialized correctly.
 *
 * Expected configuration:
 * - Bits 0:5 of the CPUCTRL CSR should match the value specified in OTP.
 */
static void cpuctrl_init_test(void) {
  uint32_t expected_value =
      otp_read32(OTP_CTRL_PARAM_CREATOR_SW_CFG_CPUCTRL_OFFSET);
  bitfield_field32_t cpuctrl_mask = {.mask = 0x3f, .index = 0};
  uint32_t cpuctrl_csr;
  CSR_READ(CSR_REG_CPUCTRL, &cpuctrl_csr);
  CHECK_EQ(bitfield_field32_read(cpuctrl_csr, cpuctrl_mask), expected_value,
           "CPUCTRL CSR");
}

/**
 * Test entrypoint.
 *
 * Because this function becomes the entrypoint for the manifest, it must be
 * word-aligned, otherwise it will trigger a `kManifestBadEntryPoint` boot
 * fault.
 */
void __attribute__((aligned(4))) _ottf_start(void) {
  pinmux_init_test();
  uart_init_test();
  cpuctrl_init_test();

  setup_stdout();
  LOG_INFO("PASS!");
  wait_for_interrupt();
}
