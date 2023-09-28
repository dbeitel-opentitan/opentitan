// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// Contains code that is common to deep, normal, and random sleep for
// pwrmgr all_wake_ups test.

#include "sw/device/tests/sim_dv/pwrmgr_sleep_all_wake_ups_impl.h"

#include "sw/ip/flash_ctrl/dif/dif_flash_ctrl.h"
#include "sw/ip/pinmux/dif/dif_pinmux.h"
#include "sw/ip/pwrmgr/dif/dif_pwrmgr.h"
#include "sw/ip/rv_plic/dif/dif_rv_plic.h"
#include "sw/ip/sensor_ctrl/dif/dif_sensor_ctrl.h"

#include "hw/top_darjeeling/sw/autogen/top_darjeeling.h"
#include "pwrmgr_regs.h"
#include "sw/top_darjeeling/sw/test/utils/autogen/isr_testutils.h"

static const uint32_t kPinmuxWkupDetector5 = 5;

dif_aon_timer_t aon_timer;
dif_flash_ctrl_state_t flash_ctrl;
dif_pinmux_t pinmux;
dif_pwrmgr_t pwrmgr;
dif_rv_plic_t rv_plic;
dif_sensor_ctrl_t sensor_ctrl;

/**
 * pinmux config for test #3
 * . use IOB7 as an input
 * . set posedge detection
 */
static void prgm_pinmux_wakeup(void *dif) {
  dif_pinmux_wakeup_config_t detector_cfg = {
      .signal_filter = kDifToggleDisabled,
      .pad_type = kDifPinmuxPadKindMio,
      .pad_select = kTopDarjeelingPinmuxInselIob7,
      .mode = kDifPinmuxWakeupModePositiveEdge,
      .counter_threshold = 0 /* Don't need for posedge detection */,
  };
  CHECK_DIF_OK(dif_pinmux_wakeup_detector_enable(dif, kPinmuxWkupDetector5,
                                                 detector_cfg));
}

/**
 * aon timer config for test #5
 * set wakeup signal in 50us
 */
static void prgm_aontimer_wakeup(void *dif) {
  CHECK_STATUS_OK(aon_timer_testutils_wakeup_config(dif, 10));
}

/**
 * sensor ctrl config for test #6
 * setup event trigger0
 */
static void prgm_sensor_ctrl_wakeup(void *dif) {
  CHECK_DIF_OK(
      dif_sensor_ctrl_set_ast_event_trigger(dif, 0, kDifToggleEnabled));
}

const test_wakeup_sources_t kTestWakeupSources[PWRMGR_PARAM_NUM_WKUPS] = {
    {
        .name = "PINMUX",
        .dif_handle = &pinmux,
        .wakeup_src = kDifPwrmgrWakeupRequestSourceOne,
        .config = prgm_pinmux_wakeup,
    },
    {
        .name = "AONTIMER",
        .dif_handle = &aon_timer,
        .wakeup_src = kDifPwrmgrWakeupRequestSourceThree,
        .config = prgm_aontimer_wakeup,
    },
    {
        .name = "SENSOR_CTRL",
        .dif_handle = &sensor_ctrl,
        .wakeup_src = kDifPwrmgrWakeupRequestSourceFour,
        .config = prgm_sensor_ctrl_wakeup,
    },
};

void init_units(void) {
  CHECK_DIF_OK(dif_aon_timer_init(
      mmio_region_from_addr(TOP_DARJEELING_AON_TIMER_AON_BASE_ADDR),
      &aon_timer));
  CHECK_DIF_OK(dif_flash_ctrl_init_state(
      &flash_ctrl,
      mmio_region_from_addr(TOP_DARJEELING_FLASH_CTRL_CORE_BASE_ADDR)));
  CHECK_DIF_OK(dif_pinmux_init(
      mmio_region_from_addr(TOP_DARJEELING_PINMUX_AON_BASE_ADDR), &pinmux));
  CHECK_DIF_OK(dif_pwrmgr_init(
      mmio_region_from_addr(TOP_DARJEELING_PWRMGR_AON_BASE_ADDR), &pwrmgr));
  CHECK_DIF_OK(dif_rv_plic_init(
      mmio_region_from_addr(TOP_DARJEELING_RV_PLIC_BASE_ADDR), &rv_plic));
  CHECK_DIF_OK(dif_sensor_ctrl_init(
      mmio_region_from_addr(TOP_DARJEELING_SENSOR_CTRL_BASE_ADDR),
      &sensor_ctrl));
}

