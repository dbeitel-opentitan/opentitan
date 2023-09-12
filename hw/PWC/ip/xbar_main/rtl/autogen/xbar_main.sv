// SPDX-FileCopyrightText: Copyright (c) 2022 by Rivos Inc.
// Confidential and proprietary, see LICENSE for details.
// SPDX-License-Identifier: LicenseRef-Rivos-Internal-Only

// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// xbar_main module generated by `tlgen.py` tool
// all reset signals should be generated from one reset signal to not make any deadlock
//
// Interconnect
// u_rv_core_ibex.corei --> u_rv_core_ibex1n18 --> u_sm1rv_dm19   --> u_rv_dm.mem   
// u_rv_core_ibex.corei --> u_rv_core_ibex1n18 --> u_sm1sram_ctrl_main20 --> u_sram_ctrl_main.ram
// u_rv_core_ibex.corei --> u_rv_core_ibex1n18 --> u_sm1extr21    --> u_extr.dev    
// u_rv_core_ibex.cored --> u_rv_core_ibex1n22 --> u_sm1rv_dm19   --> u_rv_dm.mem   
// u_rv_core_ibex.cored --> u_rv_core_ibex1n22 --> u_sm1rv_dm23   --> u_rv_dm.regs  
// u_rv_core_ibex.cored --> u_rv_core_ibex1n22 --> u_sm1sram_ctrl_main20 --> u_sram_ctrl_main.ram
// u_rv_core_ibex.cored --> u_rv_core_ibex1n22 --> u_sm1asf25     --> u_asf24        --> u_peri        
// u_rv_core_ibex.cored --> u_rv_core_ibex1n22 --> u_sm1rv_plic26 --> u_rv_plic     
// u_rv_core_ibex.cored --> u_rv_core_ibex1n22 --> u_sm1otbn27    --> u_otbn        
// u_rv_core_ibex.cored --> u_rv_core_ibex1n22 --> u_sm1sram_ctrl_main28 --> u_sram_ctrl_main.regs
// u_rv_core_ibex.cored --> u_rv_core_ibex1n22 --> u_sm1rv_core_ibex29 --> u_rv_core_ibex.cfg
// u_rv_core_ibex.cored --> u_rv_core_ibex1n22 --> u_sm1sram_ctrl_mbox30 --> u_sram_ctrl_mbox.ram
// u_rv_core_ibex.cored --> u_rv_core_ibex1n22 --> u_sm1sram_ctrl_mbox31 --> u_sram_ctrl_mbox.regs
// u_rv_core_ibex.cored --> u_rv_core_ibex1n22 --> u_mbx.dev     
// u_rv_core_ibex.cored --> u_rv_core_ibex1n22 --> u_dma.dev     
// u_rv_core_ibex.cored --> u_rv_core_ibex1n22 --> u_sm1extr21    --> u_extr.dev    
// u_rv_dm.sba    --> u_rv_dm1n32    --> u_sm1rv_dm19   --> u_rv_dm.mem   
// u_rv_dm.sba    --> u_rv_dm1n32    --> u_sm1rv_dm23   --> u_rv_dm.regs  
// u_rv_dm.sba    --> u_rv_dm1n32    --> u_sm1sram_ctrl_main20 --> u_sram_ctrl_main.ram
// u_rv_dm.sba    --> u_rv_dm1n32    --> u_sm1asf25     --> u_asf24        --> u_peri        
// u_rv_dm.sba    --> u_rv_dm1n32    --> u_sm1rv_plic26 --> u_rv_plic     
// u_rv_dm.sba    --> u_rv_dm1n32    --> u_sm1otbn27    --> u_otbn        
// u_rv_dm.sba    --> u_rv_dm1n32    --> u_sm1sram_ctrl_main28 --> u_sram_ctrl_main.regs
// u_rv_dm.sba    --> u_rv_dm1n32    --> u_sm1rv_core_ibex29 --> u_rv_core_ibex.cfg
// u_rv_dm.sba    --> u_rv_dm1n32    --> u_sm1sram_ctrl_mbox30 --> u_sram_ctrl_mbox.ram
// u_rv_dm.sba    --> u_rv_dm1n32    --> u_sm1sram_ctrl_mbox31 --> u_sram_ctrl_mbox.regs
// u_mbx.hst      --> u_sm1sram_ctrl_mbox30 --> u_sram_ctrl_mbox.ram
// u_dma.hst      --> u_dma1n33      --> u_sm1sram_ctrl_main20 --> u_sram_ctrl_main.ram
// u_dma.hst      --> u_dma1n33      --> u_sm1extr21    --> u_extr.dev    

