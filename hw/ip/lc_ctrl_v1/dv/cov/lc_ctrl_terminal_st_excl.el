// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// This File excludes FSM state transition coverage from some states to invalid state.
// These transactions are fully coverage in FPV.
//
//==================================================
// This file contains the Excluded objects
// Generated By User: chencindy
// Format Version: 2
// Date: Fri May 12 10:52:23 2023
// ExclMode: default
//==================================================
CHECKSUM: "2580972288 3547911629"
INSTANCE: tb.dut.u_lc_ctrl_fsm
Fsm fsm_state_q "1774514253"
ANNOTATION: "[LOW_RISK] The transition from any state to error_terminal state is fully verified in FPV."
Transition ClkMuxSt->InvalidSt "52937->12620"
Fsm fsm_state_q "1774514253"
ANNOTATION: "[LOW_RISK] The transition from any state to error_terminal state is fully verified in FPV."
Transition TransProgSt->InvalidSt "33195->12620"
Fsm fsm_state_q "1774514253"
ANNOTATION: "[LOW_RISK] The transition from any state to error_terminal state is fully verified in FPV."
Transition TransCheckSt->InvalidSt "28336->12620"
Fsm fsm_state_q "1774514253"
ANNOTATION: "[LOW_RISK] The transition from any state to error_terminal state is fully verified in FPV."
Transition TokenHashSt->InvalidSt "53823->12620"
Fsm fsm_state_q "1774514253"
ANNOTATION: "[LOW_RISK] The transition from any state to error_terminal state is fully verified in FPV."
Transition TokenCheck1St->InvalidSt "54639->12620"
Fsm fsm_state_q "1774514253"
ANNOTATION: "[LOW_RISK] The transition from any state to error_terminal state is fully verified in FPV."
Transition TokenCheck0St->InvalidSt "8384->12620"
Fsm fsm_state_q "1774514253"
ANNOTATION: "[LOW_RISK] The transition from any state to error_terminal state is fully verified in FPV."
Transition ResetSt->InvalidSt "63164->12620"
Fsm fsm_state_q "1774514253"
ANNOTATION: "[LOW_RISK] The transition from any state to error_terminal state is fully verified in FPV."
Transition PostTransSt->InvalidSt "27948->12620"
Fsm fsm_state_q "1774514253"
ANNOTATION: "[LOW_RISK] The transition from any state to error_terminal state is fully verified in FPV."
Transition EscalateSt->InvalidSt "48539->12620"
Fsm fsm_state_q "1774514253"
ANNOTATION: "[LOW_RISK] The transition from any state to error_terminal state is fully verified in FPV."
Transition FlashRmaSt->InvalidSt "59535->12620"
Fsm fsm_state_q "1774514253"
ANNOTATION: "[LOW_RISK] The transition from any state to error_terminal state is fully verified in FPV."
Transition CntProgSt->InvalidSt "3156->12620"
Fsm fsm_state_q "1774514253"
ANNOTATION: "[LOW_RISK] The transition from any state to error_terminal state is fully verified in FPV."
Transition CntIncrSt->InvalidSt "13255->12620"
