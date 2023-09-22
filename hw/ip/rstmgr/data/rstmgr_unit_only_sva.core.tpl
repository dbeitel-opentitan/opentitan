CAPI=2:
# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0
name: "lowrisc:dv:rstmgr_unit_only_sva:0.1"
description: "RSTMGR assertion modules not suitable for chip level and bind file."
filesets:
  files_dv:
    depend:
      - lowrisc:tlul:headers
      - lowrisc:fpv:csr_assert_gen
      - lowrisc:dv:pwrmgr_rstmgr_sva_if
      - lowrisc:dv:rstmgr_unit_only_bind

  files_formal:
    depend:
      - lowrisc:systems:rstmgr

generate:
  csr_assert_gen:
    generator: csr_assert_gen
    parameters:
      spec: ../../../data/autogen/rstmgr.hjson

targets:
  default: &default_target
    filesets:
      - files_dv
    generate:
      - csr_assert_gen
  formal:
    <<: *default_target
    filesets:
      - files_formal
      - files_dv
    toplevel: rstmgr
