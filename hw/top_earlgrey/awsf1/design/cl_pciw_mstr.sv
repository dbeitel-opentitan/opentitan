// SPDX-FileCopyrightText: Copyright © 2022 by Rivos Inc.
// Confidential and proprietary, see LICENSE for details.
// SPDX-License-Identifier: LicenseRef-Rivos-Internal-Only


/*****************************************************************
 *         cl_pciw_mstr                                          *
 *****************************************************************/

// Include all of the state machine configuration registers.
`include "cl_pciw_mstr_defines.vh"
`include "cl_pci_common_defines.vh"
`include "cl_dut_defines.vh"

module  cl_pciw_mstr (
   input 	       clk,
   input 	       rst_n,
   output              dut_rst_n,
   output              clk_en,
   output              dut_clocked,
   input               dut_error,
   input               read_sm_active,
   input               slave_sm_active,

		       
   cfg_bus_t.master pciw_cfg_bus,
		      
     // This is the PCIW AXI bus.
     // Write address channel
   output logic [15:0]  cl_sh_pcim_awid,
   output logic [63:0]  cl_sh_pcim_awaddr,
   output logic [7:0]   cl_sh_pcim_awlen,
   output logic [2:0]   cl_sh_pcim_awsize, 
   output logic         cl_sh_pcim_awvalid,
   input 	        sh_cl_pcim_awready,
   
     // Write data channel
   output logic [511:0] cl_sh_pcim_wdata,
   output logic [63:0]  cl_sh_pcim_wstrb,
   output logic         cl_sh_pcim_wlast,
   output logic         cl_sh_pcim_wvalid,
   input 	        sh_cl_pcim_wready,

     // Bus response channel
   input logic [15:0]   sh_cl_pcim_bid,
   input logic [1:0]    sh_cl_pcim_bresp,
   input logic 	        sh_cl_pcim_bvalid,
   output logic         cl_sh_pcim_bready,


      // Are the read and write ports (instructions) active?
   input[`CL_DUT_NUM_WR_PORT-1:0]  write_inst_active,
   input[`CL_DUT_NUM_WR_PORT-1:0][`CL_DUT_WPORT_WIDTH-1:0]  write_port_data
);
   parameter DATA_WIDTH = `CL_PCIW_AXI_WIDTH;
   parameter DATA_DWORDS = DATA_WIDTH / 64;
   parameter DATA_BYTES = DATA_WIDTH / 8;

   
    // Unpack the config bus signals.
   logic[31:0] cfg_addr;
   logic[31:0] cfg_wdata;
   logic cfg_wr;
   logic cfg_rd;
   logic cfg_ack;
   logic[31:0] cfg_rdata;

   assign cfg_addr = pciw_cfg_bus.addr;
   assign cfg_wdata = pciw_cfg_bus.wdata;
   assign cfg_wr = pciw_cfg_bus.wr;
   assign cfg_rd = pciw_cfg_bus.rd;
   assign pciw_cfg_bus.ack = cfg_ack;
   assign pciw_cfg_bus.rdata = cfg_rdata;


//--------------------------
// Internal signals
//--------------------------

//
//  These are signals that can be programmed by the OCL.
//
logic                                       cfg_sm_go;
logic[`CL_PCIW_CLK_DELAY_WIDTH-1:0]         cfg_before_clk_delay;
logic[`CL_PCIW_CLK_DELAY_WIDTH-1:0]         cfg_after_clk_delay;
logic[`CL_COUNT_WIDTH-1:0]                  cfg_run_dut_cycle_cnt;
logic[`CL_DUT_NUM_WR_PORT_WIDTH-1:0]        cfg_wr_num_inst;
logic[`CL_DUT_NUM_WR_PORT_WIDTH-1:0]        cfg_wr_inst_index;
logic[`CL_INSTR_ADDR_WIDTH-1:0]             cfg_write_address;
logic[`CL_INSTR_IDENT_WIDTH-1:0]            cfg_write_identifier;
logic[`CL_INSTR_LENGTH_WIDTH-1:0]           cfg_write_length;
logic[`CL_DUT_NUM_WR_PORT-1:0]              cfg_queue_enables;
// These are the queue bottom pointers.  They are programmed by the OCL.
logic[`CL_DUT_NUM_WR_PORT+3:0][`CL_MAX_Q_SIZE_WIDTH-1:0]   cfg_queue_bottom;
// These are the queue sizes.  They are programmed by the OCL.
logic[`CL_DUT_NUM_WR_PORT+3:0][`CL_MAX_Q_SIZE_WIDTH-1:0]   cfg_queue_size;
  // Stop the clock on an error?
logic  cfg_stop_clk_err_en;
  // The configuration sync size.
  // Valid values are (4 = 4 bytes)
  //    4, 8, 16, 32, 64
logic [`CL_SYNC_SIZE_WIDTH-1:0]    cfg_sync_size;


//
//   These are signals that count events in the CL.
//   They can be read by the OCL.
//
logic[`CL_COUNT_WIDTH-1:0] total_cyc_count;     //  Total number of cycles
logic[`CL_COUNT_WIDTH-1:0] dut_cyc_count;       //  Total number of DUT cycles.
   //  Total number of cycles the write state machine is busy.
logic[`CL_COUNT_WIDTH-1:0] wr_busy_cyc_count;
   
  // The status of the write queues.