module xbar_main (
  input clk_main_i,
  input clk_fixed_i,
  input clk_usb_i,
  input clk_spi_host1_i,
  input rst_main_ni,
  input rst_fixed_ni,
  input rst_usb_ni,
  input rst_spi_host1_ni,

  // Host interfaces
  input  tlul_pkg::tl_h2d_t tl_rv_core_ibex__corei_i,
  output tlul_pkg::tl_d2h_t tl_rv_core_ibex__corei_o,
  input  tlul_pkg::tl_h2d_t tl_rv_core_ibex__cored_i,
  output tlul_pkg::tl_d2h_t tl_rv_core_ibex__cored_o,
  input  tlul_pkg::tl_h2d_t tl_rv_dm__sba_i,
  output tlul_pkg::tl_d2h_t tl_rv_dm__sba_o,
  input  tlul_pkg::tl_h2d_t tl_mbx__hst_i,
  output tlul_pkg::tl_d2h_t tl_mbx__hst_o,
  input  tlul_pkg::tl_h2d_t tl_dma__hst_i,
  output tlul_pkg::tl_d2h_t tl_dma__hst_o,

  // Device interfaces
  output tlul_pkg::tl_h2d_t tl_rv_dm__regs_o,
  input  tlul_pkg::tl_d2h_t tl_rv_dm__regs_i,
  output tlul_pkg::tl_h2d_t tl_rv_dm__mem_o,
  input  tlul_pkg::tl_d2h_t tl_rv_dm__mem_i,
  output tlul_pkg::tl_h2d_t tl_peri_o,
  input  tlul_pkg::tl_d2h_t tl_peri_i,
  output tlul_pkg::tl_h2d_t tl_rv_plic_o,
  input  tlul_pkg::tl_d2h_t tl_rv_plic_i,
  output tlul_pkg::tl_h2d_t tl_otbn_o,
  input  tlul_pkg::tl_d2h_t tl_otbn_i,
  output tlul_pkg::tl_h2d_t tl_rv_core_ibex__cfg_o,
  input  tlul_pkg::tl_d2h_t tl_rv_core_ibex__cfg_i,
  output tlul_pkg::tl_h2d_t tl_sram_ctrl_main__regs_o,
  input  tlul_pkg::tl_d2h_t tl_sram_ctrl_main__regs_i,
  output tlul_pkg::tl_h2d_t tl_sram_ctrl_main__ram_o,
  input  tlul_pkg::tl_d2h_t tl_sram_ctrl_main__ram_i,
  output tlul_pkg::tl_h2d_t tl_sram_ctrl_mbox__regs_o,
  input  tlul_pkg::tl_d2h_t tl_sram_ctrl_mbox__regs_i,
  output tlul_pkg::tl_h2d_t tl_sram_ctrl_mbox__ram_o,
  input  tlul_pkg::tl_d2h_t tl_sram_ctrl_mbox__ram_i,
  output tlul_pkg::tl_h2d_t tl_mbx__dev_o,
  input  tlul_pkg::tl_d2h_t tl_mbx__dev_i,
  output tlul_pkg::tl_h2d_t tl_dma__dev_o,
  input  tlul_pkg::tl_d2h_t tl_dma__dev_i,
  output tlul_pkg::tl_h2d_t tl_extr__dev_o,
  input  tlul_pkg::tl_d2h_t tl_extr__dev_i,

  input prim_mubi_pkg::mubi4_t scanmode_i
);

  import tlul_pkg::*;
  import tl_main_pkg::*;

  // scanmode_i is currently not used, but provisioned for future use
  // this assignment prevents lint warnings
  logic unused_scanmode;
  assign unused_scanmode = ^scanmode_i;

  tl_h2d_t tl_rv_core_ibex1n18_us_h2d ;
  tl_d2h_t tl_rv_core_ibex1n18_us_d2h ;


  tl_h2d_t tl_rv_core_ibex1n18_ds_h2d [3];
  tl_d2h_t tl_rv_core_ibex1n18_ds_d2h [3];

  // Create steering signal
  logic [1:0] dev_sel_rv_core_ibex1n18;


  tl_h2d_t tl_sm1rv_dm19_us_h2d [3];
  tl_d2h_t tl_sm1rv_dm19_us_d2h [3];

  tl_h2d_t tl_sm1rv_dm19_ds_h2d ;
  tl_d2h_t tl_sm1rv_dm19_ds_d2h ;


  tl_h2d_t tl_sm1sram_ctrl_main20_us_h2d [4];
  tl_d2h_t tl_sm1sram_ctrl_main20_us_d2h [4];

  tl_h2d_t tl_sm1sram_ctrl_main20_ds_h2d ;
  tl_d2h_t tl_sm1sram_ctrl_main20_ds_d2h ;


  tl_h2d_t tl_sm1extr21_us_h2d [3];
  tl_d2h_t tl_sm1extr21_us_d2h [3];

  tl_h2d_t tl_sm1extr21_ds_h2d ;
  tl_d2h_t tl_sm1extr21_ds_d2h ;

  tl_h2d_t tl_rv_core_ibex1n22_us_h2d ;
  tl_d2h_t tl_rv_core_ibex1n22_us_d2h ;


  tl_h2d_t tl_rv_core_ibex1n22_ds_h2d [13];
  tl_d2h_t tl_rv_core_ibex1n22_ds_d2h [13];

  // Create steering signal
  logic [3:0] dev_sel_rv_core_ibex1n22;


  tl_h2d_t tl_sm1rv_dm23_us_h2d [2];
  tl_d2h_t tl_sm1rv_dm23_us_d2h [2];

  tl_h2d_t tl_sm1rv_dm23_ds_h2d ;
  tl_d2h_t tl_sm1rv_dm23_ds_d2h ;

  tl_h2d_t tl_asf24_us_h2d ;
  tl_d2h_t tl_asf24_us_d2h ;
  tl_h2d_t tl_asf24_ds_h2d ;
  tl_d2h_t tl_asf24_ds_d2h ;


  tl_h2d_t tl_sm1asf25_us_h2d [2];
  tl_d2h_t tl_sm1asf25_us_d2h [2];

  tl_h2d_t tl_sm1asf25_ds_h2d ;
  tl_d2h_t tl_sm1asf25_ds_d2h ;


  tl_h2d_t tl_sm1rv_plic26_us_h2d [2];
  tl_d2h_t tl_sm1rv_plic26_us_d2h [2];

  tl_h2d_t tl_sm1rv_plic26_ds_h2d ;
  tl_d2h_t tl_sm1rv_plic26_ds_d2h ;


  tl_h2d_t tl_sm1otbn27_us_h2d [2];
  tl_d2h_t tl_sm1otbn27_us_d2h [2];

  tl_h2d_t tl_sm1otbn27_ds_h2d ;
  tl_d2h_t tl_sm1otbn27_ds_d2h ;


  tl_h2d_t tl_sm1sram_ctrl_main28_us_h2d [2];
  tl_d2h_t tl_sm1sram_ctrl_main28_us_d2h [2];

  tl_h2d_t tl_sm1sram_ctrl_main28_ds_h2d ;
  tl_d2h_t tl_sm1sram_ctrl_main28_ds_d2h ;


  tl_h2d_t tl_sm1rv_core_ibex29_us_h2d [2];
  tl_d2h_t tl_sm1rv_core_ibex29_us_d2h [2];

  tl_h2d_t tl_sm1rv_core_ibex29_ds_h2d ;
  tl_d2h_t tl_sm1rv_core_ibex29_ds_d2h ;


  tl_h2d_t tl_sm1sram_ctrl_mbox30_us_h2d [3];
  tl_d2h_t tl_sm1sram_ctrl_mbox30_us_d2h [3];

  tl_h2d_t tl_sm1sram_ctrl_mbox30_ds_h2d ;
  tl_d2h_t tl_sm1sram_ctrl_mbox30_ds_d2h ;


  tl_h2d_t tl_sm1sram_ctrl_mbox31_us_h2d [2];
  tl_d2h_t tl_sm1sram_ctrl_mbox31_us_d2h [2];

  tl_h2d_t tl_sm1sram_ctrl_mbox31_ds_h2d ;
  tl_d2h_t tl_sm1sram_ctrl_mbox31_ds_d2h ;

  tl_h2d_t tl_rv_dm1n32_us_h2d ;
  tl_d2h_t tl_rv_dm1n32_us_d2h ;


  tl_h2d_t tl_rv_dm1n32_ds_h2d [10];
  tl_d2h_t tl_rv_dm1n32_ds_d2h [10];

  // Create steering signal
  logic [3:0] dev_sel_rv_dm1n32;

  tl_h2d_t tl_dma1n33_us_h2d ;
  tl_d2h_t tl_dma1n33_us_d2h ;


  tl_h2d_t tl_dma1n33_ds_h2d [2];
  tl_d2h_t tl_dma1n33_ds_d2h [2];

  // Create steering signal
  logic [1:0] dev_sel_dma1n33;



  assign tl_sm1rv_dm19_us_h2d[0] = tl_rv_core_ibex1n18_ds_h2d[0];
  assign tl_rv_core_ibex1n18_ds_d2h[0] = tl_sm1rv_dm19_us_d2h[0];

  assign tl_sm1sram_ctrl_main20_us_h2d[0] = tl_rv_core_ibex1n18_ds_h2d[1];
  assign tl_rv_core_ibex1n18_ds_d2h[1] = tl_sm1sram_ctrl_main20_us_d2h[0];

  assign tl_sm1extr21_us_h2d[0] = tl_rv_core_ibex1n18_ds_h2d[2];
  assign tl_rv_core_ibex1n18_ds_d2h[2] = tl_sm1extr21_us_d2h[0];

  assign tl_sm1rv_dm19_us_h2d[1] = tl_rv_core_ibex1n22_ds_h2d[0];
  assign tl_rv_core_ibex1n22_ds_d2h[0] = tl_sm1rv_dm19_us_d2h[1];

  assign tl_sm1rv_dm23_us_h2d[0] = tl_rv_core_ibex1n22_ds_h2d[1];
  assign tl_rv_core_ibex1n22_ds_d2h[1] = tl_sm1rv_dm23_us_d2h[0];

  assign tl_sm1sram_ctrl_main20_us_h2d[1] = tl_rv_core_ibex1n22_ds_h2d[2];
  assign tl_rv_core_ibex1n22_ds_d2h[2] = tl_sm1sram_ctrl_main20_us_d2h[1];

  assign tl_sm1asf25_us_h2d[0] = tl_rv_core_ibex1n22_ds_h2d[3];
  assign tl_rv_core_ibex1n22_ds_d2h[3] = tl_sm1asf25_us_d2h[0];

  assign tl_sm1rv_plic26_us_h2d[0] = tl_rv_core_ibex1n22_ds_h2d[4];
  assign tl_rv_core_ibex1n22_ds_d2h[4] = tl_sm1rv_plic26_us_d2h[0];

  assign tl_sm1otbn27_us_h2d[0] = tl_rv_core_ibex1n22_ds_h2d[5];
  assign tl_rv_core_ibex1n22_ds_d2h[5] = tl_sm1otbn27_us_d2h[0];

  assign tl_sm1sram_ctrl_main28_us_h2d[0] = tl_rv_core_ibex1n22_ds_h2d[6];
  assign tl_rv_core_ibex1n22_ds_d2h[6] = tl_sm1sram_ctrl_main28_us_d2h[0];

  assign tl_sm1rv_core_ibex29_us_h2d[0] = tl_rv_core_ibex1n22_ds_h2d[7];
  assign tl_rv_core_ibex1n22_ds_d2h[7] = tl_sm1rv_core_ibex29_us_d2h[0];

  assign tl_sm1sram_ctrl_mbox30_us_h2d[0] = tl_rv_core_ibex1n22_ds_h2d[8];
  assign tl_rv_core_ibex1n22_ds_d2h[8] = tl_sm1sram_ctrl_mbox30_us_d2h[0];

  assign tl_sm1sram_ctrl_mbox31_us_h2d[0] = tl_rv_core_ibex1n22_ds_h2d[9];
  assign tl_rv_core_ibex1n22_ds_d2h[9] = tl_sm1sram_ctrl_mbox31_us_d2h[0];

  assign tl_mbx__dev_o = tl_rv_core_ibex1n22_ds_h2d[10];
  assign tl_rv_core_ibex1n22_ds_d2h[10] = tl_mbx__dev_i;

  assign tl_dma__dev_o = tl_rv_core_ibex1n22_ds_h2d[11];
  assign tl_rv_core_ibex1n22_ds_d2h[11] = tl_dma__dev_i;

  assign tl_sm1extr21_us_h2d[1] = tl_rv_core_ibex1n22_ds_h2d[12];
  assign tl_rv_core_ibex1n22_ds_d2h[12] = tl_sm1extr21_us_d2h[1];

  assign tl_sm1rv_dm19_us_h2d[2] = tl_rv_dm1n32_ds_h2d[0];
  assign tl_rv_dm1n32_ds_d2h[0] = tl_sm1rv_dm19_us_d2h[2];

  assign tl_sm1rv_dm23_us_h2d[1] = tl_rv_dm1n32_ds_h2d[1];
  assign tl_rv_dm1n32_ds_d2h[1] = tl_sm1rv_dm23_us_d2h[1];

  assign tl_sm1sram_ctrl_main20_us_h2d[2] = tl_rv_dm1n32_ds_h2d[2];
  assign tl_rv_dm1n32_ds_d2h[2] = tl_sm1sram_ctrl_main20_us_d2h[2];

  assign tl_sm1asf25_us_h2d[1] = tl_rv_dm1n32_ds_h2d[3];
  assign tl_rv_dm1n32_ds_d2h[3] = tl_sm1asf25_us_d2h[1];

  assign tl_sm1rv_plic26_us_h2d[1] = tl_rv_dm1n32_ds_h2d[4];
  assign tl_rv_dm1n32_ds_d2h[4] = tl_sm1rv_plic26_us_d2h[1];

  assign tl_sm1otbn27_us_h2d[1] = tl_rv_dm1n32_ds_h2d[5];
  assign tl_rv_dm1n32_ds_d2h[5] = tl_sm1otbn27_us_d2h[1];

  assign tl_sm1sram_ctrl_main28_us_h2d[1] = tl_rv_dm1n32_ds_h2d[6];
  assign tl_rv_dm1n32_ds_d2h[6] = tl_sm1sram_ctrl_main28_us_d2h[1];

  assign tl_sm1rv_core_ibex29_us_h2d[1] = tl_rv_dm1n32_ds_h2d[7];
  assign tl_rv_dm1n32_ds_d2h[7] = tl_sm1rv_core_ibex29_us_d2h[1];

  assign tl_sm1sram_ctrl_mbox30_us_h2d[1] = tl_rv_dm1n32_ds_h2d[8];
  assign tl_rv_dm1n32_ds_d2h[8] = tl_sm1sram_ctrl_mbox30_us_d2h[1];

  assign tl_sm1sram_ctrl_mbox31_us_h2d[1] = tl_rv_dm1n32_ds_h2d[9];
  assign tl_rv_dm1n32_ds_d2h[9] = tl_sm1sram_ctrl_mbox31_us_d2h[1];

  assign tl_sm1sram_ctrl_mbox30_us_h2d[2] = tl_mbx__hst_i;
  assign tl_mbx__hst_o = tl_sm1sram_ctrl_mbox30_us_d2h[2];

  assign tl_sm1sram_ctrl_main20_us_h2d[3] = tl_dma1n33_ds_h2d[0];
  assign tl_dma1n33_ds_d2h[0] = tl_sm1sram_ctrl_main20_us_d2h[3];

  assign tl_sm1extr21_us_h2d[2] = tl_dma1n33_ds_h2d[1];
  assign tl_dma1n33_ds_d2h[1] = tl_sm1extr21_us_d2h[2];

  assign tl_rv_core_ibex1n18_us_h2d = tl_rv_core_ibex__corei_i;
  assign tl_rv_core_ibex__corei_o = tl_rv_core_ibex1n18_us_d2h;

  assign tl_rv_dm__mem_o = tl_sm1rv_dm19_ds_h2d;
  assign tl_sm1rv_dm19_ds_d2h = tl_rv_dm__mem_i;

  assign tl_sram_ctrl_main__ram_o = tl_sm1sram_ctrl_main20_ds_h2d;
  assign tl_sm1sram_ctrl_main20_ds_d2h = tl_sram_ctrl_main__ram_i;

  assign tl_extr__dev_o = tl_sm1extr21_ds_h2d;
  assign tl_sm1extr21_ds_d2h = tl_extr__dev_i;

  assign tl_rv_core_ibex1n22_us_h2d = tl_rv_core_ibex__cored_i;
  assign tl_rv_core_ibex__cored_o = tl_rv_core_ibex1n22_us_d2h;

  assign tl_rv_dm__regs_o = tl_sm1rv_dm23_ds_h2d;
  assign tl_sm1rv_dm23_ds_d2h = tl_rv_dm__regs_i;

  assign tl_peri_o = tl_asf24_ds_h2d;
  assign tl_asf24_ds_d2h = tl_peri_i;

  assign tl_asf24_us_h2d = tl_sm1asf25_ds_h2d;
  assign tl_sm1asf25_ds_d2h = tl_asf24_us_d2h;

  assign tl_rv_plic_o = tl_sm1rv_plic26_ds_h2d;
  assign tl_sm1rv_plic26_ds_d2h = tl_rv_plic_i;

  assign tl_otbn_o = tl_sm1otbn27_ds_h2d;
  assign tl_sm1otbn27_ds_d2h = tl_otbn_i;

  assign tl_sram_ctrl_main__regs_o = tl_sm1sram_ctrl_main28_ds_h2d;
  assign tl_sm1sram_ctrl_main28_ds_d2h = tl_sram_ctrl_main__regs_i;

  assign tl_rv_core_ibex__cfg_o = tl_sm1rv_core_ibex29_ds_h2d;
  assign tl_sm1rv_core_ibex29_ds_d2h = tl_rv_core_ibex__cfg_i;

  assign tl_sram_ctrl_mbox__ram_o = tl_sm1sram_ctrl_mbox30_ds_h2d;
  assign tl_sm1sram_ctrl_mbox30_ds_d2h = tl_sram_ctrl_mbox__ram_i;

  assign tl_sram_ctrl_mbox__regs_o = tl_sm1sram_ctrl_mbox31_ds_h2d;
  assign tl_sm1sram_ctrl_mbox31_ds_d2h = tl_sram_ctrl_mbox__regs_i;

  assign tl_rv_dm1n32_us_h2d = tl_rv_dm__sba_i;
  assign tl_rv_dm__sba_o = tl_rv_dm1n32_us_d2h;

  assign tl_dma1n33_us_h2d = tl_dma__hst_i;
  assign tl_dma__hst_o = tl_dma1n33_us_d2h;

  //
  // Steering ReQ from rv_core_ibex(host) through rv_core_ibex1n18(socket_1n)
  //
  always_comb begin

    // default steering: error out the invalid address
    dev_sel_rv_core_ibex1n18 = 2'd3;

    if ((tl_rv_core_ibex1n18_us_h2d.a_address &
         ~(ADDR_MASK_RV_DM__MEM)) == ADDR_SPACE_RV_DM__MEM) begin
      dev_sel_rv_core_ibex1n18 = 2'd0;  // rv_core_ibex --> rv_dm.mem

    end else if ((tl_rv_core_ibex1n18_us_h2d.a_address &
                  ~(ADDR_MASK_SRAM_CTRL_MAIN__RAM)) == ADDR_SPACE_SRAM_CTRL_MAIN__RAM) begin
      dev_sel_rv_core_ibex1n18 = 2'd1;  // rv_core_ibex --> sram_ctrl_main.ram

    end else if (((tl_rv_core_ibex1n18_us_h2d.a_address <= (ADDR_MASK_EXTR__DEV + ADDR_SPACE_EXTR__DEV)) &&
       (tl_rv_core_ibex1n18_us_h2d.a_address >= ADDR_SPACE_EXTR__DEV))) begin
      dev_sel_rv_core_ibex1n18 = 2'd2;  // rv_core_ibex --> extr.dev
