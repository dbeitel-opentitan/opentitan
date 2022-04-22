// SPDX-FileCopyrightText: Copyright © 2022 by Rivos Inc.
// Confidential and proprietary, see LICENSE for details.
// SPDX-License-Identifier: LicenseRef-Rivos-Internal-Only


`ifndef CL_PCIR_MSTR_DEFINES
 
 `define CL_PCIR_MSTR_DEFINES


`define CL_PCIR_AXI_WIDTH          512

`define CL_PCIR_BURST_BITS         3:0 
`define CL_PCIR_BURST_WIDTH          4

`define CL_PCIR_WAIT_WIDTH           8

`define CL_PCIR_MAX_Q_DEPTH          4
`define CL_PCIR_MAX_Q_WIDTH          2

`define CL_PCIR_MAX_READ_REQUESTS   32
`define CL_PCIR_READ_REQUEST_WIDTH   5

/******************************************************************
 *                                                                *
 *     These are the OCL instructions used to program the PCIR    *
 *                                                                *
 ******************************************************************/
//  Start the PCIR state machine.
//  1 = Run, 0 = Stop.
`define CL_PCIR_RUN           8'h00

// State machine run dut cycle count.
// 0, 0 = No cycle stop count.
`define CL_PCIR_RUN_DUT_CYCLES_LO  8'h04
`define CL_PCIR_RUN_DUT_CYCLES_HI  8'h08

//   Number of read and write instructions.
//   These instructions are read from the RAM memories.
`define CL_PCIR_INSTR_COUNT    8'h18

//   Write/Read instruction RAM index
`define CL_PCIR_INDEX          8'h20

//   Write/Read instruction low addresses
`define CL_PCIR_ADDR_LO        8'h24
`define CL_PCIR_ADDR_HI        8'h28

//   Write/Read instruction target identifier
//
//   Bit 0x80 - sync operation bit.
//      This causes the write state machine to
//      execute an extra write with the port count
//      at the low address location.
//
`define CL_PCIR_IDENT          8'h2c


//   The length of the writes/reads.
//    0 =  0 bytes
//    1 = 64 bytes
//    2 = 128 bytes
//     ....
//    4 = 256 bytes
//     ....
//    16 = 1024 bytes
//
//   Writing these registers will trigger the RAM instruction update.
`define CL_PCIR_LEN           8'h3c


// Write/Read queue depth in the host memory.
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
`define CL_PCIR_READ_Q_SIZE_7_0     8'h48
`define CL_PCIR_READ_Q_SIZE_15_8    8'h4c
`define CL_PCIR_READ_Q_SIZE_23_16   8'h50
`define CL_PCIR_READ_Q_SIZE_31_24   8'h54

// How many bytes included in sync data
`define CL_PCIR_SYNC_BYTES      8'h74

//     Instruction wait count.  The number of
//  cycles to wait for before starting the
//  read instructions.  This is used to give the
//  previous writes time to complete before the
//  reads are starting to reduce the number of
//  read retries.
//
// `define CL_PCIR_READ_WAIT      8'h80

   // Maximum number of active read requests.
`define CL_PCIR_MAX_RD_REQUESTS   8'h81

// Number of Rresponse errors.
`define CL_PCIR_RRESP_ERR_COUNT   8'hd8

// Rresponse first error value:
//   31:4  - User
//    1:0  - Response.
`define CL_PCIR_RRESP_ERR_VALUE   8'hdc

// Total number of design under test cycles.
`define CL_PCIR_DUT_CYCLES_LO      8'he8
`define CL_PCIR_DUT_CYCLES_HI      8'hec

//  Total number of cycles the read state machine was busy.
`define CL_PCIR_SM_CYCLES_LO       8'hf0
`define CL_PCIR_SM_CYCLES_HI       8'hf4


`endif

