// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "sw/lib/sw/device/silicon_creator/manifest.h"

#include "sw/ip/flash_ctrl/driver/flash_ctrl.h"
#include "sw/lib/sw/device/silicon_creator/base/chip.h"

static_assert(CHIP_ROM_EXT_SIZE_MIN >= CHIP_MANIFEST_SIZE,
              "`CHIP_ROM_EXT_SIZE_MIN` is too small");
static_assert(CHIP_ROM_EXT_SIZE_MAX >= CHIP_ROM_EXT_SIZE_MIN,
              "`CHIP_ROM_EXT_SIZE_MAX` is too small");
static_assert(CHIP_BL0_SIZE_MIN >= CHIP_MANIFEST_SIZE,
              "`CHIP_BL0_SIZE_MIN` is too small");
static_assert(CHIP_BL0_SIZE_MAX >= CHIP_BL0_SIZE_MIN,
              "`CHIP_BL0_SIZE_MAX` is too small");

// Extern declarations for the inline functions in the manifest header.
extern rom_error_t manifest_check(const manifest_t *manifest);
extern manifest_digest_region_t manifest_digest_region_get(
    const manifest_t *manifest);
extern epmp_region_t manifest_code_region_get(const manifest_t *manifest);
extern uintptr_t manifest_entry_point_get(const manifest_t *manifest);
extern rom_error_t manifest_get_ext_spx_key(
    const manifest_t *manifest, const manifest_ext_spx_key_t **spx_key);
extern rom_error_t manifest_get_ext_spx_signature(
    const manifest_t *manifest,
    const manifest_ext_spx_signature_t **spx_signature);