logic[`CL_DUT_NUM_WR_PORT-1:0]  queue_status;
   
logic[`CL_COUNT_SM_WIDTH-1:0]  bresp_error_count;      //  Bresp error count
logic[31:0] bresp_error_first;      //  First errored BRESP user[27:0], 2'b00, bresp[1:0]



  // Not sure if needed. This is the RAM data out on part A, which is
  // not used (Port A is used for write only).
logic[`CL_INSTR_WRITE_WIDTH-1:0] wr_cfg_inst_rdata;

// Address used to read the write instruction RAM.
logic[`CL_DUT_NUM_WR_PORT_WIDTH-1:0] wr_inst_addr;
// Data read from the write instruction RAM.
logic[`CL_INSTR_WRITE_WIDTH-1:0] inst_wr_rdata;

// Write instruction counts for memory sync.
logic [`CL_DUT_NUM_WR_PORT-1:0][`CL_INST_CNT_WIDTH-1:0] write_inst_cnt;

// Sync mask and data based on cfg_sync_size and instruction count.
logic [`CL_PCIW_AXI_WIDTH-1:0]        sync_data_mask;
logic [`CL_PCIW_AXI_WIDTH-1:0]        sync_count_data;
   

 //  Save address and length from the current instruction
logic [`CL_INSTR_ADDR_WIDTH-1:0]        cur_awaddr;
logic [7:0]                             cur_awlen;

// Save the current instruction address for data generation.
logic [`CL_DUT_NUM_WR_PORT_WIDTH-1:0]         cur_inst_addr;

// Save the instruction sync mode.
logic [`CL_INSTR_PCIW_SYNC_WIDTH-1:0]         cur_inst_sync_mode;

//  Logic used to control sync splitting.
logic 				        in_sync_split;
logic 				        has_sync_split;
  
   
   

//--------------------------------
// Write state machine
//--------------------------------
  
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