void execute_test(uint32_t wakeup_source, bool deep_sleep) {
  // Configure wakeup device
  kTestWakeupSources[wakeup_source].config(
      kTestWakeupSources[wakeup_source].dif_handle);
  dif_pwrmgr_domain_config_t cfg;
  CHECK_DIF_OK(dif_pwrmgr_get_domain_config(&pwrmgr, &cfg));
  cfg = (cfg & (kDifPwrmgrDomainOptionIoClockInLowPower)) |
        (!deep_sleep ? kDifPwrmgrDomainOptionMainPowerInLowPower : 0);

  CHECK_STATUS_OK(pwrmgr_testutils_enable_low_power(
      &pwrmgr, kTestWakeupSources[wakeup_source].wakeup_src, cfg));
  LOG_INFO("Issue WFI to enter sleep %d", wakeup_source);
  wait_for_interrupt();
}

void check_wakeup_reason(uint32_t wakeup_source) {
  dif_pwrmgr_wakeup_reason_t wakeup_reason;
  CHECK_DIF_OK(dif_pwrmgr_wakeup_reason_get(&pwrmgr, &wakeup_reason));
  CHECK(UNWRAP(pwrmgr_testutils_is_wakeup_reason(
            &pwrmgr, kTestWakeupSources[wakeup_source].wakeup_src)) == true,
        "wakeup reason wrong exp:%d  obs:%d",
        kTestWakeupSources[wakeup_source].wakeup_src, wakeup_reason);
}

static bool get_wakeup_status(void) {
  dif_pwrmgr_request_sources_t wake_req = ~0u;
  CHECK_DIF_OK(dif_pwrmgr_get_current_request_sources(
      &pwrmgr, kDifPwrmgrReqTypeWakeup, &wake_req));
  return (wake_req > 0);
}

/**
 * Clean up wakeup sources.
 */
void cleanup(uint32_t test_idx) {
  switch (test_idx) {
    case PWRMGR_PARAM_PINMUX_AON_PIN_WKUP_REQ_IDX:
      CHECK_DIF_OK(dif_pinmux_wakeup_cause_clear(&pinmux));
      break;
    case PWRMGR_PARAM_AON_TIMER_AON_WKUP_REQ_IDX:
      CHECK_DIF_OK(dif_aon_timer_wakeup_stop(&aon_timer));
      CHECK_DIF_OK(dif_aon_timer_clear_wakeup_cause(&aon_timer));
      break;
    case PWRMGR_PARAM_SENSOR_CTRL_WKUP_REQ_IDX:
      // clear event trigger
      CHECK_DIF_OK(dif_sensor_ctrl_set_ast_event_trigger(&sensor_ctrl, 0,
                                                         kDifToggleDisabled));
      CHECK_DIF_OK(dif_sensor_ctrl_clear_recov_event(&sensor_ctrl, 0));
      break;
    default:
      LOG_ERROR("unknown test index %d", test_idx);
  }

  // Ensure the de-asserted events have cleared from the wakeup pipeline
  // within 30us.
  IBEX_SPIN_FOR(!get_wakeup_status(), 100);
  CHECK_DIF_OK(dif_pwrmgr_wakeup_reason_clear(&pwrmgr));
}
static plic_isr_ctx_t plic_ctx = {.rv_plic = &rv_plic,
                                  .hart_id = kTopDarjeelingPlicTargetIbex0};

static pwrmgr_isr_ctx_t pwrmgr_isr_ctx = {
    .pwrmgr = &pwrmgr,
    .plic_pwrmgr_start_irq_id = kTopDarjeelingPlicIrqIdPwrmgrAonWakeup,
    .expected_irq = kDifPwrmgrIrqWakeup,
    .is_only_irq = true};

/**
 * External interrupt handler.
 */
void ottf_external_isr(void) {
  dif_pwrmgr_irq_t irq_id;
  top_darjeeling_plic_peripheral_t peripheral;

  isr_testutils_pwrmgr_isr(plic_ctx, pwrmgr_isr_ctx, &peripheral, &irq_id);

  // Check that both the peripheral and the irq id is correct
  CHECK(peripheral == kTopDarjeelingPlicPeripheralPwrmgrAon,
        "IRQ peripheral: %d is incorrect", peripheral);
  CHECK(irq_id == kDifPwrmgrIrqWakeup, "IRQ ID: %d is incorrect", irq_id);
}
