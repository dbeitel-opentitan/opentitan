// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
#include <assert.h>

#include "spi_host_flash_test_impl.h"
#include "sw/device/lib/testing/test_framework/check.h"
#include "sw/device/lib/testing/test_framework/ottf_main.h"
#include "sw/ip/spi_device/test/utils/spi_device_testutils.h"
#include "sw/ip/spi_host/dif/dif_spi_host.h"
#include "sw/ip/spi_host/test/utils/spi_flash_testutils.h"
#include "sw/lib/sw/device/arch/device.h"
#include "sw/lib/sw/device/base/macros.h"
#include "sw/lib/sw/device/base/memory.h"
#include "sw/lib/sw/device/base/mmio.h"
#include "sw/lib/sw/device/runtime/hart.h"
#include "sw/lib/sw/device/runtime/log.h"
#include "sw/lib/sw/device/runtime/print.h"

#include "hw/top_darjeeling/sw/autogen/top_darjeeling.h"

static_assert(__BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__,
              "This test assumes the target platform is little endian.");

OTTF_DEFINE_TEST_CONFIG();

bool test_main(void) {
  dif_spi_host_t spi_host;
  CHECK_DIF_OK(dif_spi_host_init(
      mmio_region_from_addr(TOP_DARJEELING_SPI_HOST0_BASE_ADDR), &spi_host));

  CHECK(kClockFreqPeripheralHz <= UINT32_MAX,
        "kClockFreqPeripheralHz must fit in uint32_t");

  CHECK_DIF_OK(dif_spi_host_configure(&spi_host,
                                      (dif_spi_host_config_t){
                                          .spi_clock = 1000000,
                                          .peripheral_clock_freq_hz =
                                              (uint32_t)kClockFreqPeripheralHz,
                                      }),
               "SPI_HOST config failed!");
  CHECK_DIF_OK(dif_spi_host_output_set_enabled(&spi_host, true));

  status_t result = OK_STATUS();
  EXECUTE_TEST(result, test_software_reset, &spi_host);
  EXECUTE_TEST(result, test_read_sfdp, &spi_host);
  EXECUTE_TEST(result, test_sector_erase, &spi_host);
  EXECUTE_TEST(result, test_enable_quad_mode, &spi_host);
  EXECUTE_TEST(result, test_page_program, &spi_host);
  return status_ok(result);
}
