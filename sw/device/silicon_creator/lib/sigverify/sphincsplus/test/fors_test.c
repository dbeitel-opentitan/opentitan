// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "sw/device/silicon_creator/lib/sigverify/sphincsplus/fors.h"

#include <stdint.h>

#include "sw/device/lib/testing/test_framework/check.h"
#include "sw/device/lib/testing/test_framework/ottf_main.h"
#include "sw/device/silicon_creator/lib/sigverify/sphincsplus/hash.h"
#include "sw/lib/sw/device/runtime/ibex.h"
#include "sw/lib/sw/device/runtime/log.h"

OTTF_DEFINE_TEST_CONFIG();

// Test signature and message. Populate before running test.
static uint32_t kTestSig[kSpxForsWords] = {0};
static uint8_t kTestMsg[kSpxForsMsgBytes] = {0};

// Test context.
static spx_ctx_t kTestCtx = {
    .pub_seed = {0xefbeadde},
};

// Test address.
static spx_addr_t kTestAddr = {.addr = {0}};

// This test data was generated by simply running the FORS pk-from-sig function
// from a version where the overall `verify` operation was consistently passing
// tests. Standalone test vectors for FORS don't seem to exist at time of
// writing.
//
// Note: this expected public key is based on the sphincs-shake-128s
// parameter set and will not work for other parameter sets.
static uint32_t kExpectedPk[kSpxNWords] = {0xd2c5c792, 0x80d096bd, 0xdb6d692e,
                                           0xf75f2fe8};

OT_WARN_UNUSED_RESULT
static rom_error_t pk_from_sig_test(void) {
  // Initialize the KMAC block.
  RETURN_IF_ERROR(spx_hash_initialize(&kTestCtx));

  // Extract the public key from the signature.
  uint32_t actual_pk[kSpxNWords];
  RETURN_IF_ERROR(
      fors_pk_from_sig(kTestSig, kTestMsg, &kTestCtx, &kTestAddr, actual_pk));

  // Check results.
  CHECK_ARRAYS_EQ(actual_pk, kExpectedPk, kSpxNWords);
  return kErrorOk;
}

bool test_main(void) {
  status_t result = OK_STATUS();
  LOG_INFO("Starting FORS test...");

  // Populate signature with {0, 1, 2, 3, ... }.
  unsigned char *test_sig_bytes = (unsigned char *)kTestSig;
  for (size_t i = 0; i < kSpxForsBytes; i++) {
    test_sig_bytes[i] = i & 255;
  }

  // Populate message with { ..., 3, 2, 1, 0}.
  for (size_t i = 0; i < kSpxForsMsgBytes; i++) {
    kTestMsg[i] = (kSpxForsMsgBytes - i) & 255;
  }

  EXECUTE_TEST(result, pk_from_sig_test);

  return status_ok(result);
}