end
  end

  //
  // Steering ReQ from rv_core_ibex(host) through rv_core_ibex1n22(socket_1n)
  //
  always_comb begin

    // default steering: error out the invalid address
    dev_sel_rv_core_ibex1n22 = 4'd13;

    if ((tl_rv_core_ibex1n22_us_h2d.a_address &
         ~(ADDR_MASK_RV_DM__MEM)) == ADDR_SPACE_RV_DM__MEM) begin
      dev_sel_rv_core_ibex1n22 = 4'd0;  // rv_core_ibex --> rv_dm.mem

    end else if ((tl_rv_core_ibex1n22_us_h2d.a_address &
                  ~(ADDR_MASK_RV_DM__REGS)) == ADDR_SPACE_RV_DM__REGS) begin
      dev_sel_rv_core_ibex1n22 = 4'd1;  // rv_core_ibex --> rv_dm.regs

    end else if ((tl_rv_core_ibex1n22_us_h2d.a_address &
                  ~(ADDR_MASK_SRAM_CTRL_MAIN__RAM)) == ADDR_SPACE_SRAM_CTRL_MAIN__RAM) begin
      dev_sel_rv_core_ibex1n22 = 4'd2;  // rv_core_ibex --> sram_ctrl_main.ram

    end else if ((tl_rv_core_ibex1n22_us_h2d.a_address &
                  ~(ADDR_MASK_PERI)) == ADDR_SPACE_PERI) begin
      dev_sel_rv_core_ibex1n22 = 4'd3;  // rv_core_ibex --> peri

    end else if ((tl_rv_core_ibex1n22_us_h2d.a_address &
                  ~(ADDR_MASK_RV_PLIC)) == ADDR_SPACE_RV_PLIC) begin
      dev_sel_rv_core_ibex1n22 = 4'd4;  // rv_core_ibex --> rv_plic

    end else if ((tl_rv_core_ibex1n22_us_h2d.a_address &
                  ~(ADDR_MASK_OTBN)) == ADDR_SPACE_OTBN) begin
      dev_sel_rv_core_ibex1n22 = 4'd5;  // rv_core_ibex --> otbn

    end else if ((tl_rv_core_ibex1n22_us_h2d.a_address &
                  ~(ADDR_MASK_SRAM_CTRL_MAIN__REGS)) == ADDR_SPACE_SRAM_CTRL_MAIN__REGS) begin
      dev_sel_rv_core_ibex1n22 = 4'd6;  // rv_core_ibex --> sram_ctrl_main.regs

    end else if ((tl_rv_core_ibex1n22_us_h2d.a_address &
                  ~(ADDR_MASK_RV_CORE_IBEX__CFG)) == ADDR_SPACE_RV_CORE_IBEX__CFG) begin
      dev_sel_rv_core_ibex1n22 = 4'd7;  // rv_core_ibex --> rv_core_ibex.cfg

    end else if ((tl_rv_core_ibex1n22_us_h2d.a_address &
                  ~(ADDR_MASK_SRAM_CTRL_MBOX__RAM)) == ADDR_SPACE_SRAM_CTRL_MBOX__RAM) begin
      dev_sel_rv_core_ibex1n22 = 4'd8;  // rv_core_ibex --> sram_ctrl_mbox.ram

    end else if ((tl_rv_core_ibex1n22_us_h2d.a_address &
                  ~(ADDR_MASK_SRAM_CTRL_MBOX__REGS)) == ADDR_SPACE_SRAM_CTRL_MBOX__REGS) begin
      dev_sel_rv_core_ibex1n22 = 4'd9;  // rv_core_ibex --> sram_ctrl_mbox.regs

    end else if ((tl_rv_core_ibex1n22_us_h2d.a_address &
                  ~(ADDR_MASK_MBX__DEV)) == ADDR_SPACE_MBX__DEV) begin
      dev_sel_rv_core_ibex1n22 = 4'd10;  // rv_core_ibex --> mbx.dev

    end else if ((tl_rv_core_ibex1n22_us_h2d.a_address &
                  ~(ADDR_MASK_DMA__DEV)) == ADDR_SPACE_DMA__DEV) begin
      dev_sel_rv_core_ibex1n22 = 4'd11;  // rv_core_ibex --> dma.dev

    end else if (((tl_rv_core_ibex1n22_us_h2d.a_address <= (ADDR_MASK_EXTR__DEV + ADDR_SPACE_EXTR__DEV)) &&
       (tl_rv_core_ibex1n22_us_h2d.a_address >= ADDR_SPACE_EXTR__DEV))) begin
      dev_sel_rv_core_ibex1n22 = 4'd12;  // rv_core_ibex --> extr.dev
