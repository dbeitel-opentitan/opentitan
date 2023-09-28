// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "sw/device/lib/testing/test_framework/check.h"
#include "sw/device/lib/testing/test_framework/ottf_main.h"
#include "sw/ip/aon_timer/test/utils/aon_timer_testutils.h"
#include "sw/ip/clkmgr/test/utils/clkmgr_testutils.h"
#include "sw/ip/pwrmgr/test/utils/pwrmgr_testutils.h"
#include "sw/ip/rv_plic/dif/dif_rv_plic.h"
#include "sw/ip/rv_plic/test/utils/rv_plic_testutils.h"
#include "sw/ip/sensor_ctrl/dif/dif_sensor_ctrl.h"
#include "sw/ip/sensor_ctrl/test/utils/sensor_ctrl_testutils.h"
#include "sw/lib/sw/device/base/memory.h"
#include "sw/lib/sw/device/runtime/irq.h"
#include "sw/lib/sw/device/runtime/log.h"

#include "hw/top_darjeeling/sw/autogen/top_darjeeling.h"
#include "sw/top_darjeeling/sw/test/utils/autogen/isr_testutils.h"

OTTF_DEFINE_TEST_CONFIG();

/**
 * This test measure clock counts with clkmgr frequency measurements, performing
 * 100 measurements per round. Measurement errors (fast or slow clocks) are
 * recorded as recoverable error in clkmgr.
 *
 * After 100 measurements, test kicks in regular sleep with IO and USB
 * clocks turned off. Once the chip wakes up the measurements should be
 * enabled, but no errors should be found even for stopped clocks.
 *
 * Notice the test overrides the hardware behavior so it comes out with
 * calibrated USB clock, otherwise the USB clock frequency will be incorrect.
 * USB calibration should be a separate test, and may be vendor-specific.
 */
enum {
  kWaitForCSRPollingMicros = 1,
  kMeasurementsPerRound = 100,
};

static dif_clkmgr_t clkmgr;
static dif_pwrmgr_t pwrmgr;
static dif_rv_plic_t rv_plic;

static plic_isr_ctx_t plic_ctx = {.rv_plic = &rv_plic,
                                  .hart_id = kTopDarjeelingPlicTargetIbex0};

static pwrmgr_isr_ctx_t pwrmgr_isr_ctx = {
    .pwrmgr = &pwrmgr,
    .plic_pwrmgr_start_irq_id = kTopDarjeelingPlicIrqIdPwrmgrAonWakeup,
    .expected_irq = kDifPwrmgrIrqWakeup,
    .is_only_irq = true};

static volatile bool isr_entered;

/**
 * External interrupt handler.
 */
void ottf_external_isr(void) {
  dif_pwrmgr_irq_t irq_id;
  top_darjeeling_plic_peripheral_t peripheral;

  isr_entered = true;
  isr_testutils_pwrmgr_isr(plic_ctx, pwrmgr_isr_ctx, &peripheral, &irq_id);

  // Check that both the peripheral and the irq id are correct.
  CHECK(peripheral == kTopDarjeelingPlicPeripheralPwrmgrAon,
        "IRQ peripheral: %d is incorrect", peripheral);
  CHECK(irq_id == kDifPwrmgrIrqWakeup, "IRQ ID: %d is incorrect", irq_id);
}

