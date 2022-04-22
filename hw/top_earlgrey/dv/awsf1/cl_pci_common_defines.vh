// SPDX-FileCopyrightText: Copyright © 2022 by Rivos Inc.
// Confidential and proprietary, see LICENSE for details.
// SPDX-License-Identifier: LicenseRef-Rivos-Internal-Only


`ifndef CL_PCI_COMMON_DEFINES
 
`define CL_PCI_COMMON_DEFINES

// Size of counters.
`define CL_COUNT_WIDTH              64
`define CL_COUNT_SM_WIDTH           32

// The special sync data for sync reads and writes.
// This is written in bits 31:16 of the write data.
`define CL_SYNC_SIGNATURE        16'habcd


// Instruction defines.
`define CL_INSTR_WRITE_WIDTH         80
`define CL_INSTR_READ_WIDTH          80
`define CL_INSTR_ADDR_BITS         63:0
`define CL_INSTR_ADDR_WIDTH          64
`define CL_INSTR_LENGTH_BITS      71:64
`define CL_INSTR_LENGTH_WIDTH         8
`define CL_INSTR_IDENT_BITS       79:72
`define CL_INSTR_IDENT_WIDTH          8
// The PCIW sync bits are encoded as follows:
//    00 = No sync
//    01 = Write sync with data
//    10 = Write sync immediately after data
//    11 = Write sync after all write instructions
`define CL_INSTR_PCIW_SYNC_BITS   79:78
`define CL_INSTR_PCIW_SYNC_WIDTH      2
`define CL_INSTR_PCIR_SYNC_BIT       79

`define CL_SYNC_SIZE_WIDTH            3
`define CL_SYNC_SIZE_4_BYTES       3'h0
`define CL_SYNC_SIZE_8_BYTES       3'h1
`define CL_SYNC_SIZE_16_BYTES      3'h2
`define CL_SYNC_SIZE_32_BYTES      3'h3
`define CL_SYNC_SIZE_64_BYTES      3'h4

  // The maximum queue width size.
`define CL_MAX_Q_SIZE_WIDTH           4

// Instruction identifier bits.
`define CL_INSTR_IDENT_SYNC       0x80 

// The count width for read and write calls
// to each port (instruction) interface.
`define CL_INST_CNT_WIDTH  8


`endif

