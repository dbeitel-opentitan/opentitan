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
MODULE: xbar_main
Block 1 "0" "assign unused_scanmode = scanmode_i;"

ANNOTATION: "[UNR]"
MODULE: prim_fifo_sync
Branch 2 "2323268504" "(!rst_ni)" (1) "(!rst_ni) 0,1,-,-"
Branch 3 "3736627057" "(!rst_ni)" (1) "(!rst_ni) 0,1,-,-"

ANNOTATION: "[UNR]"
MODULE: prim_arbiter_ppc ( parameter N=2,DW=102,EnDataPort=1,EnReqStabA=0 )
Condition 2 "175047464" "(valid_o && ((!ready_i))) 1 -1" (2 "10")

ANNOTATION: "[UNR]"
MODULE: prim_arbiter_ppc ( parameter N=3,DW=102,EnDataPort=1,EnReqStabA=0 )
Condition 2 "175047464" "(valid_o && ((!ready_i))) 1 -1" (2 "10")

ANNOTATION: "[UNR]"
MODULE: prim_arbiter_ppc ( parameter N=4,DW=102,EnDataPort=1,EnReqStabA=0 )
Condition 2 "175047464" "(valid_o && ((!ready_i))) 1 -1" (2 "10")
