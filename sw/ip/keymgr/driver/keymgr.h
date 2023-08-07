// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#ifndef OPENTITAN_SW_IP_KEYMGR_DRIVER_KEYMGR_H_
#define OPENTITAN_SW_IP_KEYMGR_DRIVER_KEYMGR_H_

#include <stdbool.h>
#include <stdint.h>

#include "sw/lib/sw/device/base/macros.h"

#ifdef __cplusplus
extern "C" {
#endif  // __cplusplus

/**
 * @file
 * @brief This header contains declarations of device-specific driver information.
 *
 * This header contains "device-specific" driver declarations, i.e., information
 * that all device implementations must provide, but which is specific to the
 * particular choice of platform.
 *
 * Definitions for these symbols can be found in other files in the
 * device-specific directory, which should be linked in depending on which
 * platform an executable is intended for.
 */

/**
 * Peripheral base address for core device on flash_ctrl.
 *
 * This should be used with #mmio_region_from_addr to access the memory-mapped
 * registers associated with the peripheral (usually via a DIF).
 */
extern const uint32_t kKeymgrBaseAddr[1];

#ifdef __cplusplus
}  // extern "C"
#endif  // __cplusplus

#endif  // OPENTITAN_SW_IP_KEYMGR_DRIVER_KEYMGR_H_
