// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
#include "sw/device/silicon_creator/lib/drivers/rnd.h"

#include "sw/device/silicon_creator/lib/drivers/otp.h"
#include "sw/lib/sw/device/base/abs_mmio.h"
#include "sw/lib/sw/device/base/csr.h"
#include "sw/lib/sw/device/base/hardened.h"
#include "sw/lib/sw/device/base/macros.h"
#include "sw/lib/sw/device/silicon_creator/crc32.h"

#include "hw/top_darjeeling/sw/autogen/top_darjeeling.h"
#include "otp_ctrl_regs.h"
#include "rv_core_ibex_regs.h"

enum {
  kBaseIbex = TOP_DARJEELING_RV_CORE_IBEX_CFG_BASE_ADDR,
};

uint32_t rnd_uint32(void) {
  if (otp_read32(OTP_CTRL_PARAM_CREATOR_SW_CFG_RNG_EN_OFFSET) ==
      kHardenedBoolTrue) {
    // When bit-0 is clear an EDN request for new data for RND_DATA is
    // pending.
    while (!abs_mmio_read32(kBaseIbex + RV_CORE_IBEX_RND_STATUS_REG_OFFSET)) {
    }
  }
  uint32_t mcycle;
  CSR_READ(CSR_REG_MCYCLE, &mcycle);
  return mcycle + abs_mmio_read32(kBaseIbex + RV_CORE_IBEX_RND_DATA_REG_OFFSET);
}
