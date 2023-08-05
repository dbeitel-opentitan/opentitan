// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "sw/device/lib/testing/test_framework/check.h"
#include "sw/device/lib/testing/test_framework/ottf_main.h"
#include "sw/ip/flash_ctrl/test/utils/flash_ctrl_testutils.h"
#include "sw/ip/pinmux/dif/dif_pinmux.h"
#include "sw/ip/sysrst_ctrl/dif/dif_sysrst_ctrl.h"
#include "sw/lib/sw/device/base/mmio.h"
#include "sw/lib/sw/device/runtime/ibex.h"
#include "sw/lib/sw/device/runtime/log.h"

#include "hw/top_darjeeling/sw/autogen/top_darjeeling.h"

OTTF_DEFINE_TEST_CONFIG();

static dif_pinmux_t pinmux;
static dif_sysrst_ctrl_t sysrst_ctrl;
static dif_flash_ctrl_state_t flash;

const uint32_t kTestPhaseTimeoutUsec = 100;

enum {
  kTestPhaseSetup = 0,
  kTestPhaseLoopback = 1,
  kTestPhaseOverrideSetup = 2,
  kTestPhaseOverrideZeros = 3,
  kTestPhaseOverrideOnes = 4,
  kTestPhaseOverrideRelease = 5,
  kTestPhaseOverrideAndLoopback = 6,
  kTestPhaseDone = 7,
};

enum {
  kAllZero = 0x0,
  kAllOne = 0xff,
  kLoopbackPartial = 0x5,
  kNumMioInputs = 0x4,
  kNumMioOutputs = 0x6,
  kOutputNumPads = 0x8,
};

static const dif_pinmux_index_t kPeripheralInputs[] = {
    kTopDarjeelingPinmuxPeripheralInSysrstCtrlAonKey0In,
    kTopDarjeelingPinmuxPeripheralInSysrstCtrlAonKey1In,
    kTopDarjeelingPinmuxPeripheralInSysrstCtrlAonKey2In,
    kTopDarjeelingPinmuxPeripheralInSysrstCtrlAonPwrbIn,
};

static const dif_pinmux_index_t kInputPads[] = {
    kTopDarjeelingPinmuxInselIob3,
    kTopDarjeelingPinmuxInselIob6,
    kTopDarjeelingPinmuxInselIob8,
    kTopDarjeelingPinmuxInselIor13,
};

static const dif_pinmux_index_t kPeripheralOutputs[] = {
    kTopDarjeelingPinmuxOutselSysrstCtrlAonKey0Out,
    kTopDarjeelingPinmuxOutselSysrstCtrlAonKey1Out,
    kTopDarjeelingPinmuxOutselSysrstCtrlAonKey2Out,
    kTopDarjeelingPinmuxOutselSysrstCtrlAonPwrbOut,
    kTopDarjeelingPinmuxOutselSysrstCtrlAonBatDisable,
    kTopDarjeelingPinmuxOutselSysrstCtrlAonZ3Wakeup,
};

static const dif_pinmux_index_t kOutputPads[] = {
    kTopDarjeelingPinmuxMioOutIob9, kTopDarjeelingPinmuxMioOutIor5,
    kTopDarjeelingPinmuxMioOutIor6, kTopDarjeelingPinmuxMioOutIoc7,
    kTopDarjeelingPinmuxMioOutIoc9, kTopDarjeelingPinmuxMioOutIob7,
};

static const dif_sysrst_ctrl_pin_t kSysrstCtrlOutputs[] = {
    kDifSysrstCtrlPinKey0Out,           kDifSysrstCtrlPinKey1Out,
    kDifSysrstCtrlPinKey2Out,           kDifSysrstCtrlPinPowerButtonOut,
    kDifSysrstCtrlPinBatteryDisableOut, kDifSysrstCtrlPinZ3WakeupOut,
    kDifSysrstCtrlPinEcResetInOut,      kDifSysrstCtrlPinFlashWriteProtectInOut,
};

// Test phase written by testbench.
static volatile const uint8_t kTestPhase = 0;

