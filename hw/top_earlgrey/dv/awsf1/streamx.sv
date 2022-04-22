// SPDX-FileCopyrightText: Copyright © 2022 by Rivos Inc.
// Confidential and proprietary, see LICENSE for details.
// SPDX-License-Identifier: LicenseRef-Rivos-Internal-Only

// Copyright (c) 2021 by Rivos Inc.
// Confidential and proprietary, see LICENSE for details.
// SPDX-License-Identifier: LicenseRef-Rivos-Internal-Only


/*************************************************************************
 *                                                                       *
 *       This is the stream transactor. It's sends and receives data     *
 *   from the DUT using the read_port and write_port modules.            *
 *                                                                       *
 *************************************************************************/

`include "cl_dut_defines.vh"
`include "dut.vh"

module streamx (
  input logic rst_l,
  /*AUTOINPUT*/
  // Beginning of automatic inputs (from unused autoinst inputs)
  input			clk,			// To read_port_0 of read_port.v, ...
  input logic [`CL_DUT_NUM_RD_PORT-1:0] [`CL_DUT_RPORT_WIDTH-1:0] read_port_data,// To read_port_0 of read_port.v
  input [`DUT_WRITE_SIZE-1:0] write_data,	// To write_port_0 of write_port.v
  // End of automatics
  /*AUTOOUTPUT*/
  // Beginning of automatic outputs (from unused autoinst outputs)
  output logic [`DUT_READ_SIZE-1:0] read_data,	// From read_port_0 of read_port.v
  output logic [`CL_DUT_NUM_RD_PORT-1:0] read_inst_active,// From read_port_0 of read_port.v
  output logic [`CL_DUT_NUM_WR_PORT-1:0] write_inst_active,// From write_port_0 of write_port.v
  output logic [`CL_DUT_NUM_WR_PORT-1:0] [`CL_DUT_WPORT_WIDTH-1:0] write_port_data// From write_port_0 of write_port.v
  // End of automatics
);
  // Read and write vector data every cycle that that we are not in reset.
  logic read_active;
  logic write_active;

   
  reg [7:0] enable_count;

  always @(posedge clk) begin
     if (!rst_l) begin
	enable_count <= 0;
     end
     else begin
	enable_count <= enable_count + 1;
     end
  end

  assign read_active = ((enable_count & 7'h1f) == 7'h1f);
  assign write_active = ((enable_count & 7'h3) == 7'h3);  // rst_l
   

  read_port read_port_0(/*AUTOINST*/
			// Outputs
			.read_data	(read_data[`DUT_READ_SIZE-1:0]),
			.read_inst_active(read_inst_active[`CL_DUT_NUM_RD_PORT-1:0]),
			// Inputs
			.clk		(clk),
			.read_active	(read_active),
			.read_port_data	(read_port_data/*[`CL_DUT_NUM_RD_PORT-1:0][`CL_DUT_RPORT_WIDTH-1:0]*/));

  write_port write_port_0(/*AUTOINST*/
			  // Outputs
			  .write_inst_active	(write_inst_active[`CL_DUT_NUM_WR_PORT-1:0]),
			  .write_port_data	(write_port_data/*[`CL_DUT_NUM_WR_PORT-1:0][`CL_DUT_WPORT_WIDTH-1:0]*/),
			  // Inputs
			  .clk			(clk),
			  .write_active		(write_active),
			  .write_data		(write_data[`DUT_WRITE_SIZE-1:0]));
endmodule
// Local Variables:
// verilog-auto-read-includes:t
// verilog-library-directories:("." "emul")
// End:
