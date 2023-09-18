// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include <stdbool.h>

#include "sw/device/lib/testing/test_framework/check.h"
#include "sw/device/lib/testing/test_framework/ottf_main.h"
#include "sw/device/silicon_creator/lib/drivers/otp.h"
#include "sw/ip/keymgr/dif/dif_keymgr.h"
#include "sw/ip/keymgr/test/utils/keymgr_testutils.h"
#include "sw/lib/sw/device/base/mmio.h"
#include "sw/lib/sw/device/runtime/ibex.h"
#include "sw/lib/sw/device/runtime/log.h"
#include "sw/lib/sw/device/silicon_creator/base/boot_measurements.h"
#include "sw/lib/sw/device/silicon_creator/base/sec_mmio.h"
#include "sw/lib/sw/device/silicon_creator/manifest.h"
#include "sw/lib/sw/device/silicon_creator/manifest_def.h"

#include "hw/top_darjeeling/sw/autogen/top_darjeeling.h"
#include "otp_ctrl_regs.h"  // Generated

OTTF_DEFINE_TEST_CONFIG();

bool test_main(void) {
  dif_keymgr_t keymgr;
  CHECK_DIF_OK(dif_keymgr_init(
      mmio_region_from_addr(TOP_DARJEELING_KEYMGR_BASE_ADDR), &keymgr));

  CHECK_STATUS_OK(keymgr_testutils_check_state(&keymgr, kDifKeymgrStateReset));

  dif_keymgr_binding_value_t bindings;
  CHECK_DIF_OK(dif_keymgr_read_binding(&keymgr, &bindings));

  const manifest_t *manifest = manifest_def_get();

  if (otp_read32(
          OTP_CTRL_PARAM_OWNER_SW_CFG_ROM_KEYMGR_ROM_EXT_MEAS_EN_OFFSET) ==
      kHardenedBoolTrue) {
    // Check that the attestation is equal to the digest.
    CHECK_ARRAYS_EQ(bindings.attestation, boot_measurements.rom_ext.data,
                    ARRAYSIZE(bindings.attestation));
  } else {
    // Check that the attestation is equal to `binding_value` field of the
    // manifest.
    CHECK_ARRAYS_EQ(bindings.attestation, manifest->binding_value.data,
                    ARRAYSIZE(bindings.attestation));
  }

  // Check that the sealing is equal to `binding_value` field of the
  // manifest.
  CHECK_ARRAYS_EQ(bindings.sealing, manifest->binding_value.data,
                  ARRAYSIZE(bindings.sealing));

  // Check that the creator max version is equal to `max_key_version` field of
  // the manifest.
  dif_keymgr_max_key_version_t versions;
  CHECK_DIF_OK(dif_keymgr_read_max_key_version(&keymgr, &versions));
  CHECK(versions.creator_max_key_version == manifest->max_key_version);
  return true;
}