// Sets up the pinmux to assign input and output pads
// to the sysrst_ctrl peripheral as required.
static void pinmux_setup(void) {
  for (int i = 0; i < kNumMioInputs; ++i) {
    CHECK_DIF_OK(
        dif_pinmux_input_select(&pinmux, kPeripheralInputs[i], kInputPads[i]));
  }
  for (int i = 0; i < kNumMioOutputs; ++i) {
    CHECK_DIF_OK(dif_pinmux_output_select(&pinmux, kOutputPads[i],
                                          kPeripheralOutputs[i]));
  }
}

// Waits for the kTestPhase variable to be changed by a backdoor overwrite
// from the testbench in `chip_sw_sysrst_ctrl_ec_rst_l_vseq.sv`. This will
// indicate that the testbench is ready to proceed with the next phase of the
// test. The function `flash_ctrl_testutils_backdoor_wait_update` it's used to
// deal with possible caching that can prevent the software to read the new
// value of `kTestPhase`.
static void sync_with_testbench(void) {
  // Set WFI status for testbench synchronization,
  // no actual WFI instruction is issued.
  test_status_set(kTestStatusInWfi);
  test_status_set(kTestStatusInTest);
  CHECK_STATUS_OK(flash_ctrl_testutils_backdoor_wait_update(
      &flash, (uintptr_t)&kTestPhase, kTestPhaseTimeoutUsec));
}

// Enables the sysrst_ctrl overrides for the output pins. Allows
// both low and high override values.
static void override_setup(uint8_t pins_to_override) {
  for (int i = 0; i < kOutputNumPads; ++i) {
    if ((pins_to_override >> i) & 0x1) {
      CHECK_DIF_OK(dif_sysrst_ctrl_output_pin_override_set_enabled(
          &sysrst_ctrl, kSysrstCtrlOutputs[i], kDifToggleEnabled));
      CHECK_DIF_OK(dif_sysrst_ctrl_output_pin_override_set_allowed(
          &sysrst_ctrl, kSysrstCtrlOutputs[i], true, true));
    }
  }
}

// Disables the overrides. Allows the outputs to pass-through the
// values from the relevant input pins.
static void override_disable(void) {
  for (int i = 0; i < kOutputNumPads; ++i) {
    CHECK_DIF_OK(dif_sysrst_ctrl_output_pin_override_set_enabled(
        &sysrst_ctrl, kSysrstCtrlOutputs[i], kDifToggleDisabled));
  }
}

// Sets the values of the output overrides as required.
static void set_output_overrides(uint8_t override_value) {
  for (int i = 0; i < kOutputNumPads; ++i) {
    CHECK_DIF_OK(dif_sysrst_ctrl_output_pin_set_override(
        &sysrst_ctrl, kSysrstCtrlOutputs[i], (override_value >> i) & 0x1));
  }
}

bool test_main(void) {
  CHECK_DIF_OK(dif_pinmux_init(
      mmio_region_from_addr(TOP_DARJEELING_PINMUX_AON_BASE_ADDR), &pinmux));
  CHECK_DIF_OK(dif_sysrst_ctrl_init(
      mmio_region_from_addr(TOP_DARJEELING_SYSRST_CTRL_AON_BASE_ADDR),
      &sysrst_ctrl));
  CHECK_STATUS_OK(flash_ctrl_testutils_backdoor_init(&flash));

  while (kTestPhase < kTestPhaseDone) {
    switch (kTestPhase) {
      case kTestPhaseSetup:
        pinmux_setup();
        break;
      case kTestPhaseLoopback:
        break;
      case kTestPhaseOverrideSetup:
        override_setup(kAllOne);
        break;
      case kTestPhaseOverrideZeros:
        set_output_overrides(kAllZero);
        break;
      case kTestPhaseOverrideOnes:
        set_output_overrides(kAllOne);
        break;
      case kTestPhaseOverrideRelease:
        override_disable();
        break;
      case kTestPhaseOverrideAndLoopback:
        override_setup(kLoopbackPartial);
        set_output_overrides(kLoopbackPartial);
        break;
      default:
        LOG_ERROR("Unexpected test phase : %d", kTestPhase);
        break;
    }
    sync_with_testbench();
  }
  return true;
}
