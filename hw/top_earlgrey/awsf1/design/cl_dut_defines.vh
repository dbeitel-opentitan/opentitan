// SPDX-FileCopyrightText: Copyright © 2022 by Rivos Inc.
// Confidential and proprietary, see LICENSE for details.
// SPDX-License-Identifier: LicenseRef-Rivos-Internal-Only


//
//   The maximum number of read and write ports in the DUT.
//
`define CL_DUT_NUM_WR_PORT         1 
`define CL_DUT_NUM_WR_PORT_WIDTH   1 
`define CL_DUT_NUM_RD_PORT         1
`define CL_DUT_NUM_RD_PORT_WIDTH   1

`define CL_DUT_WR_BRAM_DEPTH       2  // Use CL_DUT_NUM_WR_PORT if not 1, 2 otherwise.
`define CL_DUT_RD_BRAM_DEPTH       2  // Use CL_DUT_NUM_WR_PORT if not 1, 2 otherwise.

// Not used in this model.
`define CL_DUT_NUM_PP_PORT         1
`define CL_DUT_NUM_PP_PORT_WIDTH   1

 // Needs to be at least 64 bigger than DUT_READ_SIZE for sync data.
`define CL_DUT_WPORT_WIDTH         352
`define CL_DUT_RPORT_WIDTH         192
  
//  Is the write port 1024 bits or more??
//  `define CL_WPORT_1024_BITS  1
//  Is the read port 1024 bits or more??
//  `define CL_RPORT_1024_BITS  1
