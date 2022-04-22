// SPDX-FileCopyrightText: Copyright © 2022 by Rivos Inc.
// Confidential and proprietary, see LICENSE for details.
// SPDX-License-Identifier: LicenseRef-Rivos-Internal-Only


`include "cl_dut_defines.vh"
`include "cl_pci_common_defines.vh"
`include "cl_id_defines.vh"


// `define ENABLE_VJTAG_DEBUG 1
// `define DDR_A_ABSENT       1


// `define SYNTHESIS 1



module chip_earlgrey_awsf1

(
   `include "cl_ports.vh" // Fixed port definition

     // Used to reset AXI slave transactor required for two
     // diag simulations.
`ifndef SYNTHESIS
   ,
   output logic dut_rst_n_out
`endif
);


//---------------------------------------------
// Start with Tie-Off of Unused Interfaces
//---------------------------------------------
// the developer should use the next set of `include
// to properly tie-off any unused interface
// The list is put in the top of the module
// to avoid cases where developer may forget to
// remove it from the end of the file

`include "unused_flr_template.inc"
`include "unused_ddr_a_b_d_template.inc"
`include "unused_ddr_c_template.inc"
// `include "unused_pcim_template.inc"
// `include "unused_dma_pcis_template.inc"
`include "unused_cl_sda_template.inc"
`include "unused_sh_bar1_template.inc"
`include "unused_apppf_irq_template.inc"
   
/***************************************************************************************
 *                                                                                     *
 *           System logic used to manage various input signals.                        *
 *                                                                                     *
 ***************************************************************************************/
   
logic clk;
(* dont_touch = "true" *) logic pipe_rst_n;
logic pre_sync_rst_n;
(* dont_touch = "true" *) logic sync_rst_n;
   

assign clk = clk_main_a0;

//reset synchronizer
lib_pipe #(.WIDTH(1), .STAGES(4)) PIPE_RST_N (.clk(clk), .rst_n(1'b1), .in_bus(rst_main_n), .out_bus(pipe_rst_n));
   
always_ff @(negedge pipe_rst_n or posedge clk)
   if (!pipe_rst_n)
   begin
      pre_sync_rst_n <= 0;
      sync_rst_n <= 0;
   end
   else
   begin
      pre_sync_rst_n <= 1;
      sync_rst_n <= pre_sync_rst_n;
   end


// The functionality for these signals is TBD so they can can be tied-off.
assign cl_sh_status0 = 32'h0;
assign cl_sh_status1 = 32'h0;

assign cl_sh_id0 = `CL_SH_ID0;
assign cl_sh_id1 = `CL_SH_ID1;


// Don't use vleds for now.
assign cl_sh_status_vled = 16'h0;

// No DMA full case.
assign cl_sh_dma_wr_full = 1'b0;
assign cl_sh_dma_rd_full = 1'b0;


/***************************************************************************************
 *                                                                                     *
 *           Tie offs of unused signals.                                               *
 *                                                                                     *
 ***************************************************************************************/
   // 
   // Unused PCIS signals (read address and read data channels.
   //
assign cl_sh_dma_pcis_arready = 1'b0;
assign cl_sh_dma_pcis_rid = 6'h0;
assign cl_sh_dma_pcis_rdata = 512'h0;
assign cl_sh_dma_pcis_rresp = 2'h0;
assign cl_sh_dma_pcis_rlast = 1'b0;
assign cl_sh_dma_pcis_rvalid = 1'b0;



///////////////////////////////////////////////////////////////////////
///////////////// OCL SLAVE module ////////////////////////////////////
///////////////////////////////////////////////////////////////////////


//---------------------------------------------------------------- 
// Internal signals between OLC slave and the PCIM and DUT modules.
//----------------------------------------------------------------- 

axil_bus_t sh_ocl_bus();

cfg_bus_t pciw_cfg_bus();
cfg_bus_t pcir_cfg_bus();
cfg_bus_t pciws_cfg_bus();
cfg_bus_t dut_cfg_bus();


assign sh_ocl_bus.awvalid = sh_ocl_awvalid;
assign sh_ocl_bus.awaddr[31:0] = sh_ocl_awaddr;
assign ocl_sh_awready = sh_ocl_bus.awready;
assign sh_ocl_bus.wvalid = sh_ocl_wvalid;
assign sh_ocl_bus.wdata[31:0] = sh_ocl_wdata;
assign sh_ocl_bus.wstrb[3:0] = sh_ocl_wstrb;
assign ocl_sh_wready = sh_ocl_bus.wready;
assign ocl_sh_bvalid = sh_ocl_bus.bvalid;
assign ocl_sh_bresp = sh_ocl_bus.bresp;
assign sh_ocl_bus.bready = sh_ocl_bready;
assign sh_ocl_bus.arvalid = sh_ocl_arvalid;
assign sh_ocl_bus.araddr[31:0] = sh_ocl_araddr;
assign ocl_sh_arready = sh_ocl_bus.arready;
assign ocl_sh_rvalid = sh_ocl_bus.rvalid;
assign ocl_sh_rresp = sh_ocl_bus.rresp;
assign ocl_sh_rdata = sh_ocl_bus.rdata[31:0];
assign sh_ocl_bus.rready = sh_ocl_rready;

(* dont_touch = "true" *) logic ocl_slv_sync_rst_n;
lib_pipe #(.WIDTH(1), .STAGES(4)) OCL_SLV_SLC_RST_N (.clk(clk), .rst_n(1'b1), 
                                                     .in_bus(sync_rst_n), .out_bus(ocl_slv_sync_rst_n));


   
cl_ocl_slv cl_ocl_slv0 (

   .clk(clk),
   .sync_rst_n(ocl_slv_sync_rst_n),

   .sh_cl_flr_assert_q(1'b0),

   .sh_ocl_bus  (sh_ocl_bus),

   .pciw_cfg_bus(pciw_cfg_bus),
   .pcir_cfg_bus(pcir_cfg_bus),
   .pciws_cfg_bus(pciws_cfg_bus),
   .dut_cfg_bus(dut_cfg_bus)
);



//---------------------------------------------------------------- 
// Internal signals between the PCIM and DUT modules.
//-----------------------------------------------------------------

   // The control for the DUT gated clock.
logic                                                    clk_en;
logic 						         dut_clocked;
logic 						         dut_rst_n;
  
   // The port active signals, one for each port.
logic[`CL_DUT_NUM_WR_PORT-1:0]                           write_inst_active;
logic[`CL_DUT_NUM_RD_PORT-1:0]                            read_inst_active;

   // The port data signals. One bus for each port.
logic[`CL_DUT_NUM_WR_PORT-1:0][`CL_DUT_WPORT_WIDTH-1:0]  write_port_data;
logic[`CL_DUT_NUM_RD_PORT-1:0][`CL_DUT_RPORT_WIDTH-1:0]    read_port_data;
   

   // Is the read state machine active?
logic 						         read_sm_active;

   assign dut_rst_n_out = dut_rst_n;
   
   
/*************************************************************************
 *   Flop the PCIM AXI read and write bus.                               *
 *   Without this, single bit errors happen.                             *
 *************************************************************************/

(* dont_touch = "true" *) logic pcim_sync_rst_n;
lib_pipe #(.WIDTH(1), .STAGES(4)) PCIM_AXI_RST_N (.clk(clk), .rst_n(1'b1), 
                                                   .in_bus(sync_rst_n), .out_bus(pcim_sync_rst_n));


/*************************************************************************
 *                                                                       *
 *     PCIW master signals                                               *
 *                                                                       *
 *************************************************************************/
     // This is the PCIW AXI bus.
     // Write address channel
   logic [15:0]  pre_cl_sh_pcim_awid;
   logic [63:0]  pre_cl_sh_pcim_awaddr;
   logic [7:0]   pre_cl_sh_pcim_awlen;
   logic [2:0]   pre_cl_sh_pcim_awsize; 
   logic         pre_cl_sh_pcim_awvalid;
   logic 	 pre_sh_cl_pcim_awready;
   
     // Write data channel
   logic [511:0] pre_cl_sh_pcim_wdata;
   logic [63:0]  pre_cl_sh_pcim_wstrb;
   logic         pre_cl_sh_pcim_wlast;
   logic         pre_cl_sh_pcim_wvalid;
   logic 	 pre_sh_cl_pcim_wready;

     // Bus response channel
   logic [15:0]   pre_sh_cl_pcim_bid;
   logic [1:0]    pre_sh_cl_pcim_bresp;
   logic          pre_sh_cl_pcim_bvalid;
   logic          pre_cl_sh_pcim_bready;

/*************************************************************************
 *                                                                       *
 *     PCIR master signals                                               *
 *                                                                       *
 *************************************************************************/
     // This is the PCIR AXI bus.
     // Read address channel
   logic [15:0]  pre_cl_sh_pcim_arid;
   logic [63:0]  pre_cl_sh_pcim_araddr;
   logic [7:0]   pre_cl_sh_pcim_arlen;
   logic [2:0]   pre_cl_sh_pcim_arsize;
   logic         pre_cl_sh_pcim_arvalid;
   logic 	 pre_sh_cl_pcim_arready;

      // Read data channel
   logic [15:0]  pre_sh_cl_pcim_rid;
   logic [511:0] pre_sh_cl_pcim_rdata;
   logic [1:0] 	 pre_sh_cl_pcim_rresp;
   logic 	 pre_sh_cl_pcim_rlast;
   logic 	 pre_sh_cl_pcim_rvalid;
   logic         pre_cl_sh_pcim_rready;

/*************************************************************************
 *                                                                       *
 *     This is the flop array.                                           *
 *                                                                       *
 *************************************************************************/
   // AXI4 register slice - For signals between CL and HL
   axi_register_slice PCIM_AXI4_REG_SLC (
     .aclk           (clk),
     .aresetn        (pcim_sync_rst_n),
                                                                                                                         
     .s_axi_awid     ({7'b0, pre_cl_sh_pcim_awid[8:0]}),
     .s_axi_awaddr   (pre_cl_sh_pcim_awaddr),
     .s_axi_awlen    (pre_cl_sh_pcim_awlen),
     .s_axi_awsize   (pre_cl_sh_pcim_awsize),
     .s_axi_awvalid  (pre_cl_sh_pcim_awvalid),
     .s_axi_awready  (pre_sh_cl_pcim_awready),
     .s_axi_wdata    (pre_cl_sh_pcim_wdata),
     .s_axi_wstrb    (pre_cl_sh_pcim_wstrb),
     .s_axi_wlast    (pre_cl_sh_pcim_wlast),
     .s_axi_wvalid   (pre_cl_sh_pcim_wvalid),
     .s_axi_wready   (pre_sh_cl_pcim_wready),
     .s_axi_bid      (pre_sh_cl_pcim_bid),
     .s_axi_bresp    (pre_sh_cl_pcim_bresp),
     .s_axi_bvalid   (pre_sh_cl_pcim_bvalid),
     .s_axi_bready   (pre_cl_sh_pcim_bready),
     .s_axi_arid     ({7'b0, pre_cl_sh_pcim_arid[8:0]}),
     .s_axi_araddr   (pre_cl_sh_pcim_araddr),
     .s_axi_arlen    (pre_cl_sh_pcim_arlen),
     .s_axi_arsize   (pre_cl_sh_pcim_arsize),
     .s_axi_arvalid  (pre_cl_sh_pcim_arvalid),
     .s_axi_arready  (pre_sh_cl_pcim_arready),
     .s_axi_rid      (pre_sh_cl_pcim_rid),
     .s_axi_rdata    (pre_sh_cl_pcim_rdata),
     .s_axi_rresp    (pre_sh_cl_pcim_rresp),
     .s_axi_rlast    (pre_sh_cl_pcim_rlast),
     .s_axi_rvalid   (pre_sh_cl_pcim_rvalid),
     .s_axi_rready   (pre_cl_sh_pcim_rready),  

     .m_axi_awid     (cl_sh_pcim_awid),   
     .m_axi_awaddr   (cl_sh_pcim_awaddr), 
     .m_axi_awlen    (cl_sh_pcim_awlen),  
     .m_axi_awsize   (cl_sh_pcim_awsize), 
     .m_axi_awvalid  (cl_sh_pcim_awvalid),
     .m_axi_awready  (sh_cl_pcim_awready),
     .m_axi_wdata    (cl_sh_pcim_wdata),  
     .m_axi_wstrb    (cl_sh_pcim_wstrb),  
     .m_axi_wlast    (cl_sh_pcim_wlast),  
     .m_axi_wvalid   (cl_sh_pcim_wvalid), 
     .m_axi_wready   (sh_cl_pcim_wready), 
     .m_axi_bid      (sh_cl_pcim_bid),    
     .m_axi_bresp    (sh_cl_pcim_bresp),  
     .m_axi_bvalid   (sh_cl_pcim_bvalid), 
     .m_axi_bready   (cl_sh_pcim_bready), 
     .m_axi_arid     (cl_sh_pcim_arid),   
     .m_axi_araddr   (cl_sh_pcim_araddr), 
     .m_axi_arlen    (cl_sh_pcim_arlen),  
     .m_axi_arsize   (cl_sh_pcim_arsize), 
     .m_axi_arvalid  (cl_sh_pcim_arvalid),
     .m_axi_arready  (sh_cl_pcim_arready),
     .m_axi_rid      (sh_cl_pcim_rid),    
     .m_axi_rdata    (sh_cl_pcim_rdata),  
     .m_axi_rresp    (sh_cl_pcim_rresp),  
     .m_axi_rlast    (sh_cl_pcim_rlast),  
     .m_axi_rvalid   (sh_cl_pcim_rvalid), 
     .m_axi_rready   (cl_sh_pcim_rready)
     );

   
/**********************************************************
 *           PCI MASTER WRITE STATE MACHINE
 **********************************************************/

   

cl_pciw_mstr cl_pciw_mstr0 (

   .clk(clk),
   .rst_n(ocl_slv_sync_rst_n),
   .dut_rst_n(dut_rst_n),
   .clk_en(clk_en),
   .dut_clocked(dut_clocked),
   .dut_error(1'b0),
   .read_sm_active(read_sm_active),
   .slave_sm_active(1'b0),

     // This is the OCL configuration bus.
   .pciw_cfg_bus(pciw_cfg_bus),

     // This is the PCIW AXI bus.
     // Write address channel.
   .cl_sh_pcim_awid(pre_cl_sh_pcim_awid),
   .cl_sh_pcim_awaddr(pre_cl_sh_pcim_awaddr),
   .cl_sh_pcim_awlen(pre_cl_sh_pcim_awlen),
   .cl_sh_pcim_awsize(pre_cl_sh_pcim_awsize),								
   .cl_sh_pcim_awvalid(pre_cl_sh_pcim_awvalid),
   .sh_cl_pcim_awready(pre_sh_cl_pcim_awready),
   
     // Write data channel.
   .cl_sh_pcim_wdata(pre_cl_sh_pcim_wdata),
   .cl_sh_pcim_wstrb(pre_cl_sh_pcim_wstrb),
   .cl_sh_pcim_wlast(pre_cl_sh_pcim_wlast),
   .cl_sh_pcim_wvalid(pre_cl_sh_pcim_wvalid),
   .sh_cl_pcim_wready(pre_sh_cl_pcim_wready),

     // Bus response channel.
   .sh_cl_pcim_bid(pre_sh_cl_pcim_bid),
   .sh_cl_pcim_bresp(pre_sh_cl_pcim_bresp),
   .sh_cl_pcim_bvalid(pre_sh_cl_pcim_bvalid),
   .cl_sh_pcim_bready(pre_cl_sh_pcim_bready),

     // Are the individual read and write ports active?
   .write_inst_active(write_inst_active),
			   
      // This is the actual port data.
   .write_port_data(write_port_data)
);
   
/**********************************************************
 *              END PCI MASTER
 **********************************************************/


   
 /**********************************************************
 *           PCI MASTER READ STATE MACHINE
 **********************************************************/

   

cl_pcir_mstr cl_pcir_mstr0 (

   .clk(clk),
   .rst_n(ocl_slv_sync_rst_n),
   .dut_rst_n(dut_rst_n),
   .read_sm_active(read_sm_active),
   .dut_clocked(dut_clocked),

     // This is the OCL configuration bus.
   .pcir_cfg_bus(pcir_cfg_bus),

     // This is the PCIR AXI bus.
     // Read address channel
   .cl_sh_pcim_arid(pre_cl_sh_pcim_arid),
   .cl_sh_pcim_araddr(pre_cl_sh_pcim_araddr),
   .cl_sh_pcim_arlen(pre_cl_sh_pcim_arlen),
   .cl_sh_pcim_arsize(pre_cl_sh_pcim_arsize),
   .cl_sh_pcim_arvalid(pre_cl_sh_pcim_arvalid),
   .sh_cl_pcim_arready(pre_sh_cl_pcim_arready),

      // Read data channel
   .sh_cl_pcim_rid(pre_sh_cl_pcim_rid),
   .sh_cl_pcim_rdata(pre_sh_cl_pcim_rdata),
   .sh_cl_pcim_rresp(pre_sh_cl_pcim_rresp),
   .sh_cl_pcim_rlast(pre_sh_cl_pcim_rlast),
   .sh_cl_pcim_rvalid(pre_sh_cl_pcim_rvalid),
   .cl_sh_pcim_rready(pre_cl_sh_pcim_rready),
			    
     // Are the individual read ports active?
   .read_inst_active(read_inst_active),
			   
      // This is the actual port data.
   .read_port_data(read_port_data)
);
   
/**********************************************************
 *              END PCI MASTER
 **********************************************************/

   
   
/*************************************************************************
 *   Flop the PCIM AXI read and write bus.                               *
 *   Without this, single bit errors happen.                             *
 *************************************************************************/
/*
 *  No Peer to peer FPGA connection in this model.
 * 
(* dont_touch = "true" *) logic pcis_sync_rst_n;
lib_pipe #(.WIDTH(1), .STAGES(4)) PCIS_AXI_RST_N (.clk(clk), .rst_n(1'b1), 
                                                   .in_bus(sync_rst_n), .out_bus(pcis_sync_rst_n));
 */


/*************************************************************************
 *                                                                       *
 *     PCIW slave signals                                                *
 *                                                                       *
 *************************************************************************/

/*
 *  No Peer to peer FPGA connection in this model.
 * 
     // This is the PCIW AXI bus.
     // Write address channel
   logic [15:0]  pre_sh_cl_dma_pcis_awid;
   logic [63:0]  pre_sh_cl_dma_pcis_awaddr;
   logic [7:0]   pre_sh_cl_dma_pcis_awlen;
   logic [2:0]   pre_sh_cl_dma_pcis_awsize; 
   logic         pre_sh_cl_dma_pcis_awvalid;
   logic 	 pre_cl_sh_dma_pcis_awready;
   
     // Write data channel
   logic [511:0] pre_sh_cl_dma_pcis_wdata;
   logic [63:0]  pre_sh_cl_dma_pcis_wstrb;
   logic         pre_sh_cl_dma_pcis_wlast;
   logic         pre_sh_cl_dma_pcis_wvalid;
   logic 	 pre_cl_sh_dma_pcis_wready;

     // Bus response channel
   logic [15:0]   pre_cl_sh_dma_pcis_bid;
   logic [1:0]    pre_cl_sh_dma_pcis_bresp;
   logic          pre_cl_sh_dma_pcis_bvalid;
   logic          pre_sh_cl_dma_pcis_bready;

      // Eliminate the warning.
   logic [9:0] 	  dummy_wire;
*/

/*************************************************************************
 *                                                                       *
 *     This is the flop array.                                           *
 *                                                                       *
 *************************************************************************/
   // AXI4 register slice - For signals between CL and HL
/*
 *  No Peer to peer FPGA connection in this model.
 * 
   axi_register_slice PCIS_AXI4_REG_SLC (
     .aclk           (clk),
     .aresetn        (pcis_sync_rst_n),
                                                                                                                         
     .s_axi_awid     ({10'h0, sh_cl_dma_pcis_awid}),
     .s_axi_awaddr   (sh_cl_dma_pcis_awaddr),
     .s_axi_awlen    (sh_cl_dma_pcis_awlen),
     .s_axi_awsize   (sh_cl_dma_pcis_awsize),
     .s_axi_awvalid  (sh_cl_dma_pcis_awvalid),
     .s_axi_awready  (cl_sh_dma_pcis_awready),
     .s_axi_wdata    (sh_cl_dma_pcis_wdata),
     .s_axi_wstrb    (sh_cl_dma_pcis_wstrb),
     .s_axi_wlast    (sh_cl_dma_pcis_wlast),
     .s_axi_wvalid   (sh_cl_dma_pcis_wvalid),
     .s_axi_wready   (cl_sh_dma_pcis_wready),
     .s_axi_bid      ({dummy_wire, cl_sh_dma_pcis_bid}),
     .s_axi_bresp    (cl_sh_dma_pcis_bresp),
     .s_axi_bvalid   (cl_sh_dma_pcis_bvalid),
     .s_axi_bready   (sh_cl_dma_pcis_bready),

     .m_axi_awid     (pre_sh_cl_dma_pcis_awid),   
     .m_axi_awaddr   (pre_sh_cl_dma_pcis_awaddr), 
     .m_axi_awlen    (pre_sh_cl_dma_pcis_awlen),  
     .m_axi_awsize   (pre_sh_cl_dma_pcis_awsize), 
     .m_axi_awvalid  (pre_sh_cl_dma_pcis_awvalid),
     .m_axi_awready  (pre_cl_sh_dma_pcis_awready),
     .m_axi_wdata    (pre_sh_cl_dma_pcis_wdata),  
     .m_axi_wstrb    (pre_sh_cl_dma_pcis_wstrb),  
     .m_axi_wlast    (pre_sh_cl_dma_pcis_wlast),  
     .m_axi_wvalid   (pre_sh_cl_dma_pcis_wvalid), 
     .m_axi_wready   (pre_cl_sh_dma_pcis_wready), 
     .m_axi_bid      (pre_cl_sh_dma_pcis_bid),    
     .m_axi_bresp    (pre_cl_sh_dma_pcis_bresp),  
     .m_axi_bvalid   (pre_cl_sh_dma_pcis_bvalid), 
     .m_axi_bready   (pre_sh_cl_dma_pcis_bready) 
     );
*/

 
/**********************************************************
 *           PCI SLAVE WRITE CONTROL
 **********************************************************/


/*
 *  No Peer to peer FPGA connection in this model.
 * 
cl_pciw_slv cl_pciw_slv0(
   .clk(clk),
   .rst_n(ocl_slv_sync_rst_n),
   .slave_sm_active(slave_sm_active),
   .dut_clocked(dut_clocked),
		       
   .pciws_cfg_bus(pciws_cfg_bus),

     // This is the PCIS AXI bus.
     // Write address channel
   .sh_cl_dma_pcis_awid(pre_sh_cl_dma_pcis_awid[5:0]),
   .sh_cl_dma_pcis_awaddr(pre_sh_cl_dma_pcis_awaddr),
   .sh_cl_dma_pcis_awlen(pre_sh_cl_dma_pcis_awlen),
   .sh_cl_dma_pcis_awsize(pre_sh_cl_dma_pcis_awsize),
   .sh_cl_dma_pcis_awvalid(pre_sh_cl_dma_pcis_awvalid),
   .cl_sh_dma_pcis_awready(pre_cl_sh_dma_pcis_awready),

      // Write data channel
   .sh_cl_dma_pcis_wdata(pre_sh_cl_dma_pcis_wdata),
   .sh_cl_dma_pcis_wstrb(pre_sh_cl_dma_pcis_wstrb),
   .sh_cl_dma_pcis_wlast(pre_sh_cl_dma_pcis_wlast),
   .sh_cl_dma_pcis_wvalid(pre_sh_cl_dma_pcis_wvalid),
   .cl_sh_dma_pcis_wready(pre_cl_sh_dma_pcis_wready),

      // Bus response channel
   .cl_sh_dma_pcis_bid(pre_cl_sh_dma_pcis_bid[5:0]),
   .cl_sh_dma_pcis_bresp(pre_cl_sh_dma_pcis_bresp),
   .cl_sh_dma_pcis_bvalid(pre_cl_sh_dma_pcis_bvalid),
   .sh_cl_dma_pcis_bready(pre_sh_cl_dma_pcis_bready),
		      
      // This is the pcis peer to peer data itself.
   .pp_port_data(pp_port_data)
);
*/

/**********************************************************
 *           END PCI SLAVE WRITE CONTROL
 **********************************************************/

 

   
/**********************************************************
 *          The STREAM testbench.
 **********************************************************/

     // These are the port signals that come from the streaming transactor.
     // They get mapped to the DUT port signals.
    logic 		 axi_mem_init_emul_en; 

					  
        //
        //  The gated clock.
        //
    logic       gated_clk;
    logic       clk_en_q;

    always @(negedge clk) begin
       clk_en_q <= clk_en;
    end
    assign gated_clk = clk & clk_en_q;

top_earlgrey_awsf1 top_earlgrey_awsf1_0(
  .clk(gated_clk),
  .rst_l(dut_rst_n),
			   
	//
        // Ports that map to DPI calls for FPGA builds.
        //	   
     .write_inst_active(write_inst_active),
     .write_port_data(write_port_data),

     .read_inst_active(read_inst_active),
     .read_port_data(read_port_data)
);

/**********************************************************
 *              END DUT test chip
 **********************************************************/



//----------------------------------------- 
// Virtual JTAG ILA Debug core example 
//-----------------------------------------


`ifdef ENABLE_VJTAG_DEBUG

   axi_bus_t axi_bus_tied();


   cl_ila #(.DDR_A_PRESENT(`DDR_A_PRESENT) ) CL_ILA   (

   .aclk(clk),
   .drck(drck),
   .shift(shift),
      .tdi(tdi),
   .update(update),
   .sel(sel),
   .tdo(tdo),
   .tms(tms),
   .tck(tck),
   .runtest(runtest),
   .reset(reset),
   .capture(capture),
   .bscanid_en(bscanid_en),
   .sh_cl_dma_pcis_q(sh_cl_dma_pcis_q),
`ifndef DDR_A_ABSENT   
   .lcl_cl_sh_ddra(lcl_cl_sh_ddra)
`else
   .lcl_cl_sh_ddra(axi_bus_tied)
`endif
);

cl_vio CL_VIO (

   .clk_extra_a1(clk_extra_a1)

);


//----------------------------------------- 
// Virtual JATG ILA Debug core example 
//-----------------------------------------
// tie off for ILA port when probing block not present
   assign axi_bus_tied.awvalid = 1'b0 ;
   assign axi_bus_tied.awaddr = 64'b0 ;
   assign axi_bus_tied.awready = 1'b0 ;
   assign axi_bus_tied.wvalid = 1'b0 ;
   assign axi_bus_tied.wstrb = 64'b0 ;
   assign axi_bus_tied.wlast = 1'b0 ;
   assign axi_bus_tied.wready = 1'b0 ;
   assign axi_bus_tied.wdata = 512'b0 ;
   assign axi_bus_tied.arready = 1'b0 ;
   assign axi_bus_tied.rdata = 512'b0 ;
   assign axi_bus_tied.araddr = 64'b0 ;
   assign axi_bus_tied.arvalid = 1'b0 ;
   assign axi_bus_tied.awid = 16'b0 ;
   assign axi_bus_tied.arid = 16'b0 ;
   assign axi_bus_tied.awlen = 8'b0 ;
   assign axi_bus_tied.rlast = 1'b0 ;
   assign axi_bus_tied.rresp = 2'b0 ;
   assign axi_bus_tied.rid = 16'b0 ;
   assign axi_bus_tied.rvalid = 1'b0 ;
   assign axi_bus_tied.arlen = 8'b0 ;
   assign axi_bus_tied.bresp = 2'b0 ;
   assign axi_bus_tied.rready = 1'b0 ;
   assign axi_bus_tied.bvalid = 1'b0 ;
   assign axi_bus_tied.bid = 16'b0 ;
   assign axi_bus_tied.bready = 1'b0 ;

`endif //  `ifdef ENABLE_VJTAG_DEBUG

   
endmodule   
