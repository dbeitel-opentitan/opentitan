// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#ifndef OPENTITAN_SW_DEVICE_TESTS_SIM_DV_PWRMGR_SLEEP_ALL_WAKE_UPS_IMPL_H_
#define OPENTITAN_SW_DEVICE_TESTS_SIM_DV_PWRMGR_SLEEP_ALL_WAKE_UPS_IMPL_H_

// Contains header for code that is common to deep, normal, and random sleep for
// pwrmgr all_wake_ups test.

#include "sw/device/lib/testing/test_framework/check.h"
#include "sw/device/lib/testing/test_framework/ottf_main.h"
#include "sw/ip/adc_ctrl/dif/dif_adc_ctrl.h"
#include "sw/ip/aon_timer/test/utils/aon_timer_testutils.h"
#include "sw/ip/flash_ctrl/dif/dif_flash_ctrl.h"
#include "sw/ip/pinmux/dif/dif_pinmux.h"
#include "sw/ip/pwrmgr/dif/dif_pwrmgr.h"
#include "sw/ip/pwrmgr/test/utils/pwrmgr_testutils.h"
#include "sw/ip/rv_plic/dif/dif_rv_plic.h"
#include "sw/ip/rv_plic/test/utils/rv_plic_testutils.h"
#include "sw/ip/sensor_ctrl/dif/dif_sensor_ctrl.h"
#include "sw/ip/sysrst_ctrl/dif/dif_sysrst_ctrl.h"
#include "sw/lib/sw/device/base/mmio.h"
#include "sw/lib/sw/device/runtime/ibex.h"
#include "sw/lib/sw/device/runtime/irq.h"
#include "sw/lib/sw/device/runtime/log.h"

typedef struct test_wakeup_sources {
  /**
   * Name of the device.
   */
  const char *name;
  /**
   * Handle to the DIF object for this device.
   */
  void *dif_handle;
  /**
   * Wakeup Sources.
   */
  dif_pwrmgr_request_sources_t wakeup_src;
  /**
   * Configuration and initialization actions for the device.
   * This will be passed the value of `dif` above.
   */
  void (*config)(void *dif);
} test_wakeup_sources_t;

extern dif_adc_ctrl_t adc_ctrl;
extern dif_aon_timer_t aon_timer;
extern dif_flash_ctrl_state_t flash_ctrl;
extern dif_pinmux_t pinmux;
extern dif_pwrmgr_t pwrmgr;
extern dif_rv_plic_t rv_plic;
extern dif_sensor_ctrl_t sensor_ctrl;
extern dif_sysrst_ctrl_t sysrst_ctrl;

void init_units(void);

void check_wakeup_reason(uint32_t wakeup_source);

void execute_test(uint32_t wakeup_source, bool deep_sleep);

void cleanup(uint32_t test_idx);

#endif  // OPENTITAN_SW_DEVICE_TESTS_SIM_DV_PWRMGR_SLEEP_ALL_WAKE_UPS_IMPL_H_
