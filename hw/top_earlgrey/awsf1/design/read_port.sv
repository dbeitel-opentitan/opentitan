// SPDX-FileCopyrightText: Copyright © 2022 by Rivos Inc.
// Confidential and proprietary, see LICENSE for details.
// SPDX-License-Identifier: LicenseRef-Rivos-Internal-Only

`include "dut.vh"
`include "cl_dut_defines.vh"

import "DPI-C" function void read_data_dpi_call (
             output int read_data[`DUT_READ_WORDS]);


/*************************************************************************
 *                                                                       *
 *      A read port interface.                                           *
 *                                                                       *
 *      When the read_active signal is high, the read data               *
 *   is sent using a DPI call.                                           *
 *                                                                       *
 *************************************************************************/


module read_port (
  input 			    clk,

     // These signals go to the DUT.
  input 			    read_active,
  output logic [`DUT_READ_SIZE-1:0] read_data,

     // These signals go to the FPGA state machines.
  output logic [`CL_DUT_NUM_RD_PORT-1:0]                            read_inst_active,
  input  logic [`CL_DUT_NUM_RD_PORT-1:0][`CL_DUT_RPORT_WIDTH-1:0]   read_port_data
);
   assign read_inst_active[0:0] = {read_active};
     // Shift port data by 32-bits as the bottom bits are used for sync.
     // May want to move this shift into the state machines, as it's a little
     // confusing here.
   assign read_data[`DUT_READ_SIZE-1:0] = read_port_data[0][`DUT_READ_SIZE-1+32:32];
endmodule // read_port