bool test_main(void) {
  dif_sensor_ctrl_t sensor_ctrl;
  dif_aon_timer_t aon_timer;

  uint32_t delay_micros = 0;
  CHECK_STATUS_OK(aon_timer_testutils_get_us_from_aon_cycles(
      kMeasurementsPerRound, &delay_micros));

  // Enable global and external IRQ at Ibex.
  irq_global_ctrl(true);
  irq_external_ctrl(true);

  CHECK_DIF_OK(dif_clkmgr_init(
      mmio_region_from_addr(TOP_DARJEELING_CLKMGR_AON_BASE_ADDR), &clkmgr));
  CHECK_DIF_OK(dif_sensor_ctrl_init(
      mmio_region_from_addr(TOP_DARJEELING_SENSOR_CTRL_BASE_ADDR),
      &sensor_ctrl));
  CHECK_DIF_OK(dif_pwrmgr_init(
      mmio_region_from_addr(TOP_DARJEELING_PWRMGR_AON_BASE_ADDR), &pwrmgr));
  CHECK_DIF_OK(dif_aon_timer_init(
      mmio_region_from_addr(TOP_DARJEELING_AON_TIMER_AON_BASE_ADDR),
      &aon_timer));
  CHECK_DIF_OK(dif_rv_plic_init(
      mmio_region_from_addr(TOP_DARJEELING_RV_PLIC_BASE_ADDR), &rv_plic));

  LOG_INFO("TEST: wait for ast init");
  IBEX_SPIN_FOR(sensor_ctrl_ast_init_done(&sensor_ctrl), 1000);
  LOG_INFO("TEST: done ast init");

  CHECK(UNWRAP(pwrmgr_testutils_is_wakeup_reason(&pwrmgr, 0)) == true);

  CHECK_STATUS_OK(clkmgr_testutils_enable_clock_counts_with_expected_thresholds(
      &clkmgr, /*jitter_enabled=*/false, /*external_clk=*/false,
      /*low_speed=*/false));
  busy_spin_micros(delay_micros);

  // check results
  CHECK_STATUS_OK(clkmgr_testutils_check_measurement_counts(&clkmgr));
  CHECK_STATUS_OK(clkmgr_testutils_disable_clock_counts(&clkmgr));

  // Start new round of measurements.
  CHECK_STATUS_OK(clkmgr_testutils_enable_clock_counts_with_expected_thresholds(
      &clkmgr, /*jitter_enabled=*/false, /*external_clk=*/false,
      /*low_speed=*/false));

  busy_spin_micros(delay_micros);

  // Set wakeup timer to 100 us to have enough down time, and also wait before
  // entering sleep to have a chance to measure before sleeping. With normal
  // sleep all measurements should remain enabled, and there should be no
  // errors for clocks that were selectively turned off.
  uint32_t wakeup_threshold = kDeviceType == kDeviceSimVerilator ? 1000 : 100;
  CHECK_STATUS_OK(
      aon_timer_testutils_wakeup_config(&aon_timer, wakeup_threshold));

  // Enable all the AON interrupts used in this test.
  rv_plic_testutils_irq_range_enable(&rv_plic, kTopDarjeelingPlicTargetIbex0,
                                     kTopDarjeelingPlicIrqIdPwrmgrAonWakeup,
                                     kTopDarjeelingPlicIrqIdPwrmgrAonWakeup);
  CHECK_DIF_OK(dif_pwrmgr_irq_set_enabled(&pwrmgr, 0, kDifToggleEnabled));

  // Put chip in normal sleep, and keep Core clock running. All io and usb
  // clocks are stopped, but we expect the stoppage won't trigger errors.
  CHECK_STATUS_OK(pwrmgr_testutils_enable_low_power(
      &pwrmgr, /*wakeups=*/kDifPwrmgrWakeupRequestSourceThree,
      /*domain_config=*/kDifPwrmgrDomainOptionCoreClockInLowPower |
          kDifPwrmgrDomainOptionUsbClockInActivePower |
          kDifPwrmgrDomainOptionMainPowerInLowPower));

  LOG_INFO("TEST: Issue WFI to enter sleep");
  wait_for_interrupt();

  CHECK(isr_entered);

  // Interrupt happened. Check the measurement state.
  CHECK_STATUS_OK(clkmgr_testutils_check_measurement_counts(&clkmgr));
  bool all_enabled = UNWRAP(
      clkmgr_testutils_check_measurement_enables(&clkmgr, kDifToggleEnabled));
  CHECK(all_enabled);

  return true;
}
