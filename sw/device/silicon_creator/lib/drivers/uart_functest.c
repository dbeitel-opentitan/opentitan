// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include <stdbool.h>
#include <stdint.h>

#include "sw/device/lib/testing/test_framework/ottf_main.h"
#include "sw/device/silicon_creator/lib/drivers/uart.h"
#include "sw/lib/sw/device/arch/device.h"
#include "sw/lib/sw/device/runtime/print.h"
#include "sw/lib/sw/device/silicon_creator/error.h"

#include "hw/top_darjeeling/sw/autogen/top_darjeeling.h"

OTTF_DEFINE_TEST_CONFIG(.console.test_may_clobber = true);

rom_error_t uart_test(void) {
  // Configure UART0 as stdout.
  uart_init(kUartNCOValue);
  base_set_stdout((buffer_sink_t){
      .data = NULL,
      .sink = uart_sink,
  });

  base_printf("uart functional test!\r\n");
  return kErrorOk;
}

bool test_main(void) {
  status_t result = OK_STATUS();
  EXECUTE_TEST(result, uart_test);
  return status_ok(result);
}
