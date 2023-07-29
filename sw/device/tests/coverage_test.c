// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "sw/device/lib/testing/test_framework/coverage.h"

#include <stdbool.h>
#include <stdint.h>

#include "sw/device/lib/testing/test_framework/ottf_main.h"
#include "sw/lib/sw/device/arch/device.h"
#include "sw/lib/sw/device/runtime/hart.h"
#include "sw/lib/sw/device/runtime/log.h"
#include "sw/lib/sw/device/runtime/print.h"

static void spin_45(uint8_t state) {
  static const char kSpinnerChars[] = "|/-\\";
  base_printf("%c\r", kSpinnerChars[state]);
}

static void spin_180(void) {
  for (uint8_t state = 0; state < 4; ++state) {
    spin_45(state);
    busy_spin_micros(100 * 1000);  // 0.1s
  }
}

OTTF_DEFINE_TEST_CONFIG();

/**
 * A simple program for testing the coverage functionality.
 *
 * Prints a message and displays a spinning bar.
 */
bool test_main(void) {
  // Print an assuring message.
  LOG_INFO("Collecting coverage data.");
  // Display a spinning bar.
  for (uint8_t i = 0; i < 4; ++i) {
    spin_180();
  }
  return true;
}
