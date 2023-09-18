// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#ifndef OPENTITAN_SW_LIB_SW_DEVICE_SILICON_CREATOR_SIGVERIFY_MOCK_MOD_EXP_OTBN_H_
#define OPENTITAN_SW_LIB_SW_DEVICE_SILICON_CREATOR_SIGVERIFY_MOCK_MOD_EXP_OTBN_H_

#include "sw/lib/sw/device/base/global_mock.h"
#include "sw/lib/sw/device/silicon_creator/sigverify/mod_exp_otbn.h"
#include "sw/lib/sw/device/silicon_creator/testing/rom_test.h"

namespace rom_test {
namespace internal {

/**
 * Mock class for sigverify_mod_exp_otbn.c
 */
class MockSigverifyModExpOtbn
    : public global_mock::GlobalMock<MockSigverifyModExpOtbn> {
 public:
  MOCK_METHOD(rom_error_t, mod_exp,
              (const sigverify_rsa_key_t *, const sigverify_rsa_buffer_t *,
               sigverify_rsa_buffer_t *));
};

}  // namespace internal

using MockSigverifyModExpOtbn =
    testing::StrictMock<internal::MockSigverifyModExpOtbn>;
}  // namespace rom_test

#endif  // OPENTITAN_SW_LIB_SW_DEVICE_SILICON_CREATOR_SIGVERIFY_MOCK_MOD_EXP_OTBN_H_
