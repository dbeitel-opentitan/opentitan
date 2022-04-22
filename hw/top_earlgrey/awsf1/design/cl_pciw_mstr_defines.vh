// SPDX-FileCopyrightText: Copyright © 2022 by Rivos Inc.
// Confidential and proprietary, see LICENSE for details.
// SPDX-License-Identifier: LicenseRef-Rivos-Internal-Only


`ifndef CL_PCIW_MSTR_DEFINES
 
`define CL_PCIW_MSTR_DEFINES

`define CL_PCIW_AXI_WIDTH         512
`define CL_PCIW_CLK_DELAY_WIDTH     4

`define CL_PCIW_DUT_RESET_WIDTH     8
`define CL_PCIW_DUT_RESET_CNT   8'h80
  // Stop enabling DUT clock when reset count
  // reaches this value.
`define CL_PCIW_DUT_RESET_CLK    8'h1

// The PCIW sync bits are encoded as follows:
//    00 = No sync
//    01 = Write sync with data
//    10 = Write sync immediately after data
//    11 = Write sync after all write instructions
`define CL_PCIW_SYNC_NONE        2'h0
`define CL_PCIW_SYNC_WITH_DATA   2'h1
`define CL_PCIW_SYNC_AFTER_DATA  2'h2
`define CL_PCIW_SYNC_SPLIT       2'h3


/*******************************************************
 *    These are the OCL instructions in the PCIW.      *
 *******************************************************/

//  Start the PCIW state machine.
//  1 = Run, 0 = Stop.
`define CL_PCIW_RUN           8'h00

// State machine run dut cycle count.
// 0, 0 = No cycle stop count.
`define CL_PCIW_RUN_DUT_CYCLES_LO  8'h04
`define CL_PCIW_RUN_DUT_CYCLES_HI  8'h08

// State machine delays before and after issuing
// the DUT clock.
`define CL_PCIW_BEFORE_CLK_DLY     8'h10
`define CL_PCIW_AFTER_CLK_DLY      8'h14

//   Number of write instructions.
//   These instructions are kept in the RAM memories.
`define CL_PCIW_INSTR_COUNT   8'h18

//   Write instruction RAM index
`define CL_PCIW_INDEX   8'h20

//   Write instruction low addresses
`define CL_PCIW_ADDR_LO     8'h24
`define CL_PCIW_ADDR_HI     8'h28

//   Write instruction target identifier
//
//   Bit 0x80 - sync operation bit.
//      This causes the write state machine to
//      execute an extra write with the port count
//      at the low address location.
//
`define CL_PCIW_IDENT       8'h2c

//   The length of the writes/reads.
//    0 =  0 bytes
//    1 = 64 bytes
//    2 = 128 bytes
//     ....
//    4 = 256 bytes
//     ....
//    16 = 1024 bytes
//
//   NOTE: Writing this register will trigger the RAM 
//         instruction update.
`define CL_PCIW_LEN       8'h3c


// Write queue depth in the host memory.
// The write address will by incremented by the
// length of the read and write for each queue
// entry.  The queue wraps to the base address
// after the queue size is reached.
// The queue size is stored as a mask as follows:
//   4'b0000 =  1 queue size
//   4'b0001 =  2 queue size
//   4'b0011 =  4 queue size
//   4'b0111 =  8 queue size
//   4'b1111 = 16 queue size
`define CL_PCIW_Q_STATUS       8'h40
`define CL_PCIW_Q_ENABLES      8'h44
`define CL_PCIW_Q_SIZE_7_0     8'h48
`define CL_PCIW_Q_SIZE_15_8    8'h4c
`define CL_PCIW_Q_SIZE_23_16   8'h50
`define CL_PCIW_Q_SIZE_31_24   8'h54
`define CL_PCIW_Q_BOT_7_0      8'h58
`define CL_PCIW_Q_BOT_15_8     8'h5c
`define CL_PCIW_Q_BOT_23_16    8'h60
`define CL_PCIW_Q_BOT_31_24    8'h64

// Stop clock on DUT error?
`define CL_PCIW_STOP_CLK_ERR   8'h70

// How many bytes included in sync data
`define CL_PCIW_SYNC_BYTES      8'h74

// Number of Bresponse errors.
`define CL_PCIW_BRESP_ERR_COUNT    8'hd0

// Bresponse first error value:
//   31:4  - User
//    1:0  - Response.
`define CL_PCIW_BRESP_ERR_VALUE    8'hd4


//  Total number of clock cycles.
`define CL_PCIW_TOTAL_CYCLES_LO    8'he0
`define CL_PCIW_TOTAL_CYCLES_HI    8'he4

// Total number of design under test cycles.
`define CL_PCIW_DUT_CYCLES_LO      8'he8
`define CL_PCIW_DUT_CYCLES_HI      8'hec

//  Total number of cycles the write state machine was busy.
`define CL_PCIW_SM_CYCLES_LO       8'hf0
`define CL_PCIW_SM_CYCLES_HI       8'hf4


`endif