end
  end

  //
  // Steering ReQ from rv_dm(host) through rv_dm1n32(socket_1n)
  //
  always_comb begin

    // default steering: error out the invalid address
    dev_sel_rv_dm1n32 = 4'd10;

    if ((tl_rv_dm1n32_us_h2d.a_address &
         ~(ADDR_MASK_RV_DM__MEM)) == ADDR_SPACE_RV_DM__MEM) begin
      dev_sel_rv_dm1n32 = 4'd0;  // rv_dm --> rv_dm.mem

    end else if ((tl_rv_dm1n32_us_h2d.a_address &
                  ~(ADDR_MASK_RV_DM__REGS)) == ADDR_SPACE_RV_DM__REGS) begin
      dev_sel_rv_dm1n32 = 4'd1;  // rv_dm --> rv_dm.regs

    end else if ((tl_rv_dm1n32_us_h2d.a_address &
                  ~(ADDR_MASK_SRAM_CTRL_MAIN__RAM)) == ADDR_SPACE_SRAM_CTRL_MAIN__RAM) begin
      dev_sel_rv_dm1n32 = 4'd2;  // rv_dm --> sram_ctrl_main.ram

    end else if ((tl_rv_dm1n32_us_h2d.a_address &
                  ~(ADDR_MASK_PERI)) == ADDR_SPACE_PERI) begin
      dev_sel_rv_dm1n32 = 4'd3;  // rv_dm --> peri

    end else if ((tl_rv_dm1n32_us_h2d.a_address &
                  ~(ADDR_MASK_RV_PLIC)) == ADDR_SPACE_RV_PLIC) begin
      dev_sel_rv_dm1n32 = 4'd4;  // rv_dm --> rv_plic

    end else if ((tl_rv_dm1n32_us_h2d.a_address &
                  ~(ADDR_MASK_OTBN)) == ADDR_SPACE_OTBN) begin
      dev_sel_rv_dm1n32 = 4'd5;  // rv_dm --> otbn

    end else if ((tl_rv_dm1n32_us_h2d.a_address &
                  ~(ADDR_MASK_SRAM_CTRL_MAIN__REGS)) == ADDR_SPACE_SRAM_CTRL_MAIN__REGS) begin
      dev_sel_rv_dm1n32 = 4'd6;  // rv_dm --> sram_ctrl_main.regs

    end else if ((tl_rv_dm1n32_us_h2d.a_address &
                  ~(ADDR_MASK_RV_CORE_IBEX__CFG)) == ADDR_SPACE_RV_CORE_IBEX__CFG) begin
      dev_sel_rv_dm1n32 = 4'd7;  // rv_dm --> rv_core_ibex.cfg

    end else if ((tl_rv_dm1n32_us_h2d.a_address &
                  ~(ADDR_MASK_SRAM_CTRL_MBOX__RAM)) == ADDR_SPACE_SRAM_CTRL_MBOX__RAM) begin
      dev_sel_rv_dm1n32 = 4'd8;  // rv_dm --> sram_ctrl_mbox.ram

    end else if ((tl_rv_dm1n32_us_h2d.a_address &
                  ~(ADDR_MASK_SRAM_CTRL_MBOX__REGS)) == ADDR_SPACE_SRAM_CTRL_MBOX__REGS) begin
      dev_sel_rv_dm1n32 = 4'd9;  // rv_dm --> sram_ctrl_mbox.regs
