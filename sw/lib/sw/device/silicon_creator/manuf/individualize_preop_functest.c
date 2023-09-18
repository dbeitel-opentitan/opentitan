// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "sw/device/lib/testing/test_framework/check.h"
#include "sw/device/lib/testing/test_framework/ottf_main.h"
#include "sw/ip/otp_ctrl/dif/dif_otp_ctrl.h"
#include "sw/ip/otp_ctrl/driver/otp_ctrl.h"
#include "sw/lib/sw/device/base/status.h"
#include "sw/lib/sw/device/silicon_creator/manuf/individualize_preop.h"

#include "otp_ctrl_regs.h"  // Generated

OTTF_DEFINE_TEST_CONFIG();

bool test_main(void) {
  static dif_otp_ctrl_t otp_ctrl;
  CHECK_DIF_OK(dif_otp_ctrl_init(
      mmio_region_from_addr(kOtpCtrlCoreBaseAddr[0]), &otp_ctrl));
  CHECK_STATUS_OK(individualize_preop_otp_write(&otp_ctrl));
  return true;
}
