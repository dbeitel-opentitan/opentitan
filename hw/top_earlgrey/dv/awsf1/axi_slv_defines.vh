// SPDX-FileCopyrightText: Copyright © 2022 by Rivos Inc.
// Confidential and proprietary, see LICENSE for details.
// SPDX-License-Identifier: LicenseRef-Rivos-Internal-Only


`ifndef AXI_SLV_DEFINES

   `define AXI_SLV_DEFINES

      // Delay from read address to read data.
   `define READ_ADDR_TO_READ_CYCLES    8'h8

      //
      //    Uncomment to print out interface debug prints.
      //
      // `define PRINT_DRAM_XTOR_DEBUG  1

      // AXI sizes.
   `define AXIS_ID_BITS      16
   `define AXIS_ADDR_BITS    64
   `define AXIS_DATA_BITS   512
   `define AXIS_STRB_BITS    64
 
`endif