end
  end

  //
  // Steering ReQ from dma(host) through dma1n33(socket_1n)
  //
  always_comb begin

    // default steering: error out the invalid address
    dev_sel_dma1n33 = 2'd2;

    if ((tl_dma1n33_us_h2d.a_address &
         ~(ADDR_MASK_SRAM_CTRL_MAIN__RAM)) == ADDR_SPACE_SRAM_CTRL_MAIN__RAM) begin
      dev_sel_dma1n33 = 2'd0;  // dma --> sram_ctrl_main.ram

    end else if (((tl_dma1n33_us_h2d.a_address <= (ADDR_MASK_EXTR__DEV + ADDR_SPACE_EXTR__DEV)) &&
       (tl_dma1n33_us_h2d.a_address >= ADDR_SPACE_EXTR__DEV))) begin
      dev_sel_dma1n33 = 2'd1;  // dma --> extr.dev
end
  end


  // Instantiation phase
  tlul_socket_1n #(
    .N         (3),
    .HReqPass  (1'b1),
    .HRspPass  (1'b1),
    .HReqDepth (4'h0),
    .HRspDepth (4'h0),
    .DReqPass  (3'h7),
    .DRspPass  (3'h7),
    .DReqDepth (12'h0),
    .DRspDepth (12'h0)
  ) u_rv_core_ibex1n18 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_rv_core_ibex1n18_us_h2d),
    .tl_h_o       (tl_rv_core_ibex1n18_us_d2h),
    .tl_d_o       (tl_rv_core_ibex1n18_ds_h2d),
    .tl_d_i       (tl_rv_core_ibex1n18_ds_d2h),
    .dev_select_i (dev_sel_rv_core_ibex1n18)
  );
  tlul_socket_m1 #(
    .M         (3),
    .HReqPass  (3'h7),
    .HRspPass  (3'h7),
    .HReqDepth (12'h0),
    .HRspDepth (12'h0),
    .DReqPass  (1'b0),
    .DRspPass  (1'b0),
    .DReqDepth (4'h1),
    .DRspDepth (4'h1)
  ) u_sm1rv_dm19 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1rv_dm19_us_h2d),
    .tl_h_o       (tl_sm1rv_dm19_us_d2h),
    .tl_d_o       (tl_sm1rv_dm19_ds_h2d),
    .tl_d_i       (tl_sm1rv_dm19_ds_d2h)
  );
  tlul_socket_m1 #(
    .M         (4),
    .HReqPass  (4'hf),
    .HRspPass  (4'hf),
    .HReqDepth (16'h0),
    .HRspDepth (16'h0),
    .DReqPass  (1'b1),
    .DRspPass  (1'b1),
    .DReqDepth (4'h0),
    .DRspDepth (4'h0)
  ) u_sm1sram_ctrl_main20 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1sram_ctrl_main20_us_h2d),
    .tl_h_o       (tl_sm1sram_ctrl_main20_us_d2h),
    .tl_d_o       (tl_sm1sram_ctrl_main20_ds_h2d),
    .tl_d_i       (tl_sm1sram_ctrl_main20_ds_d2h)
  );
  tlul_socket_m1 #(
    .M         (3),
    .HReqPass  (3'h7),
    .HRspPass  (3'h7),
    .HReqDepth (12'h0),
    .HRspDepth (12'h0),
    .DReqPass  (1'b1),
    .DRspPass  (1'b1),
    .DReqDepth (4'h0),
    .DRspDepth (4'h0)
  ) u_sm1extr21 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1extr21_us_h2d),
    .tl_h_o       (tl_sm1extr21_us_d2h),
    .tl_d_o       (tl_sm1extr21_ds_h2d),
    .tl_d_i       (tl_sm1extr21_ds_d2h)
  );
  tlul_socket_1n #(
    .N         (13),
    .HReqPass  (1'b1),
    .HRspPass  (1'b1),
    .HReqDepth (4'h0),
    .HRspDepth (4'h0),
    .DReqPass  (13'h1fff),
    .DRspPass  (13'h1fff),
    .DReqDepth (52'h0),
    .DRspDepth (52'h0)
  ) u_rv_core_ibex1n22 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_rv_core_ibex1n22_us_h2d),
    .tl_h_o       (tl_rv_core_ibex1n22_us_d2h),
    .tl_d_o       (tl_rv_core_ibex1n22_ds_h2d),
    .tl_d_i       (tl_rv_core_ibex1n22_ds_d2h),
    .dev_select_i (dev_sel_rv_core_ibex1n22)
  );
  tlul_socket_m1 #(
    .M         (2),
    .HReqPass  (2'h3),
    .HRspPass  (2'h3),
    .HReqDepth (8'h0),
    .HRspDepth (8'h0),
    .DReqPass  (1'b0),
    .DRspPass  (1'b0),
    .DReqDepth (4'h1),
    .DRspDepth (4'h1)
  ) u_sm1rv_dm23 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1rv_dm23_us_h2d),
    .tl_h_o       (tl_sm1rv_dm23_us_d2h),
    .tl_d_o       (tl_sm1rv_dm23_ds_h2d),
    .tl_d_i       (tl_sm1rv_dm23_ds_d2h)
  );
  tlul_fifo_async #(
    .ReqDepth        (1),
    .RspDepth        (1)
  ) u_asf24 (
    .clk_h_i      (clk_main_i),
    .rst_h_ni     (rst_main_ni),
    .clk_d_i      (clk_fixed_i),
    .rst_d_ni     (rst_fixed_ni),
    .tl_h_i       (tl_asf24_us_h2d),
    .tl_h_o       (tl_asf24_us_d2h),
    .tl_d_o       (tl_asf24_ds_h2d),
    .tl_d_i       (tl_asf24_ds_d2h)
  );
  tlul_socket_m1 #(
    .M         (2),
    .HReqPass  (2'h3),
    .HRspPass  (2'h3),
    .HReqDepth (8'h0),
    .HRspDepth (8'h0),
    .DReqPass  (1'b1),
    .DRspPass  (1'b1),
    .DReqDepth (4'h0),
    .DRspDepth (4'h0)
  ) u_sm1asf25 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1asf25_us_h2d),
    .tl_h_o       (tl_sm1asf25_us_d2h),
    .tl_d_o       (tl_sm1asf25_ds_h2d),
    .tl_d_i       (tl_sm1asf25_ds_d2h)
  );
  tlul_socket_m1 #(
    .M         (2),
    .HReqPass  (2'h3),
    .HRspPass  (2'h3),
    .HReqDepth (8'h0),
    .HRspDepth (8'h0),
    .DReqPass  (1'b0),
    .DRspPass  (1'b0),
    .DReqDepth (4'h1),
    .DRspDepth (4'h1)
  ) u_sm1rv_plic26 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1rv_plic26_us_h2d),
    .tl_h_o       (tl_sm1rv_plic26_us_d2h),
    .tl_d_o       (tl_sm1rv_plic26_ds_h2d),
    .tl_d_i       (tl_sm1rv_plic26_ds_d2h)
  );
  tlul_socket_m1 #(
    .M         (2),
    .HReqPass  (2'h3),
    .HRspPass  (2'h3),
    .HReqDepth (8'h0),
    .HRspDepth (8'h0),
    .DReqPass  (1'b0),
    .DRspPass  (1'b0),
    .DReqDepth (4'h1),
    .DRspDepth (4'h1)
  ) u_sm1otbn27 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1otbn27_us_h2d),
    .tl_h_o       (tl_sm1otbn27_us_d2h),
    .tl_d_o       (tl_sm1otbn27_ds_h2d),
    .tl_d_i       (tl_sm1otbn27_ds_d2h)
  );
  tlul_socket_m1 #(
    .M         (2),
    .HReqPass  (2'h3),
    .HRspPass  (2'h3),
    .HReqDepth (8'h0),
    .HRspDepth (8'h0),
    .DReqPass  (1'b0),
    .DRspPass  (1'b0),
    .DReqDepth (4'h1),
    .DRspDepth (4'h1)
  ) u_sm1sram_ctrl_main28 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1sram_ctrl_main28_us_h2d),
    .tl_h_o       (tl_sm1sram_ctrl_main28_us_d2h),
    .tl_d_o       (tl_sm1sram_ctrl_main28_ds_h2d),
    .tl_d_i       (tl_sm1sram_ctrl_main28_ds_d2h)
  );
  tlul_socket_m1 #(
    .M         (2),
    .HReqPass  (2'h3),
    .HRspPass  (2'h3),
    .HReqDepth (8'h0),
    .HRspDepth (8'h0),
    .DReqPass  (1'b0),
    .DRspPass  (1'b0),
    .DReqDepth (4'h1),
    .DRspDepth (4'h1)
  ) u_sm1rv_core_ibex29 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1rv_core_ibex29_us_h2d),
    .tl_h_o       (tl_sm1rv_core_ibex29_us_d2h),
    .tl_d_o       (tl_sm1rv_core_ibex29_ds_h2d),
    .tl_d_i       (tl_sm1rv_core_ibex29_ds_d2h)
  );
  tlul_socket_m1 #(
    .M         (3),
    .HReqPass  (3'h7),
    .HRspPass  (3'h7),
    .HReqDepth (12'h0),
    .HRspDepth (12'h0),
    .DReqPass  (1'b1),
    .DRspPass  (1'b1),
    .DReqDepth (4'h0),
    .DRspDepth (4'h0)
  ) u_sm1sram_ctrl_mbox30 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1sram_ctrl_mbox30_us_h2d),
    .tl_h_o       (tl_sm1sram_ctrl_mbox30_us_d2h),
    .tl_d_o       (tl_sm1sram_ctrl_mbox30_ds_h2d),
    .tl_d_i       (tl_sm1sram_ctrl_mbox30_ds_d2h)
  );
  tlul_socket_m1 #(
    .M         (2),
    .HReqPass  (2'h3),
    .HRspPass  (2'h3),
    .HReqDepth (8'h0),
    .HRspDepth (8'h0),
    .DReqPass  (1'b1),
    .DRspPass  (1'b1),
    .DReqDepth (4'h0),
    .DRspDepth (4'h0)
  ) u_sm1sram_ctrl_mbox31 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_sm1sram_ctrl_mbox31_us_h2d),
    .tl_h_o       (tl_sm1sram_ctrl_mbox31_us_d2h),
    .tl_d_o       (tl_sm1sram_ctrl_mbox31_ds_h2d),
    .tl_d_i       (tl_sm1sram_ctrl_mbox31_ds_d2h)
  );
  tlul_socket_1n #(
    .N         (10),
    .HReqPass  (1'b0),
    .HRspPass  (1'b0),
    .HReqDepth (4'h1),
    .HRspDepth (4'h1),
    .DReqPass  (10'h3ff),
    .DRspPass  (10'h3ff),
    .DReqDepth (40'h0),
    .DRspDepth (40'h0)
  ) u_rv_dm1n32 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_rv_dm1n32_us_h2d),
    .tl_h_o       (tl_rv_dm1n32_us_d2h),
    .tl_d_o       (tl_rv_dm1n32_ds_h2d),
    .tl_d_i       (tl_rv_dm1n32_ds_d2h),
    .dev_select_i (dev_sel_rv_dm1n32)
  );
  tlul_socket_1n #(
    .N         (2),
    .HReqPass  (1'b1),
    .HRspPass  (1'b1),
    .HReqDepth (4'h0),
    .HRspDepth (4'h0),
    .DReqPass  (2'h3),
    .DRspPass  (2'h3),
    .DReqDepth (8'h0),
    .DRspDepth (8'h0)
  ) u_dma1n33 (
    .clk_i        (clk_main_i),
    .rst_ni       (rst_main_ni),
    .tl_h_i       (tl_dma1n33_us_h2d),
    .tl_h_o       (tl_dma1n33_us_d2h),
    .tl_d_o       (tl_dma1n33_ds_h2d),
    .tl_d_i       (tl_dma1n33_ds_d2h),
    .dev_select_i (dev_sel_dma1n33)
  );

endmodule
// Local Variables:
// fill-column:1
// verilog-auto-arg-sort:t
// verilog-typedef-regexp: "_[etu]$"
// End:
