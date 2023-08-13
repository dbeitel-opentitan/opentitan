// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "sw/device/lib/testing/rstmgr_testutils.h"
#include "sw/device/lib/testing/test_framework/check.h"
#include "sw/device/lib/testing/test_framework/ottf_main.h"
#include "sw/ip/rstmgr/dif/dif_rstmgr.h"
#include "sw/lib/sw/device/base/mmio.h"
#include "sw/lib/sw/device/runtime/log.h"

#include "hw/top_darjeeling/sw/autogen/top_darjeeling.h"

static dif_rstmgr_t rstmgr;

OTTF_DEFINE_TEST_CONFIG();

bool test_main(void) {
  CHECK_DIF_OK(dif_rstmgr_init(
      mmio_region_from_addr(TOP_DARJEELING_RSTMGR_AON_BASE_ADDR), &rstmgr));

  dif_rstmgr_reset_info_bitfield_t reason;
  reason = rstmgr_testutils_reason_get();

  // If POR, clear reason and request software reset
  if (reason & kDifRstmgrResetInfoPor) {
    LOG_INFO("POR encountered!");
    rstmgr_testutils_reason_clear();
    CHECK_DIF_OK(dif_rstmgr_software_device_reset(&rstmgr));

    // wait here until device reset
    wait_for_interrupt();
  } else if (reason == kDifRstmgrResetInfoSw) {
    LOG_INFO("Software reset encountered!");
    rstmgr_testutils_reason_clear();
  } else {
    LOG_FATAL("Reset reason unexpected!");
    test_status_set(kTestStatusFailed);
  }

  return true;
}