// End internal signals
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
logic cfg_write_inst_ram_wr;


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
      cfg_run_dut_cycle_cnt <= {(`CL_COUNT_WIDTH){1'b0}};
      cfg_before_clk_delay <= {(`CL_PCIW_CLK_DELAY_WIDTH){1'b0}};
      cfg_after_clk_delay <= {(`CL_PCIW_CLK_DELAY_WIDTH){1'b0}};
      cfg_wr_num_inst <= {(`CL_DUT_NUM_WR_PORT_WIDTH){1'b0}};
      cfg_wr_inst_index <= {(`CL_DUT_NUM_WR_PORT_WIDTH){1'b0}};
      cfg_write_address <= {(`CL_INSTR_ADDR_WIDTH){1'b0}};
      cfg_write_identifier <= {(`CL_INSTR_IDENT_WIDTH){1'b0}};
      cfg_write_length <= {(`CL_INSTR_LENGTH_WIDTH){1'b0}};
      for (int ind = 0; ind < `CL_DUT_NUM_WR_PORT; ind++)
         cfg_queue_bottom[ind] <= {(`CL_MAX_Q_SIZE_WIDTH){1'b0}};
      for (int ind = 0; ind < `CL_DUT_NUM_WR_PORT; ind++)
         cfg_queue_size[ind] <= {(`CL_MAX_Q_SIZE_WIDTH){1'b0}};
      cfg_stop_clk_err_en <= 1'b0;
      cfg_sync_size <= {(`CL_SYNC_SIZE_WIDTH){1'b0}};
   end
   else if (cfg_wr_q) begin
      case (cfg_addr_q)
         `CL_PCIW_RUN:                cfg_sm_go <= cfg_wdata_q[0];
         `CL_PCIW_RUN_DUT_CYCLES_LO:  cfg_run_dut_cycle_cnt[31:0] <= cfg_wdata_q;
         `CL_PCIW_RUN_DUT_CYCLES_HI:  cfg_run_dut_cycle_cnt[63:32] <= cfg_wdata_q;
         `CL_PCIW_BEFORE_CLK_DLY:     cfg_before_clk_delay <= cfg_wdata[`CL_PCIW_CLK_DELAY_WIDTH-1:0];
         `CL_PCIW_AFTER_CLK_DLY:      cfg_after_clk_delay <= cfg_wdata[`CL_PCIW_CLK_DELAY_WIDTH-1:0];
         `CL_PCIW_INSTR_COUNT:        cfg_wr_num_inst <= cfg_wdata_q[`CL_DUT_NUM_WR_PORT_WIDTH-1:0];
         `CL_PCIW_INDEX:              cfg_wr_inst_index <= cfg_wdata_q[`CL_DUT_NUM_WR_PORT_WIDTH-1:0];
         `CL_PCIW_ADDR_LO:            cfg_write_address[31:0] <= cfg_wdata_q;
         `CL_PCIW_ADDR_HI:            cfg_write_address[63:32] <= cfg_wdata_q;
         `CL_PCIW_IDENT:              cfg_write_identifier <= cfg_wdata_q[`CL_INSTR_IDENT_WIDTH-1:0];
         `CL_PCIW_LEN:                cfg_write_length <= cfg_wdata_q[`CL_INSTR_LENGTH_WIDTH-1:0];
         `CL_PCIW_Q_ENABLES:          cfg_queue_enables <= cfg_wdata_q;
	
         `CL_PCIW_Q_SIZE_7_0:      
            {cfg_queue_size[4], cfg_queue_size[3], 
             cfg_queue_size[2],  cfg_queue_size[1],  cfg_queue_size[0]} <= cfg_wdata_q[19:0];
         `CL_PCIW_Q_BOT_7_0:      
            {cfg_queue_bottom[4], cfg_queue_bottom[3], 
             cfg_queue_bottom[2],  cfg_queue_bottom[1],  cfg_queue_bottom[0]} <= cfg_wdata_q[19:0];
 
	
   // Only five queues for this model.
   //      `CL_PCIW_Q_SIZE_7_0:      
   //         {cfg_queue_size[7], cfg_queue_size[6],  cfg_queue_size[5],  cfg_queue_size[4],
   //          cfg_queue_size[3], cfg_queue_size[2],  cfg_queue_size[1],  cfg_queue_size[0]} <= cfg_wdata_q;
   //      `CL_PCIW_Q_SIZE_15_8:      
   //         {cfg_queue_size[15], cfg_queue_size[14], cfg_queue_size[13], cfg_queue_size[12],
   //          cfg_queue_size[11], cfg_queue_size[10], cfg_queue_size[9],  cfg_queue_size[8]} <= cfg_wdata_q;
   //      `CL_PCIW_Q_SIZE_23_16:      
   //         {cfg_queue_size[23], cfg_queue_size[22], cfg_queue_size[21], cfg_queue_size[20],
   //          cfg_queue_size[19], cfg_queue_size[18], cfg_queue_size[17], cfg_queue_size[16]} <= cfg_wdata_q;
   //      `CL_PCIW_Q_SIZE_31_24:      
   //         {cfg_queue_size[31], cfg_queue_size[30], cfg_queue_size[29], cfg_queue_size[28],
   //          cfg_queue_size[27], cfg_queue_size[26], cfg_queue_size[25], cfg_queue_size[24]} <= cfg_wdata_q;
   //      `CL_PCIW_Q_BOT_7_0:      
   //         {cfg_queue_bottom[7], cfg_queue_bottom[6],  cfg_queue_bottom[5],  cfg_queue_bottom[4],
   //          cfg_queue_bottom[3], cfg_queue_bottom[2],  cfg_queue_bottom[1],  cfg_queue_bottom[0]} <= cfg_wdata_q;
   //      `CL_PCIW_Q_BOT_15_8:      
   //         {cfg_queue_bottom[15], cfg_queue_bottom[14], cfg_queue_bottom[13], cfg_queue_bottom[12],
   //          cfg_queue_bottom[11], cfg_queue_bottom[10], cfg_queue_bottom[9],  cfg_queue_bottom[8]} <= cfg_wdata_q;
   //      `CL_PCIW_Q_BOT_23_16:      
   //         {cfg_queue_bottom[23], cfg_queue_bottom[22], cfg_queue_bottom[21], cfg_queue_bottom[20],
   //          cfg_queue_bottom[19], cfg_queue_bottom[18], cfg_queue_bottom[17], cfg_queue_bottom[16]} <= cfg_wdata_q;
   //      `CL_PCIW_Q_BOT_31_24:      
   //         {cfg_queue_bottom[31], cfg_queue_bottom[30], cfg_queue_bottom[29], cfg_queue_bottom[28],
   //          cfg_queue_bottom[27], cfg_queue_bottom[26], cfg_queue_bottom[25], cfg_queue_bottom[24]} <= cfg_wdata_q;
         `CL_PCIW_STOP_CLK_ERR:      cfg_stop_clk_err_en <= cfg_wdata_q[0];
         `CL_PCIW_SYNC_BYTES:        cfg_sync_size  <= cfg_wdata_q[`CL_SYNC_SIZE_WIDTH-1:0];
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
         `CL_PCIW_RUN:                cfg_rdata <= {31'b0, cfg_sm_go};
         `CL_PCIW_RUN_DUT_CYCLES_LO:  cfg_rdata <= cfg_run_dut_cycle_cnt[31:0];
         `CL_PCIW_RUN_DUT_CYCLES_HI:  cfg_rdata <= cfg_run_dut_cycle_cnt[63:32];
         `CL_PCIW_BEFORE_CLK_DLY:     cfg_rdata <= {{(32-`CL_PCIW_CLK_DELAY_WIDTH){1'b0}}, cfg_before_clk_delay};
         `CL_PCIW_AFTER_CLK_DLY:      cfg_rdata <= {{(32-`CL_PCIW_CLK_DELAY_WIDTH){1'b0}}, cfg_after_clk_delay};
         `CL_PCIW_INSTR_COUNT:        cfg_rdata <= {{(32-`CL_DUT_NUM_WR_PORT_WIDTH){1'b0}}, cfg_wr_num_inst};
         `CL_PCIW_INDEX:              cfg_rdata <= {{(32-`CL_DUT_NUM_WR_PORT_WIDTH){1'b0}}, cfg_wr_inst_index};
         `CL_PCIW_ADDR_LO:            cfg_rdata <= cfg_write_address[31:0];
         `CL_PCIW_ADDR_HI:            cfg_rdata <= cfg_write_address[63:32];
         `CL_PCIW_IDENT:              cfg_rdata <= {{(32-`CL_INSTR_IDENT_WIDTH){1'b0}}, cfg_write_identifier};
         `CL_PCIW_LEN:                cfg_rdata <= {{(32-`CL_INSTR_LENGTH_WIDTH){1'b0}}, cfg_write_length};
         `CL_PCIW_BRESP_ERR_COUNT:    cfg_rdata <= bresp_error_count;
         `CL_PCIW_BRESP_ERR_VALUE:    cfg_rdata <= bresp_error_first;
         `CL_PCIW_TOTAL_CYCLES_LO:    cfg_rdata <= total_cyc_count[31:0];
         `CL_PCIW_TOTAL_CYCLES_HI:    cfg_rdata <= total_cyc_count[63:32];
         `CL_PCIW_DUT_CYCLES_LO:      cfg_rdata <= dut_cyc_count[31:0];
         `CL_PCIW_DUT_CYCLES_HI:      cfg_rdata <= dut_cyc_count[63:32];
         `CL_PCIW_SM_CYCLES_LO:       cfg_rdata <= wr_busy_cyc_count[31:0];
         `CL_PCIW_SM_CYCLES_HI:       cfg_rdata <= wr_busy_cyc_count[63:32];
         `CL_PCIW_Q_STATUS:           cfg_rdata <= queue_status;
         `CL_PCIW_Q_ENABLES:          cfg_rdata <= cfg_queue_enables;

         `CL_PCIW_Q_SIZE_7_0:      
            cfg_rdata <= {12'h0, cfg_queue_size[4], cfg_queue_size[3], 
                          cfg_queue_size[2], cfg_queue_size[1], cfg_queue_size[0]};    
         `CL_PCIW_Q_BOT_7_0:      
            cfg_rdata <= {12'h0, cfg_queue_bottom[4], cfg_queue_bottom[3], 
                          cfg_queue_bottom[2], cfg_queue_bottom[1], cfg_queue_bottom[0]};
	
    //     `CL_PCIW_Q_SIZE_7_0:      
    //        cfg_rdata <= {cfg_queue_size[7], cfg_queue_size[6], cfg_queue_size[5], cfg_queue_size[4],
    //                      cfg_queue_size[3], cfg_queue_size[2], cfg_queue_size[1], cfg_queue_size[0]};
    //     `CL_PCIW_Q_SIZE_15_8:      
    //        cfg_rdata <=  {cfg_queue_size[15], cfg_queue_size[14], cfg_queue_size[13], cfg_queue_size[12],
    //                       cfg_queue_size[11], cfg_queue_size[10], cfg_queue_size[9],  cfg_queue_size[8]};
    //     `CL_PCIW_Q_SIZE_23_16:      
    //        cfg_rdata <= {cfg_queue_size[23], cfg_queue_size[22], cfg_queue_size[21], cfg_queue_size[20],
    //                      cfg_queue_size[19], cfg_queue_size[18], cfg_queue_size[17], cfg_queue_size[16]};
    //     `CL_PCIW_Q_SIZE_31_24:      
    //        cfg_rdata <= {cfg_queue_size[31], cfg_queue_size[30], cfg_queue_size[29], cfg_queue_size[28],
    //                      cfg_queue_size[27], cfg_queue_size[26], cfg_queue_size[25], cfg_queue_size[24]};
    //     `CL_PCIW_Q_BOT_7_0:      
    //        cfg_rdata <= {cfg_queue_bottom[7], cfg_queue_bottom[6], cfg_queue_bottom[5], cfg_queue_bottom[4],
    //                      cfg_queue_bottom[3], cfg_queue_bottom[2], cfg_queue_bottom[1], cfg_queue_bottom[0]};
    //     `CL_PCIW_Q_BOT_15_8:      
    //        cfg_rdata <= {cfg_queue_bottom[15], cfg_queue_bottom[14], cfg_queue_bottom[13], cfg_queue_bottom[12],
    //                      cfg_queue_bottom[11], cfg_queue_bottom[10], cfg_queue_bottom[9],  cfg_queue_bottom[8]};
    //     `CL_PCIW_Q_BOT_23_16:      
    //        cfg_rdata <= {cfg_queue_bottom[23], cfg_queue_bottom[22], cfg_queue_bottom[21], cfg_queue_bottom[20],
    //                      cfg_queue_bottom[19], cfg_queue_bottom[18], cfg_queue_bottom[17], cfg_queue_bottom[16]};
    //     `CL_PCIW_Q_BOT_31_24:      
    //        cfg_rdata <= {cfg_queue_bottom[31], cfg_queue_bottom[30], cfg_queue_bottom[29], cfg_queue_bottom[28],
    //                      cfg_queue_bottom[27], cfg_queue_bottom[26], cfg_queue_bottom[25], cfg_queue_bottom[24]};

         `CL_PCIW_STOP_CLK_ERR:      cfg_rdata <= {31'b0, cfg_stop_clk_err_en};
         `CL_PCIW_SYNC_BYTES:        cfg_rdata <= {{(32-`CL_SYNC_SIZE_WIDTH){1'b0}}, cfg_sync_size};
         default:                    cfg_rdata <= 32'hdeadbeef;
      endcase
   end
   else begin
      cfg_rdata <= cfg_rdata;
   end
end  // End read configuration data.


// Trigger the instruction RAM writes when the length is written by the OCL.
always @(posedge clk) begin
   if (!sync_rst_n) begin
      cfg_write_inst_ram_wr <= 1'b0;
   end
   else begin
      cfg_write_inst_ram_wr <= (cfg_wr_q && (cfg_addr_q == `CL_PCIW_LEN));
   end
end



//---------------------------------------
//    Instruction RAMs
//---------------------------------------

//
//   The instruction format is:
//
//      63:0     Write address
//      71:64    Write length
//      79:72    Write target identifier.
//                 Bit 79 = instruction uses sync mode.
//
bram_2rw #(.WIDTH(`CL_INSTR_WRITE_WIDTH), .ADDR_WIDTH(`CL_DUT_NUM_WR_PORT_WIDTH), .DEPTH(`CL_DUT_WR_BRAM_DEPTH)) WRITE_INST_RAM (
   .clk(clk),
   .wea(cfg_write_inst_ram_wr),
   .ena(1'b1),
   .addra(cfg_wr_inst_index),
   .da({cfg_write_identifier, cfg_write_length, cfg_write_address}),
   .qa(wr_cfg_inst_rdata),

   .web(1'b0),
   .enb(1'b1),
   .addrb(wr_inst_addr),
   .db({(`CL_INSTR_WRITE_WIDTH){1'b0}}),
   .qb(inst_wr_rdata)
   );



//--------------------------------
// Write state machine
//--------------------------------

typedef enum logic[3:0] {
   WR_IDLE = 0,
   WR_START = 1,
   WR_READ_INST = 2,
   WR_ADDR = 3,
   WR_DAT = 4,
   WR_SYNC_ADDR = 5,
   WR_SYNC_DAT = 6,
   WR_SYNC_SPLIT = 7,
   WR_WAIT = 8,
   WR_BEFORE_CLK = 9,
   WR_CLOCK_DUT = 10,
   WR_AFTER_CLK = 11  
} wr_state_t;

wr_state_t wr_state, wr_state_nxt;

logic [`CL_PCIW_DUT_RESET_WIDTH-1:0]   dut_reset_cnt;
   
   
logic[7:0] wr_running_length;
logic wr_dat_end;                   // End of data for this instruction
logic wr_inst_done;                 // Are we done with the instructions?
                                    // This signal is ready after the WR_READ_INST state.
logic wr_last_inst;                 // Are we working on the last instruction?
                                    // This is used when wr_inst_done is not ready
                                    // e.g. before and during the WR_READ_INST state.
logic wr_first_data_beat;           // Is this the first beat of write data?

  // Countdown for clock delay cycles before and after
  // the DUT clock is issued.
logic[`CL_PCIW_CLK_DELAY_WIDTH-1:0]    before_clk_delay;
logic[`CL_PCIW_CLK_DELAY_WIDTH-1:0]    after_clk_delay;
   

logic[DATA_WIDTH-1:0] wdata_nxt;
logic[DATA_WIDTH-1:0] wdata_q = 0;

always_comb
begin
   wr_state_nxt = wr_state;
   case (wr_state)

      WR_IDLE:
      begin
         if (sm_go && (dut_reset_cnt == {(`CL_PCIW_DUT_RESET_WIDTH){1'b0}})) begin
            if ((cfg_wr_num_inst == {(`CL_DUT_NUM_WR_PORT_WIDTH){1'b0}}) ||
		(write_inst_active == {(`CL_DUT_NUM_WR_PORT){1'b0}}))
               wr_state_nxt = WR_WAIT;
            else
               wr_state_nxt = WR_START;
	 end
         else
            wr_state_nxt = WR_IDLE;
      end

      WR_START:
         //
         // If the current instruction is active (write_inst_active)
         // continue on with the write address phase.
         // If the current insruction is not active, skip the 
         // instruction.  If we get to the end of the instructions,
         // go to the wait state.
         //
      begin
         if (write_inst_active[wr_inst_addr]) begin
            wr_state_nxt = WR_READ_INST;
         end
         else begin
               // The current instruction is not active.
            if (wr_last_inst)
               wr_state_nxt = WR_SYNC_SPLIT;
            else
               wr_state_nxt = WR_START;
         end
      end

      WR_READ_INST:
         //
         //     It takes a cycle to read the instruction from the RAM.
         //  Delay the state machine until the instruction is ready.
         //  If we have a sync split instruction, jump to the send SYNC 
         //  sequence.
         //
      begin
            if (in_sync_split) begin
	       if (inst_wr_rdata[`CL_INSTR_PCIW_SYNC_BITS] == `CL_PCIW_SYNC_SPLIT)
	          wr_state_nxt = WR_SYNC_ADDR;
	       else begin
                     // This is a regular instruction that should do
                     // nothing while in the sync split mode.
                  if (wr_last_inst)
                     wr_state_nxt = WR_SYNC_SPLIT;
                  else
                     wr_state_nxt = WR_START;
               end
            end
            else
               wr_state_nxt = WR_ADDR;
      end

      WR_ADDR:
         //
         // Issue the awvalid signal and wait for the 
	 // awready acknowledgment.  This state is needed as
	 // the AXI signals are delayed one cycle from the
	 // WR_READ_INST state.   
         //
      begin
         if (sh_cl_pcim_awready)
            wr_state_nxt = WR_DAT;
         else
            wr_state_nxt = WR_ADDR;
      end

      WR_DAT:
      begin
         if (wr_dat_end && sh_cl_pcim_wready) begin
	      // We are done with the current instruction in the RAM.
              // If the instruction is using sync mode, go write the
              // sync data (WR_SYNC_ADDR), otherwise, check to
	      // see if we have a SYNC split case.
            if (cur_inst_sync_mode == `CL_PCIW_SYNC_AFTER_DATA)
               wr_state_nxt = WR_SYNC_ADDR;
            else if (wr_inst_done)
               wr_state_nxt = WR_SYNC_SPLIT;
            else
               wr_state_nxt = WR_START;
         end
         else
            wr_state_nxt = WR_DAT;
      end

      WR_SYNC_ADDR:
      begin
         if (sh_cl_pcim_awready)
            wr_state_nxt = WR_SYNC_DAT;
         else
            wr_state_nxt = WR_SYNC_ADDR;
      end
   
      WR_SYNC_DAT:
      begin
         if (wr_dat_end && sh_cl_pcim_wready) begin
	      // We are done writing the SYNC data.
	      // If there are no more instructions:
	      //    Run through the instructions again if there is a sync split
	      //        Otherise
	      //    Wait for the other state machines to finish.
	      //
            if (wr_inst_done)
	       wr_state_nxt = WR_SYNC_SPLIT;
            else
	       wr_state_nxt = WR_START;
         end
         else 
            wr_state_nxt = WR_SYNC_DAT;
      end // case: WR_SYNC_DAT

      WR_SYNC_SPLIT:
      begin
	 // Check for a sync split.  If we have one active, restart
	 // the instructions in sync split mode, otherwise, wait for
	 // the other state machines to finish.
         if (has_sync_split)
	    wr_state_nxt = WR_START;
	 else
	    wr_state_nxt = WR_WAIT;
      end

      WR_WAIT:
         //
         // We are done with all instructions in the RAM.
         // Wait until the write queues are empty
	 // and until we have the proper number of address
	 // matches on the PCIS interface, then continue
	 // the write loop or go to IDLE when the loop is done.
         //
      begin
	 if (read_sm_active || slave_sm_active || (queue_status != {(`CL_DUT_NUM_WR_PORT){1'b0}}))
	    wr_state_nxt = WR_WAIT;
         else if (cfg_before_clk_delay == {(`CL_PCIW_CLK_DELAY_WIDTH){1'b0}})
            wr_state_nxt = WR_CLOCK_DUT;
         else 
            wr_state_nxt = WR_BEFORE_CLK;
      end

      WR_BEFORE_CLK:
      begin
         if (before_clk_delay == {(`CL_PCIW_CLK_DELAY_WIDTH){1'b0}})
            wr_state_nxt = WR_CLOCK_DUT;
         else
            wr_state_nxt = WR_BEFORE_CLK;
      end

      WR_CLOCK_DUT:
      begin
            // Issue a one cycle clock to the DUT.
         if (cfg_after_clk_delay == {(`CL_PCIW_CLK_DELAY_WIDTH){1'b0}})
            wr_state_nxt = WR_IDLE;
         else 
            wr_state_nxt = WR_AFTER_CLK;
      end

      WR_AFTER_CLK:
      begin
            // Wait here until the clock delayzero.
         if (after_clk_delay == {(`CL_PCIW_CLK_DELAY_WIDTH){1'b0}})
            wr_state_nxt = WR_IDLE;
         else 
            wr_state_nxt = WR_AFTER_CLK;
      end
     
   endcase
end


always @(posedge clk) begin
   if (!sm_go)
      wr_state <= WR_IDLE;
   else
      wr_state <= wr_state_nxt;
end


// RAM instruction address.
// Update if the instruction is not active or if we have done
// the address write phase.
always @( posedge clk) begin
   if (wr_state==WR_IDLE) begin
      wr_inst_addr <= {(`CL_DUT_NUM_WR_PORT_WIDTH){1'b0}};
   end
   else if ((wr_state==WR_START) && !write_inst_active[wr_inst_addr]) begin
        // This is the skip instruction case where the
        // instruction is not active. Go to the next instruction.
      wr_inst_addr <= (wr_inst_addr==(cfg_wr_num_inst-1))? 0: wr_inst_addr + 1;
   end
   else if (wr_state==WR_READ_INST)
        // We are done using the instruction data.  Go to the next instruction.
      wr_inst_addr <= (wr_inst_addr==(cfg_wr_num_inst-1))? 0: wr_inst_addr + 1;
end


//
//  Do the write queue full check here. 
//
always @( posedge clk) begin
   if (!sm_go)
      queue_status <= {(`CL_DUT_NUM_WR_PORT){1'b0}};
   else
      for (int ind = 0; ind < `CL_DUT_NUM_WR_PORT; ind++)
         queue_status[ind] <= 
                cfg_queue_enables[ind] & 
                           (((write_inst_cnt[ind][` CL_MAX_Q_SIZE_WIDTH-1:0] + 1) & 
                                                 cfg_queue_size[ind]) == cfg_queue_bottom[ind]);
end

//
// Update the counters.
//
always @(posedge clk) begin
   if (!sync_rst_n) begin
      total_cyc_count <= 64'h0;
      dut_cyc_count <= 64'h0;
      wr_busy_cyc_count <= 64'h0;
   end
   else begin
      total_cyc_count <= total_cyc_count + 1;
      if ((wr_state == WR_IDLE) && (wr_state_nxt != WR_IDLE)) begin
         dut_cyc_count <= dut_cyc_count + 1;
      end
      if ((wr_state != WR_IDLE) && (wr_state != WR_WAIT)) begin
         wr_busy_cyc_count <= wr_busy_cyc_count + 1;
      end
   end
end

//
// Manage the write instruction port counters.
//
always @(posedge clk) begin
   if (!sm_go) begin
      for (int ind = 0; ind < `CL_DUT_NUM_WR_PORT; ind++)
         write_inst_cnt[ind] <= 0;
   end
   else begin
      if (((wr_state==WR_DAT) && (wr_state_nxt!=WR_DAT) && 
             ((cur_inst_sync_mode == `CL_PCIW_SYNC_NONE) || 
              (cur_inst_sync_mode == `CL_PCIW_SYNC_WITH_DATA))) ||
           ((wr_state==WR_SYNC_DAT) && (wr_state_nxt!=WR_SYNC_DAT)))
             // Instruction has completed.  Update the instruction count.
         write_inst_cnt[cur_inst_addr] <= write_inst_cnt[cur_inst_addr] + 1;
   end
end

// Manage the sync logic.
always @(posedge clk) begin
   if (!sm_go) begin
      in_sync_split <= 1'b0;
      has_sync_split <= 1'b0;
   end
   else begin
      if ((wr_state == WR_READ_INST) && 
          (inst_wr_rdata[`CL_INSTR_PCIW_SYNC_BITS] == `CL_PCIW_SYNC_SPLIT) && !in_sync_split)
         has_sync_split <= 1'b1;
      else if (wr_state == WR_IDLE) begin
         in_sync_split <= 1'b0;
         has_sync_split <= 1'b0;
      end
      else if ((wr_state == WR_SYNC_SPLIT) && has_sync_split) begin
          in_sync_split <= 1'b1;
          has_sync_split <= 1'b0;
      end
   end
end

//  Instructions done -- When wrap around to 0 is done
assign wr_inst_done = (wr_inst_addr == 0);
// Are we working on the last instruction?
assign wr_last_inst = (wr_inst_addr == (cfg_wr_num_inst-1));
   

//  Is the write state machine active?
assign sm_go = ((dut_cyc_count === cfg_run_dut_cycle_cnt) ||
                (cfg_stop_clk_err_en && dut_error)) ? 1'b0 : cfg_sm_go;

//
// Manage the DUT reset logic.
//
always @( posedge clk) begin
   if (!sm_go)
      dut_reset_cnt <= `CL_PCIW_DUT_RESET_CNT;
   else if (sm_go && (dut_reset_cnt != {(`CL_PCIW_DUT_RESET_WIDTH){1'b0}}))
      dut_reset_cnt <= dut_reset_cnt - 1;
end
assign dut_rst_n = sm_go && (dut_reset_cnt === {(`CL_PCIW_DUT_RESET_WIDTH){1'b0}});
	     
	     
//
// Manage the AXI interface signals.
//
always @( posedge clk) begin
   if (!sm_go) begin
      cl_sh_pcim_awid <= 0;
      cur_awaddr <= 0;
      cl_sh_pcim_awsize <= 0;
      cur_inst_addr <= 0;
      cur_inst_sync_mode <= 0;
   end
   else if (wr_state ==  WR_READ_INST) begin
        // Next cycle could send the regular o sync data address.
        // Prepare the signals.
      cl_sh_pcim_awid <= 0;
        // The size of a queue entry is:
        //    Instruction length bits + 1.
        // Multiply this by the queue number and add to the base address
        // to get a starting current address.
      cur_awaddr <= (inst_wr_rdata[`CL_INSTR_ADDR_BITS] + 
                        (((inst_wr_rdata[`CL_INSTR_LENGTH_BITS] + 1) * 
                           (write_inst_cnt[wr_inst_addr][`CL_MAX_Q_SIZE_WIDTH-1:0] & 
                                                    cfg_queue_size[wr_inst_addr])) << 6));
      cur_awlen <= inst_wr_rdata[`CL_INSTR_LENGTH_BITS];
      cl_sh_pcim_awsize <= 6;  // 64 byte transfer.
      cur_inst_addr <= wr_inst_addr;
      cur_inst_sync_mode <= inst_wr_rdata[`CL_INSTR_PCIW_SYNC_BITS];
   end 
end

assign cl_sh_pcim_awvalid = ((wr_state==WR_ADDR) || (wr_state==WR_SYNC_ADDR));

// Are we done with the last burst of data?
assign wr_dat_end = (wr_running_length==0);

//
// Manage the clock delay counters.
//
always @(posedge clk) begin
   if (!sm_go) begin
      before_clk_delay <= {(`CL_PCIW_CLK_DELAY_WIDTH){1'b0}};
      after_clk_delay <= {(`CL_PCIW_CLK_DELAY_WIDTH){1'b0}};
   end
   else if (wr_state == WR_WAIT) begin
      before_clk_delay <= cfg_before_clk_delay;
      after_clk_delay <= cfg_after_clk_delay;
   end
   else if ((wr_state == WR_BEFORE_CLK) && 
            (before_clk_delay != {(`CL_PCIW_CLK_DELAY_WIDTH){1'b0}}))
      before_clk_delay <= before_clk_delay -1;
   else if ((wr_state == WR_AFTER_CLK) && 
            (after_clk_delay != {(`CL_PCIW_CLK_DELAY_WIDTH){1'b0}}))
      after_clk_delay <= after_clk_delay -1;
end


//
//  Manage the AXI multiple data beat signals 
//
always @(posedge clk) begin
   if (!sm_go) begin
      wr_running_length <= 8'h0;
      wr_first_data_beat <= 1'b0;
   end
   else if (wr_state==WR_READ_INST) begin
      wr_running_length <= inst_wr_rdata[`CL_INSTR_LENGTH_BITS];
      wr_first_data_beat <= 1'b1;
   end
   else if (wr_state==WR_SYNC_ADDR) begin
      wr_running_length <= cur_awlen;
      wr_first_data_beat <= 1'b1;
   end
   else if (cl_sh_pcim_wvalid && sh_cl_pcim_wready) begin
      wr_running_length <= wr_running_length - 1;
      wr_first_data_beat <= 1'b0;
   end
end


//Write data
always_comb
begin
   wdata_nxt = wdata_q;
   if ((wr_state==WR_ADDR) || (wr_state==WR_SYNC_ADDR))
      wdata_nxt = write_port_data[cur_inst_addr][`CL_DUT_WPORT_WIDTH-1:0];
`ifdef CL_WPORT_1024_BITS
   else if (cl_sh_pcim_wvalid && sh_cl_pcim_wready) begin
        // Only go up to 1024 bits for now.  Increase if
        // we are using more data.
      wdata_nxt = 
         write_port_data[cur_inst_addr][`CL_PCIW_AXI_WIDTH*2-1:`CL_PCIW_AXI_WIDTH];
   end
`endif

end

// Manage the actual write data based on the sync and counts.
assign sync_data_mask = (cfg_sync_size == `CL_SYNC_SIZE_4_BYTES)  ? {(16){8'b0, { (16){1'b1}}, 8'b0}}:
                        (cfg_sync_size == `CL_SYNC_SIZE_8_BYTES)  ? { (8){8'b0, { (48){1'b1}}, 8'b0}}:
                        (cfg_sync_size == `CL_SYNC_SIZE_16_BYTES) ? { (4){8'b0, {(112){1'b1}}, 8'b0}}:
                        (cfg_sync_size == `CL_SYNC_SIZE_32_BYTES) ? { (2){8'b0, {(240){1'b1}}, 8'b0}}:
                                                                    { (1){8'b0, {(496){1'b1}}, 8'b0}};
assign sync_count_data = {(16){1'b1, write_inst_cnt[cur_inst_addr][6:0], 16'b0, 1'b1, write_inst_cnt[cur_inst_addr][6:0]}};

always @(posedge clk) begin
   if (!sm_go) begin
      wdata_q <= 0;
   end
   else begin
      if (wr_state_nxt == WR_DAT) begin
         if (cur_inst_sync_mode == `CL_PCIW_SYNC_NONE)
	       // Write the normal data line.
            wdata_q <= wdata_nxt;
         else if (cur_inst_sync_mode == `CL_PCIW_SYNC_WITH_DATA)
            wdata_q <= (wdata_nxt & sync_data_mask) | (sync_count_data & ~sync_data_mask);
         else 
            wdata_q <= (wdata_nxt & sync_data_mask);
      end
      else
	    // Write the sync data line.
         wdata_q <= (wdata_nxt & sync_data_mask) | (sync_count_data & ~sync_data_mask);;
   end
end

  // Send the data as follows:
  //    In normal write (not sync write) - Transmit data as usual.
  //    In sync mode, transmit the write instruction count with special
  //    characters in the high 16 bits of the bottom word.  Transmit
  //    0's for all aother words.
  //
assign cl_sh_pcim_wdata = wdata_q;
  
   //  Generate the proper signal based on a DATA or a SYNC address.
assign cl_sh_pcim_awaddr = cur_awaddr;
assign cl_sh_pcim_awlen = cur_awlen;   
assign cl_sh_pcim_wvalid = ((wr_state==WR_DAT) || (wr_state==WR_SYNC_DAT));
assign cl_sh_pcim_wlast = wr_dat_end;
assign cl_sh_pcim_wid = 0;
assign cl_sh_pcim_wstrb = {(DATA_WIDTH/8){1'b1}};
   

// Don't do anything with BRESP
assign cl_sh_pcim_bready = 1;

// Clock the DUT.
assign clk_en = (wr_state == WR_CLOCK_DUT) || 
                (sm_go && (dut_reset_cnt > `CL_PCIW_DUT_RESET_CLK));
   
// Tell the other state machines clock has been issued.
assign dut_clocked = ((wr_state == WR_CLOCK_DUT) && (wr_state_nxt == WR_IDLE)) ||
                     ((wr_state == WR_AFTER_CLK) && (wr_state_nxt == WR_IDLE));

//--------------------------
// End Write state machine
//--------------------------



endmodule
