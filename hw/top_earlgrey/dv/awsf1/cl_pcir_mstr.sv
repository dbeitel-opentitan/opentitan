// SPDX-FileCopyrightText: Copyright © 2022 by Rivos Inc.
// Confidential and proprietary, see LICENSE for details.
// SPDX-License-Identifier: LicenseRef-Rivos-Internal-Only


/*****************************************************************
 *         cl_pcir_mstr                                          *
 *****************************************************************/

// Include all of the state machine configuration registers.
`include "cl_pcir_mstr_defines.vh"
`include "cl_dut_defines.vh"
`include "cl_pci_common_defines.vh"
`include "axi_slv_defines.vh"

module  cl_pcir_mstr (
   input 	       clk,
   input 	       rst_n,
   input 	       dut_rst_n,
   output              read_sm_active,
   input               dut_clocked,
		       
   cfg_bus_t.master pcir_cfg_bus,
		      
     // This is the PCIR AXI bus.
     // Read address channel
   output logic [15:0]  cl_sh_pcim_arid,
   output logic [63:0]  cl_sh_pcim_araddr,
   output logic [7:0]   cl_sh_pcim_arlen,
   output logic [2:0]   cl_sh_pcim_arsize,
   output logic         cl_sh_pcim_arvalid,
   input 	        sh_cl_pcim_arready,

      // Read data channel
   input [15:0]         sh_cl_pcim_rid,
   input [511:0]        sh_cl_pcim_rdata,
   input [1:0] 	        sh_cl_pcim_rresp,
   input 	        sh_cl_pcim_rlast,
   input 	        sh_cl_pcim_rvalid,
   output logic         cl_sh_pcim_rready,

      // Are the read ports (instructions) active?
   input[`CL_DUT_NUM_RD_PORT-1:0]  read_inst_active,

      // This is the read data itself.
   output logic[`CL_DUT_NUM_RD_PORT-1:0][`CL_DUT_RPORT_WIDTH-1:0]  read_port_data
);
   parameter DATA_WIDTH = `CL_PCIR_AXI_WIDTH;
   parameter DATA_DWORDS = DATA_WIDTH / 64;
   parameter DATA_BYTES = DATA_WIDTH / 8;

   
    // Unpack the config bus signals.
   logic[31:0] cfg_addr;
   logic[31:0] cfg_wdata;
   logic cfg_wr;
   logic cfg_rd;
   logic cfg_ack;
   logic[31:0] cfg_rdata;

   assign cfg_addr = pcir_cfg_bus.addr;
   assign cfg_wdata = pcir_cfg_bus.wdata;
   assign cfg_wr = pcir_cfg_bus.wr;
   assign cfg_rd = pcir_cfg_bus.rd;
   assign pcir_cfg_bus.ack = cfg_ack;
   assign pcir_cfg_bus.rdata = cfg_rdata;


//--------------------------
// Internal signals
//--------------------------

//
//  These are signals that can be programmed by the OCL.
//
logic                                       cfg_sm_go;
logic[`CL_COUNT_WIDTH-1:0]                  cfg_run_dut_cycle_cnt; 
logic[`CL_DUT_NUM_RD_PORT_WIDTH-1:0]        cfg_rd_num_inst;
logic[`CL_DUT_NUM_RD_PORT_WIDTH-1:0]        cfg_rd_inst_index;
logic[`CL_INSTR_ADDR_WIDTH-1:0]             cfg_read_address;
logic[`CL_INSTR_IDENT_WIDTH-1:0]            cfg_read_identifier;
logic[`CL_PCIR_WAIT_WIDTH-1:0]              cfg_read_wait;
logic[`CL_INSTR_LENGTH_WIDTH-1:0]           cfg_read_length;
// These are the queue sizes.  They are programmed by the OCL.
logic[`CL_DUT_NUM_RD_PORT+3:0][`CL_MAX_Q_SIZE_WIDTH-1:0]   cfg_queue_size;
  // The configuration sync size.
  // Valid values are (4 = 4 bytes)
  //    4, 8, 16, 32, 64
logic [`CL_SYNC_SIZE_WIDTH-1:0]             cfg_sync_size;

logic [`CL_PCIR_READ_REQUEST_WIDTH-1:0]     cfg_max_read_requests;

//
//   These are signals that count events in the CL.
//   They can be read by the OCL.
//
logic[`CL_COUNT_WIDTH-1:0]    dut_cyc_count;       //  Total number of DUT cycles.
  //  Total number of cycles the read state machine is busy.     
logic[`CL_COUNT_WIDTH-1:0]    rd_busy_cyc_count;

 
logic[`CL_COUNT_SM_WIDTH-1:0]  rresp_error_count;      //  Read response error count
logic[31:0] rresp_error_first;      //  First errored RRESP user[27:0], 2'b00, rresp[1:0]



  // Not sure if needed. This is the RAM data out on part A, which is
  // not used (Port A is used for write only).
logic[`CL_INSTR_READ_WIDTH-1:0] rd_cfg_inst_rdata;

// Address used to read the read instruction RAM.
logic[`CL_DUT_NUM_RD_PORT_WIDTH-1:0]  rd_inst_addr;
// Data read from the read instruction RAM.
logic[`CL_INSTR_READ_WIDTH-1:0] inst_rd_rdata;


 //  Sync reset
logic pre_sync_rst_n;
logic sync_rst_n;

always @(negedge rst_n or posedge clk)
   if (!rst_n) begin
      pre_sync_rst_n <= 0;
      sync_rst_n <= 0;
   end
   else begin
      pre_sync_rst_n <= 1;
      sync_rst_n <= pre_sync_rst_n;
   end


// End internal signls
//--------------------------------


//-------------------------------------------
// Configuration
//-------------------------------------------

//
//---------------------------------------

// Are the state machines configured to run?
// cfg_sm_go is the configuration bit.
// sm_go is actual run bit (gated by DUT cycle count check).
logic sm_go;

// Write strobe for read and write instruction RAMs.
logic cfg_read_inst_ram_wr;


//  Flop the configuration signals.
logic[7:0]  cfg_addr_q;        // Only care about lower 8-bits of address, upper bits are decoded in parent module.
logic[31:0] cfg_wdata_q;
logic       cfg_wr_q;
logic       cfg_rd_q;

//
//  Flop configuration signals.
//
always @(posedge clk) begin
   if (!sync_rst_n) begin
      cfg_addr_q <= 8'b0;
      cfg_wdata_q <= 32'b0;
      cfg_wr_q <= 1'b0;
      cfg_rd_q <= 1'b0;
      cfg_ack <= 1'b0;
   end
   else begin 
      cfg_addr_q <= cfg_addr;
      cfg_wdata_q <= cfg_wdata;
      cfg_wr_q <= cfg_wr;
      cfg_rd_q <= cfg_rd;
      cfg_ack <= (cfg_wr_q || cfg_rd_q);
   end
end

//
//   Configuration register assignment using the OCL.
//
always @(posedge clk) begin
   if (!sync_rst_n) begin
      cfg_sm_go <= 1'b0;
      cfg_run_dut_cycle_cnt <= 0;
      cfg_rd_num_inst <= 0;
      cfg_rd_inst_index <= 0;
      cfg_read_address <= 0;
      cfg_read_identifier <= 0;
      cfg_read_length <= 0;
      for (int ind = 0; ind < `CL_DUT_NUM_RD_PORT; ind++)
         cfg_queue_size[ind] <= 0;
      cfg_sync_size <= 0;
      cfg_max_read_requests <= 1;
   end
   else if (cfg_wr_q) begin
      case (cfg_addr_q)
         `CL_PCIR_RUN:                cfg_sm_go <= cfg_wdata_q[0];
         `CL_PCIR_RUN_DUT_CYCLES_LO:  cfg_run_dut_cycle_cnt[31:0] <= cfg_wdata_q;
         `CL_PCIR_RUN_DUT_CYCLES_HI:  cfg_run_dut_cycle_cnt[63:32] <= cfg_wdata_q;
         `CL_PCIR_INSTR_COUNT:        cfg_rd_num_inst <= cfg_wdata_q[`CL_DUT_NUM_RD_PORT_WIDTH-1:0];
         `CL_PCIR_INDEX:              cfg_rd_inst_index <= cfg_wdata_q[`CL_DUT_NUM_RD_PORT_WIDTH-1:0];
         `CL_PCIR_ADDR_LO:            cfg_read_address[31:0] <= cfg_wdata_q;
         `CL_PCIR_ADDR_HI:            cfg_read_address[63:32] <= cfg_wdata_q;
         `CL_PCIR_IDENT:              cfg_read_identifier <= cfg_wdata_q[`CL_INSTR_IDENT_WIDTH-1:0];
         `CL_PCIR_LEN:                cfg_read_length <= cfg_wdata_q[`CL_INSTR_LENGTH_WIDTH-1:0];
   
         `CL_PCIR_READ_Q_SIZE_7_0:      
            {cfg_queue_size[1],  cfg_queue_size[0]} <= cfg_wdata_q[7:0];

   // Only 2 queues for this model.
   //      `CL_PCIR_READ_Q_SIZE_7_0:      
   //         {cfg_queue_size[7],  cfg_queue_size[6],  cfg_queue_size[5],  cfg_queue_size[4],
   //          cfg_queue_size[3],  cfg_queue_size[2],  cfg_queue_size[1],  cfg_queue_size[0]} <= cfg_wdata_q;
   //      `CL_PCIR_READ_Q_SIZE_15_8:      
   //         {cfg_queue_size[15], cfg_queue_size[14], cfg_queue_size[13], cfg_queue_size[12],
   //          cfg_queue_size[11], cfg_queue_size[10], cfg_queue_size[9],  cfg_queue_size[8]} <= cfg_wdata_q;
   //      `CL_PCIR_READ_Q_SIZE_23_16:      
   //         {cfg_queue_size[23], cfg_queue_size[22], cfg_queue_size[21], cfg_queue_size[20],
   //          cfg_queue_size[19], cfg_queue_size[18], cfg_queue_size[17], cfg_queue_size[16]} <= cfg_wdata_q;
   //      `CL_PCIR_READ_Q_SIZE_31_24:      
   //         {cfg_queue_size[31], cfg_queue_size[30], cfg_queue_size[29], cfg_queue_size[28],
    //         cfg_queue_size[27], cfg_queue_size[26], cfg_queue_size[25], cfg_queue_size[24]} <= cfg_wdata_q;
         `CL_PCIR_SYNC_BYTES:         cfg_sync_size  <= cfg_wdata_q[`CL_SYNC_SIZE_WIDTH-1:0];
         `CL_PCIR_MAX_RD_REQUESTS:    cfg_max_read_requests <= cfg_wdata_q[`CL_PCIR_READ_REQUEST_WIDTH-1:0];
      endcase
   end
end // END write to configuration regs from the OCL.


//
//   Configuration register read MUX using the OCL.
//
always @(posedge clk) begin
   if (!sync_rst_n) begin
      cfg_rdata <= 32'h0;
   end
   else if (cfg_rd_q) begin
      case (cfg_addr_q)
         `CL_PCIR_RUN:                cfg_rdata <= {31'b0, cfg_sm_go};
         `CL_PCIR_RUN_DUT_CYCLES_LO:  cfg_rdata <= cfg_run_dut_cycle_cnt[31:0];
         `CL_PCIR_RUN_DUT_CYCLES_HI:  cfg_rdata <= cfg_run_dut_cycle_cnt[63:32];
         `CL_PCIR_INSTR_COUNT:        cfg_rdata <= {{(32-`CL_DUT_NUM_RD_PORT_WIDTH){1'b0}}, cfg_rd_num_inst};
         `CL_PCIR_INDEX:              cfg_rdata <= {{(32-`CL_DUT_NUM_RD_PORT_WIDTH){1'b0}}, cfg_rd_inst_index};
         `CL_PCIR_ADDR_LO:            cfg_rdata <= cfg_read_address[31:0];
         `CL_PCIR_ADDR_HI:            cfg_rdata <= cfg_read_address[63:32];
         `CL_PCIR_IDENT:              cfg_rdata <= {{(32-`CL_INSTR_IDENT_WIDTH){1'b0}}, cfg_read_identifier};
         `CL_PCIR_LEN:                cfg_rdata <= {{(32-`CL_INSTR_LENGTH_WIDTH){1'b0}}, cfg_read_length};
         `CL_PCIR_RRESP_ERR_COUNT:    cfg_rdata <= rresp_error_count;
         `CL_PCIR_RRESP_ERR_VALUE:    cfg_rdata <= rresp_error_first;
         `CL_PCIR_DUT_CYCLES_LO:      cfg_rdata <= dut_cyc_count[31:0];
         `CL_PCIR_DUT_CYCLES_HI:      cfg_rdata <= dut_cyc_count[63:32];
         `CL_PCIR_SM_CYCLES_LO:       cfg_rdata <= rd_busy_cyc_count[31:0];
         `CL_PCIR_SM_CYCLES_HI:       cfg_rdata <= rd_busy_cyc_count[63:32];

         `CL_PCIR_READ_Q_SIZE_7_0:      
            cfg_rdata <= {24'h0, cfg_queue_size[1],  cfg_queue_size[0]};

   // Only 2 queues for this model.
   //      `CL_PCIR_READ_Q_SIZE_7_0:      
   //         cfg_rdata <= {cfg_queue_size[7],  cfg_queue_size[6],  cfg_queue_size[5],  cfg_queue_size[4],
   //                       cfg_queue_size[3],  cfg_queue_size[2],  cfg_queue_size[1],  cfg_queue_size[0]};
   //      `CL_PCIR_READ_Q_SIZE_15_8:      
   //         cfg_rdata <=  {cfg_queue_size[15], cfg_queue_size[14], cfg_queue_size[13], cfg_queue_size[12],
   //                        cfg_queue_size[11], cfg_queue_size[10], cfg_queue_size[9],  cfg_queue_size[8]};
   //      `CL_PCIR_READ_Q_SIZE_23_16:      
   //         cfg_rdata <= {cfg_queue_size[23], cfg_queue_size[22], cfg_queue_size[21], cfg_queue_size[20],
   //                       cfg_queue_size[19], cfg_queue_size[18], cfg_queue_size[17], cfg_queue_size[16]};
   //      `CL_PCIR_READ_Q_SIZE_31_24:      
   //         cfg_rdata <= {cfg_queue_size[31], cfg_queue_size[30], cfg_queue_size[29], cfg_queue_size[28],
   //                       cfg_queue_size[27], cfg_queue_size[26], cfg_queue_size[25], cfg_queue_size[24]};

         `CL_PCIR_SYNC_BYTES:         cfg_rdata <= {{(32-`CL_SYNC_SIZE_WIDTH){1'b0}}, cfg_sync_size};
         `CL_PCIR_MAX_RD_REQUESTS:    cfg_rdata <= {{(32-`CL_PCIR_READ_REQUEST_WIDTH){1'b0}}, cfg_max_read_requests};
         default:                     cfg_rdata <= 32'hdeadbeef;
      endcase
   end
   else begin
      cfg_rdata <= cfg_rdata;
   end
end  // End read configuration data.


// Trigger the instruction RAM writes when the length is written by the OCL.
always @(posedge clk) begin
   if (!sync_rst_n) begin
      cfg_read_inst_ram_wr <= 1'b0;
   end
   else begin
      cfg_read_inst_ram_wr = (cfg_wr_q && (cfg_addr_q == `CL_PCIR_LEN));
   end
end



//---------------------------------------
//    Instruction RAMs
//---------------------------------------

//
//   The instruction format is:
//
//      63:0     Read address
//      71:64    Read length
//      79:72    Read target identifier.
//                 Bit 79 = instruction uses sync mode.
//

bram_2rw #(.WIDTH(`CL_INSTR_READ_WIDTH), .ADDR_WIDTH(`CL_DUT_NUM_RD_PORT_WIDTH), .DEPTH(`CL_DUT_RD_BRAM_DEPTH)) READ_INST_RAM (
   .clk(clk),
   .wea(cfg_read_inst_ram_wr),
   .ena(1'b1),
   .addra(cfg_rd_inst_index),
   .da({cfg_read_identifier, cfg_read_length, cfg_read_address}),
   .qa(rd_cfg_inst_rdata),

   .web(1'b0),
   .enb(1'b1),
   .addrb(rd_inst_addr),
   .db({(`CL_INSTR_READ_WIDTH){1'b0}}),
   .qb(inst_rd_rdata)
   );

//-----------------------------------
//  Data used by the state machines.
//-----------------------------------


typedef enum logic[2:0] {
   RD_IDLE = 0,
   RD_START = 1,
   RD_READ_INST = 2,
   RD_ADDR = 3
} rd_state_t;

rd_state_t rd_state, rd_state_nxt;


typedef enum logic[2:0] {
   CLK_IDLE = 0,
   CLK_BUSY = 1,
   CLK_WAIT = 2
} clk_state_t;

clk_state_t clk_state, clk_state_nxt;

   
// Read instruction counts for memory sync.
// This is stored on a per port queue entry.  It is updated when
// valid data comes back for that entry. The bottom bits of the sync
// data come from the port entry number and the top bits come from this count.
logic[`CL_DUT_NUM_RD_PORT-1:0][`CL_PCIR_MAX_Q_DEPTH-1:0][`CL_INST_CNT_WIDTH-1:0] read_inst_cnt;

// Sync mask and data based on cfg_sync_size and instruction count.
logic [`CL_INST_CNT_WIDTH-2:0]         sync_byte;
logic [`CL_PCIR_AXI_WIDTH-1:0]         sync_data_mask;
logic [`CL_PCIR_AXI_WIDTH-1:0]         sync_count_data;

// Instruction sync requirements for each read.  Saved for when data 
// is returned.
logic[`CL_PCIR_MAX_READ_REQUESTS-1:0]  inst_sync;

// Delay some bus signals for valid data check for read_inst_cnt update.
logic         sh_cl_pcim_rvalid_q;   
logic         cl_sh_pcim_rready_q;
logic         sh_cl_pcim_rlast_q;
logic [15:0]  sh_cl_pcim_rid_q;


// These are the read data queues.  The main read state machine will
// continually load these queues when data is not valid.
logic [`CL_DUT_NUM_RD_PORT-1:0][`CL_PCIR_MAX_Q_DEPTH-1:0][`CL_DUT_RPORT_WIDTH-1:0] read_q_data;
logic [`CL_DUT_NUM_RD_PORT-1:0][`CL_PCIR_MAX_Q_DEPTH-1:0]                          read_q_vld;
logic [`CL_DUT_NUM_RD_PORT-1:0][`CL_PCIR_MAX_Q_DEPTH-1:0]                          read_q_issued;
logic [`CL_DUT_NUM_RD_PORT-1:0][`CL_PCIR_MAX_Q_WIDTH-1:0] 			   read_q_top;
logic [`CL_DUT_NUM_RD_PORT_WIDTH-1:0] 						   load_q_port;  
logic [`CL_PCIR_MAX_Q_WIDTH-1:0]						   load_q_index;  

// The read port and read index for the specified AXI transaction ID.
logic [`CL_PCIR_MAX_READ_REQUESTS-1:0][`CL_DUT_NUM_RD_PORT-1:0]                    port_for_id;
logic [`CL_PCIR_MAX_READ_REQUESTS-1:0][`CL_PCIR_MAX_Q_DEPTH-1:0]                   index_for_id;

// The burst count for the current ID.
logic[`CL_PCIR_MAX_READ_REQUESTS-1:0][`CL_PCIR_BURST_BITS]   burst_count;

// Does the current read have valid data
logic [`CL_PCIR_MAX_READ_REQUESTS-1:0]      inst_has_vld_data;

// The AXI ID to use for the next read
logic [`CL_PCIR_READ_REQUEST_WIDTH-1:0]     next_id_num;

// Busy status of each ID (ID maps to read request)
logic [`CL_PCIR_MAX_READ_REQUESTS-1:0]      id_busy;

// Has the data neem sent to each read port?
logic[`CL_DUT_NUM_RD_PORT-1:0]              data_sent;
  
//--------------------------------
// Read state machine
//--------------------------------


//
//       The read state machine continually loops through all of the queue entries,
//   issuing reads for all entries that are not valid.  The AXI IDs are cycled through.
//   When a read is issued, a mapping is created from the AXI ID to the target queue
//   port number and index number.  Note that the port number also matched the
//   instruction data kept in the BRAMs.
//
//      When the data is returned on the AXI bus, the ID is used to identify which
//   queue entry is loaded.  The data from the read is returned independently of
//   the issuing of the read requests.
//

   
always_comb
begin
   rd_state_nxt = rd_state;
   case (rd_state)

      RD_IDLE:
      begin
         if (sm_go & dut_rst_n) begin
            rd_state_nxt = RD_START;
	 end
         else
            rd_state_nxt = RD_IDLE;
      end

      RD_START:
         //
         // If an AXI ID is available and the current queue entry pointed to does 
         // not have valid data and a read to the entry has not been issued, 
         // continue on with the read address phase.
	 //
      begin
         if (!id_busy[next_id_num] &&
             !read_q_vld[load_q_port][load_q_index] && !read_q_issued[load_q_port][load_q_index])
            rd_state_nxt = RD_READ_INST;
         else
            rd_state_nxt = RD_START;
      end // RD_START

      RD_READ_INST:
         //
         //     It takes a cycle to read the instruction from the RAM.
         //  Delay the state machine until the instruction is ready.
         // 
            rd_state_nxt = RD_ADDR;

      RD_ADDR:
         //
         // Issue the arvalid signal and wait for the 
	 // arready acknowledgment.  
      begin
         if (sh_cl_pcim_arready)
            rd_state_nxt = RD_START;
         else
            rd_state_nxt = RD_ADDR;
      end
   endcase
end


always @(posedge clk) begin
   if (!sm_go)
      rd_state <= RD_IDLE;
   else
      rd_state <= rd_state_nxt;
end


// Update the load queue pointers.  The pointers are stepped when
// the currently pointed to queue entry is valid or a read has been for
// that queue entry.
always @( posedge clk) begin
   if (!sm_go) begin
      load_q_port <= 0;
      load_q_index <= 0;
   end
   else if (((rd_state == RD_ADDR) && (rd_state_nxt != RD_ADDR)) ||
            ((rd_state == RD_START) &&
               (read_q_vld[load_q_port][load_q_index] || 
                read_q_issued[load_q_port][load_q_index])))  begin
        // A read has been issued for the current entry  or a read for the
        // current entry is not being issued because it is valid or issued.
        // Update points to point to the next queue entry.      
      if (load_q_index == (cfg_queue_size[load_q_port])) begin
         load_q_index <= 0;
         if (load_q_port == (cfg_rd_num_inst-1))
	    load_q_port <= 0;
         else
            load_q_port <= load_q_port + 1;
      end
      else
	 load_q_index <= load_q_index + 1;
   end
end

   // RAM instruction address.
assign rd_inst_addr = load_q_port;


  // Update the counters.
always @(posedge clk) begin
   if (!sync_rst_n) begin
      dut_cyc_count <= 64'h0;
      rd_busy_cyc_count <= 64'h0;
   end
   else begin
      if (clk_state == CLK_BUSY) 
         rd_busy_cyc_count <= rd_busy_cyc_count + 1;
      if ((clk_state == CLK_WAIT) && (clk_state_nxt != CLK_WAIT))
         dut_cyc_count <= dut_cyc_count + 1;
   end	  
end

//  Is the write state machine active?
assign sm_go = (dut_cyc_count == cfg_run_dut_cycle_cnt) ? 1'b0 : cfg_sm_go;

//
//  Manage the address read channel signals.
//
always @( posedge clk) begin
   if (!sm_go)
   begin
      cl_sh_pcim_arid <= 0;
      cl_sh_pcim_araddr <= 0;
      cl_sh_pcim_arlen <= 0;
      cl_sh_pcim_arsize <= 0;
      inst_sync <= 0;
   end
   else if (rd_state==RD_READ_INST)
   begin
      cl_sh_pcim_arid <= {{(`AXIS_ID_BITS -`CL_PCIR_READ_REQUEST_WIDTH){1'b0}}, next_id_num};
      cl_sh_pcim_araddr <= (inst_rd_rdata[`CL_INSTR_ADDR_BITS] + 
                                 (((inst_rd_rdata[`CL_INSTR_LENGTH_BITS] + 1) * load_q_index) << 6));
      cl_sh_pcim_arlen <= inst_rd_rdata[`CL_INSTR_LENGTH_BITS];
      cl_sh_pcim_arsize <= 6;  // 64 byte transfer.
      inst_sync[next_id_num] <= inst_rd_rdata[`CL_INSTR_PCIR_SYNC_BIT];
      port_for_id[next_id_num] <= load_q_port;
      index_for_id[next_id_num] <= load_q_index;
   end
end

assign cl_sh_pcim_arvalid = (rd_state==RD_ADDR);



// Create masks to be used for the SYNC check.
// The read_inst_cnt is based on the port number.
// Need to translate the rid to a port. 
assign sync_data_mask = (cfg_sync_size == `CL_SYNC_SIZE_4_BYTES)  ? {(16){8'b0, { (16){1'b1}}, 8'b0}}:
                        (cfg_sync_size == `CL_SYNC_SIZE_8_BYTES)  ? { (8){8'b0, { (48){1'b1}}, 8'b0}}:
                        (cfg_sync_size == `CL_SYNC_SIZE_16_BYTES) ? { (4){8'b0, {(112){1'b1}}, 8'b0}}:
                        (cfg_sync_size == `CL_SYNC_SIZE_32_BYTES) ? { (2){8'b0, {(240){1'b1}}, 8'b0}}:
                                                                    { (1){8'b0, {(496){1'b1}}, 8'b0}};

assign sync_byte = (read_inst_cnt[port_for_id[sh_cl_pcim_rid]][index_for_id[sh_cl_pcim_rid]] &
                                                     ~cfg_queue_size[port_for_id[sh_cl_pcim_rid]]) |
		   (index_for_id[sh_cl_pcim_rid] & cfg_queue_size[port_for_id[sh_cl_pcim_rid]]);
assign sync_count_data = {(16){1'b1, sync_byte, 16'b0, 1'b1, sync_byte}};

  // Delay various bus signals for valid data check used to
  // increment the read_inst_cnt.
always @( posedge clk) begin
   sh_cl_pcim_rvalid_q <= sh_cl_pcim_rvalid;
   cl_sh_pcim_rready_q <= cl_sh_pcim_rready;
   sh_cl_pcim_rlast_q <= sh_cl_pcim_rlast;
   sh_cl_pcim_rid_q <= sh_cl_pcim_rid;
end 



// Manage the instruction read counts.
always @( posedge clk) begin
   if (rd_state == RD_IDLE) begin
      for (int ind1 = 0; ind1 < `CL_DUT_NUM_RD_PORT; ind1++) begin
	 for (int ind2 = 0; ind2 < `CL_PCIR_MAX_Q_DEPTH; ind2++) begin
            read_inst_cnt[ind1][ind2] <= 0;
	 end
      end
   end

      // If we got the last beat of data on the last cycle, 
      // update the instruction count if the data is valid.  
      // The inst_has_vld_data is one cycle delayed.
   if (sh_cl_pcim_rvalid_q && cl_sh_pcim_rready_q && sh_cl_pcim_rlast_q &&
           inst_has_vld_data[sh_cl_pcim_rid_q])
      read_inst_cnt[port_for_id[sh_cl_pcim_rid_q]][index_for_id[sh_cl_pcim_rid_q]] 
                       <= read_inst_cnt[port_for_id[sh_cl_pcim_rid_q]][index_for_id[sh_cl_pcim_rid_q]] + 
                          cfg_queue_size[port_for_id[sh_cl_pcim_rid_q]] + 1;
end


//
// Manage signals when data comes back
//
always @( posedge clk) begin
   if (!sm_go) begin
      for (int ind = 0; ind < `CL_PCIR_MAX_READ_REQUESTS; ind++) begin
         id_busy[ind] <= 0;
         inst_has_vld_data[ind] <= 0;
      end
      next_id_num <= 0;
   end
   else begin
      if (sh_cl_pcim_rvalid & cl_sh_pcim_rready) begin
           // We have a valid beat of data. 
        
   	   // See if the data is valid.  If not, turn off the valid data flag.
         if (inst_sync[sh_cl_pcim_rid] &&
                 ((sh_cl_pcim_rdata & ~sync_data_mask) != (sync_count_data & ~sync_data_mask)))
	       // The data is not valid.
            inst_has_vld_data[sh_cl_pcim_rid] <= 0;

           // If it's the last beat of data, free up the ID.
         if (sh_cl_pcim_rlast)
            id_busy[sh_cl_pcim_rid] <= 0;

            // Transfer data to the read port queues.
            // Only transferring two beat of data for now.
            // Larger port sizes will use more beats.
         if (burst_count[sh_cl_pcim_rid] == 0) begin
            read_q_data[port_for_id[sh_cl_pcim_rid]][index_for_id[sh_cl_pcim_rid]][`CL_DUT_RPORT_WIDTH-1:0]
                                            <= sh_cl_pcim_rdata[`CL_DUT_RPORT_WIDTH-1:0];
         end
      `ifdef CL_RPORT_1024_BITS
         else if (burst_count[sh_cl_pcim_rid] == 1) begin
            read_q_data[port_for_id[sh_cl_pcim_rid]][index_for_id[sh_cl_pcim_rid]][`CL_PCIR_AXI_WIDTH*2-1:`CL_PCIR_AXI_WIDTH] 
                                            <= sh_cl_pcim_rdata[`CL_PCIR_AXI_WIDTH-1:0];
         end
      `endif
      
         burst_count[sh_cl_pcim_rid] <= burst_count[sh_cl_pcim_rid] + 1;
      end  // END we have valid data.
      
      if ((rd_state == RD_ADDR) && (rd_state_nxt != RD_ADDR)) begin
           // The next_id_num is mutually exclusive from the
           // AXI ID of data being returned.  These assignments
           // will never conflict with the ones above that are
           // active when data is returned.
         inst_has_vld_data[next_id_num] <= 1;
         id_busy[next_id_num] <= 1;
         burst_count[next_id_num] <= 0;
         inst_has_vld_data[next_id_num] <= 1;
         if (next_id_num == (cfg_max_read_requests-1)) begin
            next_id_num <= 0;
         end
         else begin
            next_id_num <= next_id_num + 1;
         end
      end
   end
end


//--------------------------------
// Clock state machine
//--------------------------------

   
always_comb
begin
   clk_state_nxt = clk_state;
   case (clk_state)

      CLK_IDLE:
      begin
         if (sm_go & dut_rst_n) begin
            clk_state_nxt = CLK_BUSY;
	 end
         else
            clk_state_nxt = CLK_IDLE;
      end

      CLK_BUSY:
      begin
         if ((read_inst_active ^ data_sent) == 0)
            clk_state_nxt = CLK_WAIT;
         else
            clk_state_nxt = CLK_BUSY;
      end

      CLK_WAIT:
         // All of the data is ready on the read ports.
         // Wait until we get a DUT clock.
      begin
	 if (dut_clocked)
	    clk_state_nxt = CLK_IDLE;
         else
            clk_state_nxt = CLK_WAIT;
      end

   endcase
end  // END clock state machine


always @(posedge clk) begin
   if (!sm_go)
      clk_state <= CLK_IDLE;
   else
      clk_state <= clk_state_nxt;
end


// Manage the data queues and passing data to the DUT.
always @( posedge clk) begin
   if (!sm_go) begin
      for (int ind1 = 0; ind1 < `CL_DUT_NUM_RD_PORT; ind1++) begin
         read_port_data[ind1] <= 0;
         read_q_top[ind1] <= 0;
         data_sent[ind1] <= 0;
         for (int ind2 = 0; ind2 < `CL_PCIR_MAX_Q_DEPTH; ind2++) begin
            read_q_vld[ind1][ind2] = 0;
            read_q_issued[ind1][ind2] = 0;
         end
      end
   end
   else begin
         // See if we have data to mark valid in the queues.
         // Note that the inst_has_vld_data is one cycle delayed.
      if (sh_cl_pcim_rvalid_q && cl_sh_pcim_rready_q && sh_cl_pcim_rlast_q) begin
           // The last beat of data of a transfer was written last cycle.
         read_q_issued[port_for_id[sh_cl_pcim_rid_q]][index_for_id[sh_cl_pcim_rid_q]] <= 0;
         if (inst_has_vld_data[sh_cl_pcim_rid_q])
            read_q_vld[port_for_id[sh_cl_pcim_rid_q]][index_for_id[sh_cl_pcim_rid_q]] <= 1;
      end

      if ((rd_state == RD_ADDR) && (rd_state_nxt != RD_ADDR))
            // We issued a read.  Mark that in the read_q_issued structure.
            // Note that this is mutually excusive from the clearing caused
            // by data being returned.
         read_q_issued[load_q_port][load_q_index] <= 1;

        // Now transmit the data to the DUT if needed.
      if (clk_state == CLK_IDLE) begin
         for (int ind = 0; ind < `CL_DUT_NUM_RD_PORT; ind++) begin
            data_sent[ind] <= 0;
         end
      end
      else if (clk_state == CLK_BUSY) begin
         for (int ind = 0; ind < `CL_DUT_NUM_RD_PORT; ind++) begin
            if ((read_inst_active[ind]) && read_q_vld[ind][read_q_top]) begin
               read_port_data[ind] <= read_q_data[ind][read_q_top];
               data_sent[ind] <= 1;
            end
         end
      end
      else if ((clk_state == CLK_WAIT) && (clk_state_nxt != CLK_WAIT)) begin
           // Data has been sent.  Update the queue status.
         for (int ind = 0; ind < `CL_DUT_NUM_RD_PORT; ind++) begin
            if (read_inst_active[ind]) begin
               read_q_vld[ind][read_q_top[ind]] <= 0;
               if (read_q_top[ind] == (cfg_queue_size[load_q_port]))
                  read_q_top[ind] = 0;
               else
                  read_q_top[ind] = read_q_top[ind] + 1;
            end
         end
      end
   end  // SM is running.
end



  // Need to keep this signal high when the state machine is not
  // active to pull all existing read data responses from the bus.
  // This will clear that channel out during test case reset.
assign cl_sh_pcim_rready = 1;    // !sm_go || (clk_state==CLK_BUSY);

assign read_sm_active = (clk_state==CLK_BUSY);

//--------------------------
// End Read state machine
//--------------------------



endmodule
