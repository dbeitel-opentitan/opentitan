// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// THIS FILE HAS BEEN GENERATED, DO NOT EDIT MANUALLY. COMMAND:
// util/make_new_dif.py --mode=regen --only=autogen

#include "sw/ip/rv_plic/dif/autogen/dif_rv_plic_autogen.h"

#include "gtest/gtest.h"
#include "sw/device/lib/base/mmio.h"
#include "sw/device/lib/base/mock_mmio.h"
#include "sw/common/dif/dif_test_base.h"

#include "rv_plic_regs.h"  // Generated.

namespace dif_rv_plic_autogen_unittest {
namespace {
using ::mock_mmio::MmioTest;
using ::mock_mmio::MockDevice;
using ::testing::Eq;
using ::testing::Test;

class RvPlicTest : public Test, public MmioTest {
 protected:
  dif_rv_plic_t rv_plic_ = {.base_addr = dev().region()};
};

class InitTest : public RvPlicTest {};

TEST_F(InitTest, NullArgs) {
  EXPECT_DIF_BADARG(dif_rv_plic_init(dev().region(), nullptr));
}

TEST_F(InitTest, Success) {
  EXPECT_DIF_OK(dif_rv_plic_init(dev().region(), &rv_plic_));
}

class AlertForceTest : public RvPlicTest {};

TEST_F(AlertForceTest, NullArgs) {
  EXPECT_DIF_BADARG(
      dif_rv_plic_alert_force(nullptr, kDifRvPlicAlertFatalFault));
}

TEST_F(AlertForceTest, BadAlert) {
  EXPECT_DIF_BADARG(
      dif_rv_plic_alert_force(nullptr, static_cast<dif_rv_plic_alert_t>(32)));
}

TEST_F(AlertForceTest, Success) {
  // Force first alert.
  EXPECT_WRITE32(RV_PLIC_ALERT_TEST_REG_OFFSET,
                 {{RV_PLIC_ALERT_TEST_FATAL_FAULT_BIT, true}});
  EXPECT_DIF_OK(dif_rv_plic_alert_force(&rv_plic_, kDifRvPlicAlertFatalFault));
}

}  // namespace
}  // namespace dif_rv_plic_autogen_unittest
