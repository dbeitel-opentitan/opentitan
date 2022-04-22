// SPDX-FileCopyrightText: Copyright © 2022 by Rivos Inc.
// Confidential and proprietary, see LICENSE for details.
// SPDX-License-Identifier: LicenseRef-Rivos-Internal-Only

`include "dut.vh"
`include "cl_dut_defines.vh"

import "DPI-C" function void write_data_dpi_call (
             input int write_data[`DUT_WRITE_WORDS]);


/*************************************************************************
 *                                                                       *
 *      A write port interface.                                          *
 *                                                                       *
 *      When the write_active signal is high, the write data             *
 *   is sent using a DPI call.                                           *
 *                                                                       *
 *************************************************************************/


module write_port (
   input 		       clk,

      // These signals go to the DUT.	   
   input  		          write_active,
   input [`DUT_WRITE_SIZE-1:0] write_data,
	   
     // These signals go to the FPGA state machines.
  output logic [`CL_DUT_NUM_WR_PORT-1:0]                              write_inst_active,
  output logic [`CL_DUT_NUM_WR_PORT-1:0][`CL_DUT_WPORT_WIDTH-1:0]    write_port_data
);
  
   assign write_inst_active[0] = {write_active};
     // Shift port data by 32-bits as the bottom bits are used for sync.
     // May want to move this shift into the state machines, as it's a little
     // confusing here.
   assign write_port_data[0][`DUT_WRITE_SIZE-1+32:0] = {write_data[`DUT_WRITE_SIZE-1:0], 32'h0};
   
endmodule // write_port
