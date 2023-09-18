// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#ifndef OPENTITAN_SW_LIB_SW_DEVICE_SILICON_CREATOR_MOCK_SHUTDOWN_H_
#define OPENTITAN_SW_LIB_SW_DEVICE_SILICON_CREATOR_MOCK_SHUTDOWN_H_

#include "sw/lib/sw/device/base/global_mock.h"
#include "sw/lib/sw/device/silicon_creator/shutdown.h"
#include "sw/lib/sw/device/silicon_creator/testing/rom_test.h"

namespace rom_test {
namespace internal {

/**
 * Mock class for shutdown.
 */
class MockShutdown : public global_mock::GlobalMock<MockShutdown> {
 public:
  MOCK_METHOD(shutdown_error_redact_t, RedactPolicy, ());
  MOCK_METHOD(uint32_t, Redact, (rom_error_t, shutdown_error_redact_t));
  MOCK_METHOD(void, Finalize, (rom_error_t));
};

}  // namespace internal

using MockShutdown = testing::StrictMock<internal::MockShutdown>;

}  // namespace rom_test

#endif  // OPENTITAN_SW_LIB_SW_DEVICE_SILICON_CREATOR_MOCK_SHUTDOWN_H_
