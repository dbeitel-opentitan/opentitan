// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// xbar_cov_excl.el generated by `tlgen.py` tool

ANNOTATION: "[NON_RTL]"
MODULE: uvm_pkg
Assert \uvm_reg_map::do_write .unnamed$$_0.unnamed$$_1 "assertion"
Assert \uvm_reg_map::do_read .unnamed$$_0.unnamed$$_1 "assertion"

ANNOTATION: "[UNSUPPORTED] scan mode isn't available in RTL sim"
MODULE: xbar_mbx
Block 1 "0" "assign unused_scanmode = scanmode_i;"
