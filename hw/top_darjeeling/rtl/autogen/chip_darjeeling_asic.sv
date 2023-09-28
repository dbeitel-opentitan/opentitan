// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// ------------------- W A R N I N G: A U T O - G E N E R A T E D   C O D E !! -------------------//
// PLEASE DO NOT HAND-EDIT THIS FILE. IT HAS BEEN AUTO-GENERATED WITH THE FOLLOWING COMMAND:
//
// util/topgen.py -t hw/top_darjeeling/data/top_darjeeling.hjson \
//                -o hw/top_darjeeling/ \
//                --rnd_cnst_seed \
//                1017106219537032642877583828875051302543807092889754935647094601236425074047


module chip_darjeeling_asic #(
  parameter bit SecRomCtrl0DisableScrambling = 1'b0,
  parameter bit SecRomCtrl1DisableScrambling = 1'b0
) (
  // Dedicated Pads
  inout POR_N, // Manual Pad
  inout OTP_EXT_VOLT, // Manual Pad
  inout SPI_HOST_D0, // Dedicated Pad for spi_host0_sd
  inout SPI_HOST_D1, // Dedicated Pad for spi_host0_sd
  inout SPI_HOST_D2, // Dedicated Pad for spi_host0_sd
  inout SPI_HOST_D3, // Dedicated Pad for spi_host0_sd
  inout SPI_HOST_CLK, // Dedicated Pad for spi_host0_sck
  inout SPI_HOST_CS_L, // Dedicated Pad for spi_host0_csb
  inout SPI_DEV_D0, // Dedicated Pad for spi_device_sd
  inout SPI_DEV_D1, // Dedicated Pad for spi_device_sd
  inout SPI_DEV_D2, // Dedicated Pad for spi_device_sd
  inout SPI_DEV_D3, // Dedicated Pad for spi_device_sd
  inout SPI_DEV_CLK, // Dedicated Pad for spi_device_sck
  inout SPI_DEV_CS_L, // Dedicated Pad for spi_device_csb
  inout AST_MISC, // Manual Pad

  // Muxed Pads
  inout IOA0, // MIO Pad 0
  inout IOA1, // MIO Pad 1
  `INOUT_AO IOA2, // MIO Pad 2
  `INOUT_AO IOA3, // MIO Pad 3
  inout IOA4, // MIO Pad 4
  inout IOA5, // MIO Pad 5
  inout IOA6, // MIO Pad 6
  inout IOA7, // MIO Pad 7
  inout IOA8, // MIO Pad 8
  inout IOB0, // MIO Pad 9
  inout IOB1, // MIO Pad 10
  inout IOB2, // MIO Pad 11
  inout IOB3, // MIO Pad 12
  inout IOB4, // MIO Pad 13
  inout IOB5, // MIO Pad 14
  inout IOB6, // MIO Pad 15
  inout IOB7, // MIO Pad 16
  inout IOB8, // MIO Pad 17
  inout IOB9, // MIO Pad 18
  inout IOB10, // MIO Pad 19
  inout IOB11, // MIO Pad 20
  inout IOB12, // MIO Pad 21
  inout IOC0, // MIO Pad 22
  inout IOC1, // MIO Pad 23
  inout IOC2, // MIO Pad 24
  inout IOC3, // MIO Pad 25
  inout IOC4, // MIO Pad 26
  inout IOC5, // MIO Pad 27
  inout IOC6, // MIO Pad 28
  inout IOC7, // MIO Pad 29
  inout IOC8, // MIO Pad 30
  inout IOC9, // MIO Pad 31
  inout IOC10, // MIO Pad 32
  inout IOC11, // MIO Pad 33
  inout IOC12, // MIO Pad 34
  inout IOR0, // MIO Pad 35
  inout IOR1, // MIO Pad 36
  inout IOR2, // MIO Pad 37
  inout IOR3, // MIO Pad 38
  inout IOR4, // MIO Pad 39
  inout IOR5, // MIO Pad 40
  inout IOR6, // MIO Pad 41
  inout IOR7, // MIO Pad 42
  inout IOR10, // MIO Pad 43
  inout IOR11, // MIO Pad 44
  inout IOR12, // MIO Pad 45
  inout IOR13  // MIO Pad 46
);

  import top_darjeeling_pkg::*;
  import prim_pad_wrapper_pkg::*;

  ////////////////////////////
  // Special Signal Indices //
  ////////////////////////////

  localparam int Tap0PadIdx = 30;
  localparam int Tap1PadIdx = 27;
  localparam int Dft0PadIdx = 25;
  localparam int Dft1PadIdx = 26;
  localparam int TckPadIdx = 38;
  localparam int TmsPadIdx = 35;
  localparam int TrstNPadIdx = 39;
  localparam int TdiPadIdx = 37;
  localparam int TdoPadIdx = 36;

  // DFT and Debug signal positions in the pinout.
  localparam pinmux_pkg::target_cfg_t PinmuxTargetCfg = '{
    tck_idx:           TckPadIdx,
    tms_idx:           TmsPadIdx,
    trst_idx:          TrstNPadIdx,
    tdi_idx:           TdiPadIdx,
    tdo_idx:           TdoPadIdx,
    tap_strap0_idx:    Tap0PadIdx,
    tap_strap1_idx:    Tap1PadIdx,
    dft_strap0_idx:    Dft0PadIdx,
    dft_strap1_idx:    Dft1PadIdx,
    // TODO: check whether there is a better way to pass these USB-specific params
    // The use of these indexes is gated behind a parameter, but to synthesize they
    // need to exist even if the code-path is never used (pinmux.sv:UsbWkupModuleEn).
    // Hence, set to zero.
    usb_dp_idx:        0,
    usb_dn_idx:        0,
    usb_sense_idx:     0,
    // Pad types for attribute WARL behavior
    dio_pad_type: {
      BidirStd, // DIO spi_host0_csb
      BidirStd, // DIO spi_host0_sck
      InputStd, // DIO spi_device_csb
      InputStd, // DIO spi_device_sck
      BidirStd, // DIO spi_device_sd
      BidirStd, // DIO spi_device_sd
      BidirStd, // DIO spi_device_sd
      BidirStd, // DIO spi_device_sd
      BidirStd, // DIO spi_host0_sd
      BidirStd, // DIO spi_host0_sd
      BidirStd, // DIO spi_host0_sd
      BidirStd  // DIO spi_host0_sd
    },
    mio_pad_type: {
      BidirOd, // MIO Pad 46
      BidirOd, // MIO Pad 45
      BidirOd, // MIO Pad 44
      BidirOd, // MIO Pad 43
      BidirStd, // MIO Pad 42
      BidirStd, // MIO Pad 41
      BidirStd, // MIO Pad 40
      BidirStd, // MIO Pad 39
      BidirStd, // MIO Pad 38
      BidirStd, // MIO Pad 37
      BidirStd, // MIO Pad 36
      BidirStd, // MIO Pad 35
      BidirOd, // MIO Pad 34
      BidirOd, // MIO Pad 33
      BidirOd, // MIO Pad 32
      BidirStd, // MIO Pad 31
      BidirStd, // MIO Pad 30
      BidirStd, // MIO Pad 29
      BidirStd, // MIO Pad 28
      BidirStd, // MIO Pad 27
      BidirStd, // MIO Pad 26
      BidirStd, // MIO Pad 25
      BidirStd, // MIO Pad 24
      BidirStd, // MIO Pad 23
      BidirStd, // MIO Pad 22
      BidirOd, // MIO Pad 21
      BidirOd, // MIO Pad 20
      BidirOd, // MIO Pad 19
      BidirOd, // MIO Pad 18
      BidirStd, // MIO Pad 17
      BidirStd, // MIO Pad 16
      BidirStd, // MIO Pad 15
      BidirStd, // MIO Pad 14
      BidirStd, // MIO Pad 13
      BidirStd, // MIO Pad 12
      BidirStd, // MIO Pad 11
      BidirStd, // MIO Pad 10
      BidirStd, // MIO Pad 9
      BidirOd, // MIO Pad 8
      BidirOd, // MIO Pad 7
      BidirOd, // MIO Pad 6
      BidirStd, // MIO Pad 5
      BidirStd, // MIO Pad 4
      BidirStd, // MIO Pad 3
      BidirStd, // MIO Pad 2
      BidirStd, // MIO Pad 1
      BidirStd  // MIO Pad 0
    }
  };

  ////////////////////////
  // Signal definitions //
  ////////////////////////


  pad_attr_t [pinmux_reg_pkg::NMioPads-1:0] mio_attr;
  pad_attr_t [pinmux_reg_pkg::NDioPads-1:0] dio_attr;
  logic [pinmux_reg_pkg::NMioPads-1:0] mio_out;
  logic [pinmux_reg_pkg::NMioPads-1:0] mio_oe;
  logic [pinmux_reg_pkg::NMioPads-1:0] mio_in;
  logic [pinmux_reg_pkg::NMioPads-1:0] mio_in_raw;
  logic [19-1:0]                       dio_in_raw;
  logic [pinmux_reg_pkg::NDioPads-1:0] dio_out;
  logic [pinmux_reg_pkg::NDioPads-1:0] dio_oe;
  logic [pinmux_reg_pkg::NDioPads-1:0] dio_in;

  logic unused_mio_in_raw;
  logic unused_dio_in_raw;
  assign unused_mio_in_raw = ^mio_in_raw;
  assign unused_dio_in_raw = ^dio_in_raw;

  // Manual pads
  logic manual_in_por_n, manual_out_por_n, manual_oe_por_n;
  logic manual_in_otp_ext_volt, manual_out_otp_ext_volt, manual_oe_otp_ext_volt;
  logic manual_in_ast_misc, manual_out_ast_misc, manual_oe_ast_misc;

  pad_attr_t manual_attr_por_n;
  pad_attr_t manual_attr_otp_ext_volt;
  pad_attr_t manual_attr_ast_misc;


  //////////////////////
  // Padring Instance //
  //////////////////////

  ast_pkg::ast_clks_t ast_base_clks;

  // AST signals needed in padring
  logic scan_rst_n;
   prim_mubi_pkg::mubi4_t scanmode;

  padring #(
    // Padring specific counts may differ from pinmux config due
    // to custom, stubbed or added pads.
    .NDioPads(15),
    .NMioPads(47),
    .PhysicalPads(1),
    .NIoBanks(int'(IoBankCount)),
    .DioScanRole ({
      scan_role_pkg::DioPadAstMiscScanRole,
      scan_role_pkg::DioPadSpiDevCsLScanRole,
      scan_role_pkg::DioPadSpiDevClkScanRole,
      scan_role_pkg::DioPadSpiDevD3ScanRole,
      scan_role_pkg::DioPadSpiDevD2ScanRole,
      scan_role_pkg::DioPadSpiDevD1ScanRole,
      scan_role_pkg::DioPadSpiDevD0ScanRole,
      scan_role_pkg::DioPadSpiHostCsLScanRole,
      scan_role_pkg::DioPadSpiHostClkScanRole,
      scan_role_pkg::DioPadSpiHostD3ScanRole,
      scan_role_pkg::DioPadSpiHostD2ScanRole,
      scan_role_pkg::DioPadSpiHostD1ScanRole,
      scan_role_pkg::DioPadSpiHostD0ScanRole,
      scan_role_pkg::DioPadOtpExtVoltScanRole,
      scan_role_pkg::DioPadPorNScanRole
    }),
    .MioScanRole ({
      scan_role_pkg::MioPadIor13ScanRole,
      scan_role_pkg::MioPadIor12ScanRole,
      scan_role_pkg::MioPadIor11ScanRole,
      scan_role_pkg::MioPadIor10ScanRole,
      scan_role_pkg::MioPadIor7ScanRole,
      scan_role_pkg::MioPadIor6ScanRole,
      scan_role_pkg::MioPadIor5ScanRole,
      scan_role_pkg::MioPadIor4ScanRole,
      scan_role_pkg::MioPadIor3ScanRole,
      scan_role_pkg::MioPadIor2ScanRole,
      scan_role_pkg::MioPadIor1ScanRole,
      scan_role_pkg::MioPadIor0ScanRole,
      scan_role_pkg::MioPadIoc12ScanRole,
      scan_role_pkg::MioPadIoc11ScanRole,
      scan_role_pkg::MioPadIoc10ScanRole,
      scan_role_pkg::MioPadIoc9ScanRole,
      scan_role_pkg::MioPadIoc8ScanRole,
      scan_role_pkg::MioPadIoc7ScanRole,
      scan_role_pkg::MioPadIoc6ScanRole,
      scan_role_pkg::MioPadIoc5ScanRole,
      scan_role_pkg::MioPadIoc4ScanRole,
      scan_role_pkg::MioPadIoc3ScanRole,
      scan_role_pkg::MioPadIoc2ScanRole,
      scan_role_pkg::MioPadIoc1ScanRole,
      scan_role_pkg::MioPadIoc0ScanRole,
      scan_role_pkg::MioPadIob12ScanRole,
      scan_role_pkg::MioPadIob11ScanRole,
      scan_role_pkg::MioPadIob10ScanRole,
      scan_role_pkg::MioPadIob9ScanRole,
      scan_role_pkg::MioPadIob8ScanRole,
      scan_role_pkg::MioPadIob7ScanRole,
      scan_role_pkg::MioPadIob6ScanRole,
      scan_role_pkg::MioPadIob5ScanRole,
      scan_role_pkg::MioPadIob4ScanRole,
      scan_role_pkg::MioPadIob3ScanRole,
      scan_role_pkg::MioPadIob2ScanRole,
      scan_role_pkg::MioPadIob1ScanRole,
      scan_role_pkg::MioPadIob0ScanRole,
      scan_role_pkg::MioPadIoa8ScanRole,
      scan_role_pkg::MioPadIoa7ScanRole,
      scan_role_pkg::MioPadIoa6ScanRole,
      scan_role_pkg::MioPadIoa5ScanRole,
      scan_role_pkg::MioPadIoa4ScanRole,
      scan_role_pkg::MioPadIoa3ScanRole,
      scan_role_pkg::MioPadIoa2ScanRole,
      scan_role_pkg::MioPadIoa1ScanRole,
      scan_role_pkg::MioPadIoa0ScanRole
    }),
    .DioPadBank ({
      IoBankVcc, // AST_MISC
      IoBankVioa, // SPI_DEV_CS_L
      IoBankVioa, // SPI_DEV_CLK
      IoBankVioa, // SPI_DEV_D3
      IoBankVioa, // SPI_DEV_D2
      IoBankVioa, // SPI_DEV_D1
      IoBankVioa, // SPI_DEV_D0
      IoBankVioa, // SPI_HOST_CS_L
      IoBankVioa, // SPI_HOST_CLK
      IoBankVioa, // SPI_HOST_D3
      IoBankVioa, // SPI_HOST_D2
      IoBankVioa, // SPI_HOST_D1
      IoBankVioa, // SPI_HOST_D0
      IoBankVcc, // OTP_EXT_VOLT
      IoBankVcc  // POR_N
    }),
    .MioPadBank ({
      IoBankVcc, // IOR13
      IoBankVcc, // IOR12
      IoBankVcc, // IOR11
      IoBankVcc, // IOR10
      IoBankVcc, // IOR7
      IoBankVcc, // IOR6
      IoBankVcc, // IOR5
      IoBankVcc, // IOR4
      IoBankVcc, // IOR3
      IoBankVcc, // IOR2
      IoBankVcc, // IOR1
      IoBankVcc, // IOR0
      IoBankVcc, // IOC12
      IoBankVcc, // IOC11
      IoBankVcc, // IOC10
      IoBankVcc, // IOC9
      IoBankVcc, // IOC8
      IoBankVcc, // IOC7
      IoBankVcc, // IOC6
      IoBankVcc, // IOC5
      IoBankVcc, // IOC4
      IoBankVcc, // IOC3
      IoBankVcc, // IOC2
      IoBankVcc, // IOC1
      IoBankVcc, // IOC0
      IoBankViob, // IOB12
      IoBankViob, // IOB11
      IoBankViob, // IOB10
      IoBankViob, // IOB9
      IoBankViob, // IOB8
      IoBankViob, // IOB7
      IoBankViob, // IOB6
      IoBankViob, // IOB5
      IoBankViob, // IOB4
      IoBankViob, // IOB3
      IoBankViob, // IOB2
      IoBankViob, // IOB1
      IoBankViob, // IOB0
      IoBankVioa, // IOA8
      IoBankVioa, // IOA7
      IoBankVioa, // IOA6
      IoBankVioa, // IOA5
      IoBankVioa, // IOA4
      IoBankVioa, // IOA3
      IoBankVioa, // IOA2
      IoBankVioa, // IOA1
      IoBankVioa  // IOA0
    }),
    .DioPadType ({
      InputStd, // AST_MISC
      InputStd, // SPI_DEV_CS_L
      InputStd, // SPI_DEV_CLK
      BidirStd, // SPI_DEV_D3
      BidirStd, // SPI_DEV_D2
      BidirStd, // SPI_DEV_D1
      BidirStd, // SPI_DEV_D0
      BidirStd, // SPI_HOST_CS_L
      BidirStd, // SPI_HOST_CLK
      BidirStd, // SPI_HOST_D3
      BidirStd, // SPI_HOST_D2
      BidirStd, // SPI_HOST_D1
      BidirStd, // SPI_HOST_D0
      AnalogIn1, // OTP_EXT_VOLT
      InputStd  // POR_N
    }),
    .MioPadType ({
      BidirOd, // IOR13
      BidirOd, // IOR12
      BidirOd, // IOR11
      BidirOd, // IOR10
      BidirStd, // IOR7
      BidirStd, // IOR6
      BidirStd, // IOR5
      BidirStd, // IOR4
      BidirStd, // IOR3
      BidirStd, // IOR2
      BidirStd, // IOR1
      BidirStd, // IOR0
      BidirOd, // IOC12
      BidirOd, // IOC11
      BidirOd, // IOC10
      BidirStd, // IOC9
      BidirStd, // IOC8
      BidirStd, // IOC7
      BidirStd, // IOC6
      BidirStd, // IOC5
      BidirStd, // IOC4
      BidirStd, // IOC3
      BidirStd, // IOC2
      BidirStd, // IOC1
      BidirStd, // IOC0
      BidirOd, // IOB12
      BidirOd, // IOB11
      BidirOd, // IOB10
      BidirOd, // IOB9
      BidirStd, // IOB8
      BidirStd, // IOB7
      BidirStd, // IOB6
      BidirStd, // IOB5
      BidirStd, // IOB4
      BidirStd, // IOB3
      BidirStd, // IOB2
      BidirStd, // IOB1
      BidirStd, // IOB0
      BidirOd, // IOA8
      BidirOd, // IOA7
      BidirOd, // IOA6
      BidirStd, // IOA5
      BidirStd, // IOA4
      BidirStd, // IOA3
      BidirStd, // IOA2
      BidirStd, // IOA1
      BidirStd  // IOA0
    })
  ) u_padring (
  // This is only used for scan and DFT purposes
    .clk_scan_i   ( ast_base_clks.clk_sys ),
    .scanmode_i   ( scanmode              ),
    .dio_in_raw_o ( dio_in_raw ),
    // Chip IOs
    .dio_pad_io ({
      AST_MISC,
      SPI_DEV_CS_L,
      SPI_DEV_CLK,
      SPI_DEV_D3,
      SPI_DEV_D2,
      SPI_DEV_D1,
      SPI_DEV_D0,
      SPI_HOST_CS_L,
      SPI_HOST_CLK,
      SPI_HOST_D3,
      SPI_HOST_D2,
      SPI_HOST_D1,
      SPI_HOST_D0,
      OTP_EXT_VOLT,
      POR_N
    }),

    .mio_pad_io ({
      IOR13,
      IOR12,
      IOR11,
      IOR10,
      IOR7,
      IOR6,
      IOR5,
      IOR4,
      IOR3,
      IOR2,
      IOR1,
      IOR0,
      IOC12,
      IOC11,
      IOC10,
      IOC9,
      IOC8,
      IOC7,
      IOC6,
      IOC5,
      IOC4,
      IOC3,
      IOC2,
      IOC1,
      IOC0,
      IOB12,
      IOB11,
      IOB10,
      IOB9,
      IOB8,
      IOB7,
      IOB6,
      IOB5,
      IOB4,
      IOB3,
      IOB2,
      IOB1,
      IOB0,
      IOA8,
      IOA7,
      IOA6,
      IOA5,
      IOA4,
`ifdef ANALOGSIM
      '0,
`else
      IOA3,
`endif
`ifdef ANALOGSIM
      '0,
`else
      IOA2,
`endif
      IOA1,
      IOA0
    }),

    // Core-facing
    .dio_in_o ({
        manual_in_ast_misc,
        dio_in[DioSpiDeviceCsb],
        dio_in[DioSpiDeviceSck],
        dio_in[DioSpiDeviceSd3],
        dio_in[DioSpiDeviceSd2],
        dio_in[DioSpiDeviceSd1],
        dio_in[DioSpiDeviceSd0],
        dio_in[DioSpiHost0Csb],
        dio_in[DioSpiHost0Sck],
        dio_in[DioSpiHost0Sd3],
        dio_in[DioSpiHost0Sd2],
        dio_in[DioSpiHost0Sd1],
        dio_in[DioSpiHost0Sd0],
        manual_in_otp_ext_volt,
        manual_in_por_n
      }),
    .dio_out_i ({
        manual_out_ast_misc,
        dio_out[DioSpiDeviceCsb],
        dio_out[DioSpiDeviceSck],
        dio_out[DioSpiDeviceSd3],
        dio_out[DioSpiDeviceSd2],
        dio_out[DioSpiDeviceSd1],
        dio_out[DioSpiDeviceSd0],
        dio_out[DioSpiHost0Csb],
        dio_out[DioSpiHost0Sck],
        dio_out[DioSpiHost0Sd3],
        dio_out[DioSpiHost0Sd2],
        dio_out[DioSpiHost0Sd1],
        dio_out[DioSpiHost0Sd0],
        manual_out_otp_ext_volt,
        manual_out_por_n
      }),
    .dio_oe_i ({
        manual_oe_ast_misc,
        dio_oe[DioSpiDeviceCsb],
        dio_oe[DioSpiDeviceSck],
        dio_oe[DioSpiDeviceSd3],
        dio_oe[DioSpiDeviceSd2],
        dio_oe[DioSpiDeviceSd1],
        dio_oe[DioSpiDeviceSd0],
        dio_oe[DioSpiHost0Csb],
        dio_oe[DioSpiHost0Sck],
        dio_oe[DioSpiHost0Sd3],
        dio_oe[DioSpiHost0Sd2],
        dio_oe[DioSpiHost0Sd1],
        dio_oe[DioSpiHost0Sd0],
        manual_oe_otp_ext_volt,
        manual_oe_por_n
      }),
    .dio_attr_i ({
        manual_attr_ast_misc,
        dio_attr[DioSpiDeviceCsb],
        dio_attr[DioSpiDeviceSck],
        dio_attr[DioSpiDeviceSd3],
        dio_attr[DioSpiDeviceSd2],
        dio_attr[DioSpiDeviceSd1],
        dio_attr[DioSpiDeviceSd0],
        dio_attr[DioSpiHost0Csb],
        dio_attr[DioSpiHost0Sck],
        dio_attr[DioSpiHost0Sd3],
        dio_attr[DioSpiHost0Sd2],
        dio_attr[DioSpiHost0Sd1],
        dio_attr[DioSpiHost0Sd0],
        manual_attr_otp_ext_volt,
        manual_attr_por_n
      }),

    .mio_in_o (mio_in[46:0]),
    .mio_out_i (mio_out[46:0]),
    .mio_oe_i (mio_oe[46:0]),
    .mio_attr_i (mio_attr[46:0]),
    .mio_in_raw_o (mio_in_raw[46:0])
  );





  //////////////////////////////////
  // AST - Common for all targets //
  //////////////////////////////////

  // pwrmgr interface
  pwrmgr_pkg::pwr_ast_req_t base_ast_pwr;
  pwrmgr_pkg::pwr_ast_rsp_t ast_base_pwr;

  // assorted ast status
  ast_pkg::ast_pwst_t ast_pwst;
  ast_pkg::ast_pwst_t ast_pwst_h;

  // TLUL interface
  tlul_pkg::tl_h2d_t base_ast_bus;
  tlul_pkg::tl_d2h_t ast_base_bus;

  // synchronization clocks / rests
  clkmgr_pkg::clkmgr_out_t clkmgr_aon_clocks;
  rstmgr_pkg::rstmgr_out_t rstmgr_aon_resets;

  // external clock
  logic ext_clk;

  // monitored clock
  logic sck_monitor;

  // observe interface
  logic [7:0] fla_obs;
  logic [7:0] otp_obs;
  ast_pkg::ast_obs_ctrl_t obs_ctrl;

  // otp power sequence
  otp_ctrl_pkg::otp_ast_req_t otp_ctrl_otp_ast_pwr_seq;
  otp_ctrl_pkg::otp_ast_rsp_t otp_ctrl_otp_ast_pwr_seq_h;

  logic usb_ref_pulse;
  logic usb_ref_val;

  // adc
  ast_pkg::adc_ast_req_t adc_req;
  ast_pkg::adc_ast_rsp_t adc_rsp;

  // entropy source interface
  // The entropy source pacakge definition should eventually be moved to es
  entropy_src_pkg::entropy_src_hw_if_req_t entropy_src_hw_if_req;
  entropy_src_pkg::entropy_src_hw_if_rsp_t entropy_src_hw_if_rsp;

  // entropy distribution network
  edn_pkg::edn_req_t ast_edn_edn_req;
  edn_pkg::edn_rsp_t ast_edn_edn_rsp;

  // alerts interface
  ast_pkg::ast_alert_rsp_t ast_alert_rsp;
  ast_pkg::ast_alert_req_t ast_alert_req;


  // clock bypass req/ack
  prim_mubi_pkg::mubi4_t io_clk_byp_req;
  prim_mubi_pkg::mubi4_t io_clk_byp_ack;
  prim_mubi_pkg::mubi4_t all_clk_byp_req;
  prim_mubi_pkg::mubi4_t all_clk_byp_ack;
  prim_mubi_pkg::mubi4_t hi_speed_sel;
  prim_mubi_pkg::mubi4_t div_step_down_req;

  // DFT connections
  logic scan_en;
  lc_ctrl_pkg::lc_tx_t lc_dft_en;
  pinmux_pkg::dft_strap_test_req_t dft_strap_test;

  // Debug connections
  logic [ast_pkg::Ast2PadOutWidth-1:0] ast2pinmux;
  logic [ast_pkg::Pad2AstInWidth-1:0] pad2ast;

  // Jitter enable
  prim_mubi_pkg::mubi4_t jen;

  // reset domain connections
  import rstmgr_pkg::PowerDomains;
  import rstmgr_pkg::DomainAonSel;
  import rstmgr_pkg::Domain0Sel;

  // Memory configuration connections
  ast_pkg::spm_rm_t ast_ram_1p_cfg;
  ast_pkg::spm_rm_t ast_rf_cfg;
  ast_pkg::spm_rm_t ast_rom_cfg;
  ast_pkg::dpm_rm_t ast_ram_2p_fcfg;
  ast_pkg::dpm_rm_t ast_ram_2p_lcfg;

  prim_ram_1p_pkg::ram_1p_cfg_t ram_1p_cfg;
  prim_ram_2p_pkg::ram_2p_cfg_t spi_ram_2p_cfg;
  prim_ram_2p_pkg::ram_2p_cfg_t usb_ram_2p_cfg;
  prim_rom_pkg::rom_cfg_t rom_cfg;

  // conversion from ast structure to memory centric structures
  assign ram_1p_cfg = '{
    ram_cfg: '{
                cfg_en: ast_ram_1p_cfg.marg_en,
                cfg:    ast_ram_1p_cfg.marg
              },
    rf_cfg:  '{
                cfg_en: ast_rf_cfg.marg_en,
                cfg:    ast_rf_cfg.marg
              }
  };

  // this maps as follows:
  // assign usb_ram_2p_cfg = {10'h000, ram_2p_cfg_i.a_ram_fcfg, ram_2p_cfg_i.b_ram_fcfg};
  assign usb_ram_2p_cfg = '{
    a_ram_lcfg: '{
                   cfg_en: ast_ram_2p_fcfg.marg_en_a,
                   cfg:    ast_ram_2p_fcfg.marg_a
                 },
    b_ram_lcfg: '{
                   cfg_en: ast_ram_2p_fcfg.marg_en_b,
                   cfg:    ast_ram_2p_fcfg.marg_b
                 },
    default: '0
  };

  // this maps as follows:
  // assign spi_ram_2p_cfg = {10'h000, ram_2p_cfg_i.a_ram_lcfg, ram_2p_cfg_i.b_ram_lcfg};
  assign spi_ram_2p_cfg = '{
    a_ram_lcfg: '{
                   cfg_en: ast_ram_2p_lcfg.marg_en_a,
                   cfg:    ast_ram_2p_lcfg.marg_a
                 },
    b_ram_lcfg: '{
                   cfg_en: ast_ram_2p_lcfg.marg_en_b,
                   cfg:    ast_ram_2p_lcfg.marg_b
                 },
    default: '0
  };

  assign rom_cfg = '{
    cfg_en: ast_rom_cfg.marg_en,
    cfg: ast_rom_cfg.marg
  };


  //////////////////////////////////
  // AST - Custom for targets     //
  //////////////////////////////////


  assign ast_base_pwr.main_pok = ast_pwst.main_pok;

  logic [rstmgr_pkg::PowerDomains-1:0] por_n;
  assign por_n = {ast_pwst.main_pok, ast_pwst.aon_pok};


  logic [ast_pkg::UsbCalibWidth-1:0] usb_io_pu_cal;

  // external clock comes in at a fixed position
  assign ext_clk = mio_in_raw[MioPadIoc6];

  assign pad2ast = `PAD2AST_WIRES ;

  // AST does not use all clocks / resets forwarded to it
  logic unused_slow_clk_en;
  assign unused_slow_clk_en = base_ast_pwr.slow_clk_en;

  logic unused_pwr_clamp;
  assign unused_pwr_clamp = base_ast_pwr.pwr_clamp;

  logic usb_diff_rx_obs;


  prim_mubi_pkg::mubi4_t ast_init_done;

  ast #(
    .EntropyStreams(ast_pkg::EntropyStreams),
    .AdcChannels(ast_pkg::AdcChannels),
    .AdcDataWidth(ast_pkg::AdcDataWidth),
    .UsbCalibWidth(ast_pkg::UsbCalibWidth),
    .Ast2PadOutWidth(ast_pkg::Ast2PadOutWidth),
    .Pad2AstInWidth(ast_pkg::Pad2AstInWidth)
  ) u_ast (
    // external POR
    .por_ni                ( manual_in_por_n ),

    // USB IO Pull-up Calibration Setting
    .usb_io_pu_cal_o       ( usb_io_pu_cal ),

    // adc
    .adc_a0_ai             ( '0 ),
    .adc_a1_ai             ( '0 ),

    // Direct short to PAD
    .ast2pad_t0_ao         ( IOA2 ),
    .ast2pad_t1_ao         ( IOA3 ),
    // clocks and resets supplied for detection
    .sns_clks_i            ( clkmgr_aon_clocks    ),
    .sns_rsts_i            ( rstmgr_aon_resets    ),
    .sns_spi_ext_clk_i     ( sck_monitor          ),
    // tlul
    .tl_i                  ( base_ast_bus ),
    .tl_o                  ( ast_base_bus ),
    // init done indication
    .ast_init_done_o       ( ast_init_done ),
    // buffered clocks & resets
    .clk_ast_tlul_i (clkmgr_aon_clocks.clk_io_div4_infra),
    .clk_ast_adc_i (clkmgr_aon_clocks.clk_aon_peri),
    .clk_ast_alert_i (clkmgr_aon_clocks.clk_io_div4_secure),
    .clk_ast_es_i (clkmgr_aon_clocks.clk_main_secure),
    .clk_ast_rng_i (clkmgr_aon_clocks.clk_main_secure),
    .clk_ast_usb_i (clkmgr_aon_clocks.clk_usb_peri),
    .rst_ast_tlul_ni (rstmgr_aon_resets.rst_lc_io_div4_n[rstmgr_pkg::Domain0Sel]),
    .rst_ast_adc_ni (rstmgr_aon_resets.rst_lc_aon_n[rstmgr_pkg::DomainAonSel]),
    .rst_ast_alert_ni (rstmgr_aon_resets.rst_lc_io_div4_n[rstmgr_pkg::Domain0Sel]),
    .rst_ast_es_ni (rstmgr_aon_resets.rst_lc_n[rstmgr_pkg::Domain0Sel]),
    .rst_ast_rng_ni (rstmgr_aon_resets.rst_lc_n[rstmgr_pkg::Domain0Sel]),
    .rst_ast_usb_ni (rstmgr_aon_resets.rst_por_usb_n[rstmgr_pkg::Domain0Sel]),
    .clk_ast_ext_i         ( ext_clk ),

    // pok test for FPGA
    .vcc_supp_i            ( 1'b1 ),
    .vcaon_supp_i          ( 1'b1 ),
    .vcmain_supp_i         ( 1'b1 ),
    .vioa_supp_i           ( 1'b1 ),
    .viob_supp_i           ( 1'b1 ),
    // pok
    .ast_pwst_o            ( ast_pwst ),
    .ast_pwst_h_o          ( ast_pwst_h ),
    // main regulator
    .main_env_iso_en_i     ( base_ast_pwr.pwr_clamp_env ),
    .main_pd_ni            ( base_ast_pwr.main_pd_n ),
    // pdm control (flash)/otp
    .flash_power_down_h_o  ( ),
    .flash_power_ready_h_o ( ),
    .otp_power_seq_i       ( otp_ctrl_otp_ast_pwr_seq ),
    .otp_power_seq_h_o     ( otp_ctrl_otp_ast_pwr_seq_h ),
    // system source clock
    .clk_src_sys_en_i      ( base_ast_pwr.core_clk_en ),
    // need to add function in clkmgr
    .clk_src_sys_jen_i     ( jen ),
    .clk_src_sys_o         ( ast_base_clks.clk_sys  ),
    .clk_src_sys_val_o     ( ast_base_pwr.core_clk_val ),
    // aon source clock
    .clk_src_aon_o         ( ast_base_clks.clk_aon ),
    .clk_src_aon_val_o     ( ast_base_pwr.slow_clk_val ),
    // io source clock
    .clk_src_io_en_i       ( base_ast_pwr.io_clk_en ),
    .clk_src_io_o          ( ast_base_clks.clk_io ),
    .clk_src_io_val_o      ( ast_base_pwr.io_clk_val ),
    .clk_src_io_48m_o      ( div_step_down_req ),
    // usb source clock
    .usb_ref_pulse_i       ( usb_ref_pulse ),
    .usb_ref_val_i         ( usb_ref_val ),
    .clk_src_usb_en_i      ( base_ast_pwr.usb_clk_en ),
    .clk_src_usb_o         ( ast_base_clks.clk_usb ),
    .clk_src_usb_val_o     ( ast_base_pwr.usb_clk_val ),
    // entropy_src
    .es_req_i              ( entropy_src_hw_if_req ),
    .es_rsp_o              ( entropy_src_hw_if_rsp ),
    // adc
    .adc_pd_i              ( '0 ),
    .adc_chnsel_i          ( '0 ),
    .adc_d_o               ( adc_rsp.data ),
    .adc_d_val_o           ( adc_rsp.data_valid ),
    // entropy
    .entropy_rsp_i         ( ast_edn_edn_rsp ),
    .entropy_req_o         ( ast_edn_edn_req ),
    // alerts
    .alert_rsp_i           ( ast_alert_rsp  ),
    .alert_req_o           ( ast_alert_req  ),
    // dft
    .dft_strap_test_i      ( dft_strap_test   ),
    .lc_dft_en_i           ( lc_dft_en        ),
    .fla_obs_i             ( fla_obs ),
    .otp_obs_i             ( otp_obs ),
    .otm_obs_i             ( '0 ),
    .usb_obs_i             ( usb_diff_rx_obs ),
    .obs_ctrl_o            ( obs_ctrl ),
    // pinmux related
    .padmux2ast_i          ( pad2ast    ),
    .ast2padmux_o          ( ast2pinmux ),
    .ext_freq_is_96m_i     ( hi_speed_sel ),
    .all_clk_byp_req_i     ( all_clk_byp_req  ),
    .all_clk_byp_ack_o     ( all_clk_byp_ack  ),
    .io_clk_byp_req_i      ( io_clk_byp_req   ),
    .io_clk_byp_ack_o      ( io_clk_byp_ack   ),
    .flash_bist_en_o       ( ),
    // Memory configuration connections
    .dpram_rmf_o           ( ast_ram_2p_fcfg ),
    .dpram_rml_o           ( ast_ram_2p_lcfg ),
    .spram_rm_o            ( ast_ram_1p_cfg  ),
    .sprgf_rm_o            ( ast_rf_cfg      ),
    .sprom_rm_o            ( ast_rom_cfg     ),
    // scan
    .dft_scan_md_o         ( scanmode ),
    .scan_shift_en_o       ( scan_en ),
    .scan_reset_no         ( scan_rst_n )
  );


  //////////////////
  // TAP Instance //
  //////////////////

  // TODO: replace this with a unified TAP
  tlul_pkg::tl_h2d_t lc_ctrl_dmi_h2d;
  tlul_pkg::tl_d2h_t lc_ctrl_dmi_d2h;
  tlul_pkg::tl_h2d_t rv_dm_dmi_h2d;
  tlul_pkg::tl_d2h_t rv_dm_dmi_d2h;
  jtag_pkg::jtag_req_t lc_jtag_req;
  jtag_pkg::jtag_rsp_t lc_jtag_rsp;
  jtag_pkg::jtag_req_t rv_jtag_req;
  jtag_pkg::jtag_rsp_t rv_jtag_rsp;
  tlul_jtag_dtm #(
    .IdcodeValue(jtag_id_pkg::LC_CTRL_JTAG_IDCODE),
    // Notes:
    // - one RV_DM instance uses 9bits
    // - our crossbar tooling expects individual IPs to be spaced appart by 12bits at the moment
    // - the DMI address shifted through jtag is a word address and hence 2bits smaller than this
    // - setting this to 18bits effectively gives us 2^6 = 64 addressable 12bit ranges
    .NumDmiByteAbits(18)
  ) u_tlul_jtag_dtm_lc (
    .clk_i      (clkmgr_aon_clocks.clk_io_div4_secure),
    .rst_ni     (rstmgr_aon_resets.rst_lc_io_div4_n[rstmgr_pkg::Domain0Sel]),
    .jtag_i     (lc_jtag_req),
    .jtag_o     (lc_jtag_rsp),
    .scan_rst_ni(scan_rst_n),
    .scanmode_i (scanmode),
    .tl_h2d_o   (lc_ctrl_dmi_h2d),
    .tl_d2h_i   (lc_ctrl_dmi_d2h)
  );
  tlul_jtag_dtm #(
    .IdcodeValue(jtag_id_pkg::RV_DM_JTAG_IDCODE)
  ) u_tlul_jtag_dtm_rv (
    .clk_i      (clkmgr_aon_clocks.clk_main_infra),
    .rst_ni     (rstmgr_aon_resets.rst_sys_n[rstmgr_pkg::Domain0Sel]),
    .jtag_i     (rv_jtag_req),
    .jtag_o     (rv_jtag_rsp),
    .scan_rst_ni(scan_rst_n),
    .scanmode_i (scanmode),
    .tl_h2d_o   (rv_dm_dmi_h2d),
    .tl_d2h_i   (rv_dm_dmi_d2h)
  );

  // TODO: remove this once unified TAP is available.
  // Until we have a full test harness for the FPGA, we should
  // probably map the JTAG signals to dedicated locations so that
  // no such strap sampling hack is needed.
  // Important things to note:
  // - the unified TAP clock and reset should be the same as the RV_DM so that it does not get
  //   reset during NDM reset.
  // - the pwrmgr_strap_en signal can be removed.
  // - the lc_gating for the RV_DM on the pinmux side should move into rv_dm.
  pad_attr_t [pinmux_reg_pkg::NMioPads-1:0] mio_attr_coreside;
  pad_attr_t [pinmux_reg_pkg::NDioPads-1:0] dio_attr_coreside;
  logic [pinmux_reg_pkg::NMioPads-1:0] mio_out_coreside;
  logic [pinmux_reg_pkg::NMioPads-1:0] mio_oe_coreside;
  logic [pinmux_reg_pkg::NMioPads-1:0] mio_in_coreside;
  logic [pinmux_reg_pkg::NDioPads-1:0] dio_out_coreside;
  logic [pinmux_reg_pkg::NDioPads-1:0] dio_oe_coreside;
  logic [pinmux_reg_pkg::NDioPads-1:0] dio_in_coreside;
  logic pwrmgr_strap_en;
  lc_ctrl_pkg::lc_tx_t lc_hw_debug_en;
  pinmux_strap_sampling #(
    .TargetCfg(PinmuxTargetCfg)
  ) u_pinmux_strap_sampling_dummy (
    .clk_i               (clkmgr_aon_clocks.clk_io_div4_powerup),
    // Inside the pinmux, the strap sampling module is the only module using SYS_RST. The reason for
    // that is that SYS_RST reset will not be asserted during a NDM reset from the RV_DM and hence
    // it retains some of the TAP selection state during an active debug session where NDM reset
    // is triggered. To that end, the strap sampling module latches the lc_hw_debug_en_i signal
    // whenever pwrmgr_strap_en_i is asserted. Note that this does not affect the DFT TAP selection, since
    // we always consume the live lc_dft_en_i signal.
    .rst_ni              (rstmgr_aon_resets.rst_sys_io_div4_n[rstmgr_pkg::DomainAonSel]),
    .scanmode_i          (scanmode),
    .out_padring_o       ({dio_out,  mio_out} ),
    .oe_padring_o        ({dio_oe ,  mio_oe } ),
    .in_padring_i        ({dio_in ,  mio_in } ),
    .attr_padring_o      ({dio_attr, mio_attr}),
    .out_core_i          ({dio_out_coreside,  mio_out_coreside} ),
    .oe_core_i           ({dio_oe_coreside,   mio_oe_coreside}  ),
    .in_core_o           ({dio_in_coreside,   mio_in_coreside}  ),
    .attr_core_i         ({dio_attr_coreside, mio_attr_coreside}),
    // This signal can be removed from the top
    .strap_en_i          (pwrmgr_strap_en),
    .lc_dft_en_i         (lc_dft_en),
    .lc_hw_debug_en_i    (lc_hw_debug_en),
    // Disable extra controls that are needed in the NDM reset case.
    // This will be handled differently for integrated since we're going to move the
    // gating into RV_DM.
    .lc_check_byp_en_i   (lc_ctrl_pkg::Off),
    .lc_escalate_en_i    (lc_ctrl_pkg::Off),
    .pinmux_hw_debug_en_o(),
    .dft_strap_test_o    (),
    .dft_hold_tap_sel_i  (1'b0),
    .lc_jtag_o           (lc_jtag_req),
    .lc_jtag_i           (lc_jtag_rsp),
    .rv_jtag_o           (rv_jtag_req),
    .rv_jtag_i           (rv_jtag_rsp),
    .dft_jtag_o          (),
    .dft_jtag_i          (jtag_pkg::JTAG_RSP_DEFAULT)
  );

  ////////////////////////////////////////////
  // CTN Address decoding and SRAM Instance //
  ////////////////////////////////////////////

  localparam int CtnSramDw = top_pkg::TL_DW + tlul_pkg::DataIntgWidth;

  tlul_pkg::tl_h2d_t ctn_egress_tl_h2d;
  tlul_pkg::tl_d2h_t ctn_egress_tl_d2h;

  tlul_pkg::tl_h2d_t ctn_s1n_tl_h2d[1];
  tlul_pkg::tl_d2h_t ctn_s1n_tl_d2h[1];

  // Steering signal for address decoding.
  logic [0:0] ctn_dev_sel_s1n;

  logic sram_intg_error, sram_req, sram_gnt, sram_we, sram_rvalid;
  logic [top_pkg::CtnSramAw-1:0] sram_addr;
  logic [CtnSramDw-1:0] sram_wdata, sram_wmask, sram_rdata;

  // Steering of requests.
  // Addresses leaving the RoT through the CTN port are mapped to an internal 1G address space of
  // 0x4000_0000 - 0x8000_0000. However, the CTN RAM only covers a 1MB region inside that space,
  // and hence additional decoding and steering logic is needed here.
  // TODO: this should in the future be replaced by an automatically generated crossbar.
  always_comb begin
    // Default steering to generate error response if address is not within the range
    ctn_dev_sel_s1n = 1'b1;
    // Steering to CTN SRAM.
    if ((ctn_egress_tl_h2d.a_address & ~(TOP_DARJEELING_RAM_CTN_SIZE_BYTES-1)) ==
        TOP_DARJEELING_RAM_CTN_BASE_ADDR) begin
      ctn_dev_sel_s1n = 1'd0;
    end
  end

  tlul_socket_1n #(
    .HReqDepth (4'h0),
    .HRspDepth (4'h0),
    .DReqDepth (8'h0),
    .DRspDepth (8'h0),
    .N         (1)
  ) u_ctn_s1n (
    .clk_i        (clkmgr_aon_clocks.clk_main_infra),
    .rst_ni       (rstmgr_aon_resets.rst_lc_n[rstmgr_pkg::Domain0Sel]),
    .tl_h_i       (ctn_egress_tl_h2d),
    .tl_h_o       (ctn_egress_tl_d2h),
    .tl_d_o       (ctn_s1n_tl_h2d),
    .tl_d_i       (ctn_s1n_tl_d2h),
    .dev_select_i (ctn_dev_sel_s1n)
  );

  tlul_adapter_sram #(
    .SramAw(top_pkg::CtnSramAw),
    .SramDw(CtnSramDw - tlul_pkg::DataIntgWidth),
    .Outstanding(2),
    .ByteAccess(1),
    .CmdIntgCheck(1),
    .EnableRspIntgGen(1),
    .EnableDataIntgGen(0),
    .EnableDataIntgPt(1),
    .SecFifoPtr      (0)
  ) u_tlul_adapter_sram_ctn (
    .clk_i       (clkmgr_aon_clocks.clk_main_infra),
    .rst_ni      (rstmgr_aon_resets.rst_lc_n[rstmgr_pkg::Domain0Sel]),
    .tl_i        (ctn_s1n_tl_h2d[0]),
    .tl_o        (ctn_s1n_tl_d2h[0]),
    // Ifetch is explicitly allowed
    .en_ifetch_i (prim_mubi_pkg::MuBi4True),
    .req_o       (sram_req),
    .req_type_o  (),
    // SRAM can always accept a request.
    .gnt_i       (1),
    .we_o        (sram_we),
    .addr_o      (sram_addr),
    .wdata_o     (sram_wdata),
    .wmask_o     (sram_wmask),
    .intg_error_o(),
    .rdata_i     (sram_rdata),
    .rvalid_i    (sram_rvalid),
    .rerror_i    (1'b0)
  );

  prim_ram_1p_adv #(
    .Depth(top_pkg::CtnSramDepth),
    .Width(CtnSramDw),
    .DataBitsPerMask(CtnSramDw),
    .EnableECC(0),
    .EnableParity(0),
    .EnableInputPipeline(1),
    .EnableOutputPipeline(1)
  ) u_prim_ram_1p_adv_ctn (
    .clk_i    (clkmgr_aon_clocks.clk_main_infra),
    .rst_ni   (rstmgr_aon_resets.rst_lc_n[rstmgr_pkg::Domain0Sel]),
    .req_i    (sram_req),
    .write_i  (sram_we),
    .addr_i   (sram_addr),
    .wdata_i  (sram_wdata),
    .wmask_i  (sram_wmask),
    .rdata_o  (sram_rdata),
    .rvalid_o (sram_rvalid),
    // No error detection is enabled inside SRAM.
    // Bus ECC is checked at the consumer side.
    .rerror_o (),
    .cfg_i    (ram_1p_cfg)
  );


  //////////////////////////////////
  // Manual Pad / Signal Tie-offs //
  //////////////////////////////////

  assign manual_out_ast_misc = 1'b0;
  assign manual_oe_ast_misc = 1'b0;
  always_comb begin
    // constantly enable pull-down
    manual_attr_ast_misc = '0;
    manual_attr_ast_misc.pull_select = 1'b0;
    manual_attr_ast_misc.pull_en = 1'b1;
  end
  assign manual_out_por_n = 1'b0;
  assign manual_oe_por_n = 1'b0;

  assign manual_out_cc1 = 1'b0;
  assign manual_oe_cc1 = 1'b0;
  assign manual_out_cc2 = 1'b0;
  assign manual_oe_cc2 = 1'b0;


  assign manual_out_otp_ext_volt = 1'b0;
  assign manual_oe_otp_ext_volt = 1'b0;

  // These pad attributes currently tied off permanently (these are all input-only pads).
  assign manual_attr_por_n = '0;
  assign manual_attr_cc1 = '0;
  assign manual_attr_cc2 = '0;
  assign manual_attr_otp_ext_volt = '0;

  logic unused_manual_sigs;
  assign unused_manual_sigs = ^{
    manual_in_otp_ext_volt
  };


  soc_proxy_pkg::soc_alert_req_t [soc_proxy_pkg::NumFatalExternalAlerts-1:0] soc_fatal_alert_req;
  soc_proxy_pkg::soc_alert_req_t [soc_proxy_pkg::NumRecovExternalAlerts-1:0] soc_recov_alert_req;
  assign soc_fatal_alert_req =
      {soc_proxy_pkg::NumFatalExternalAlerts{soc_proxy_pkg::SOC_ALERT_REQ_DEFAULT}};
  assign soc_recov_alert_req =
      {soc_proxy_pkg::NumRecovExternalAlerts{soc_proxy_pkg::SOC_ALERT_REQ_DEFAULT}};

  //////////////////////
  // Top-level design //
  //////////////////////
  top_darjeeling #(
    .PinmuxAonTargetCfg(PinmuxTargetCfg),
    .SecAesAllowForcingMasks(1'b1),
    .SecRomCtrl0DisableScrambling(SecRomCtrl0DisableScrambling),
    .SecRomCtrl1DisableScrambling(SecRomCtrl1DisableScrambling)
  ) top_darjeeling (
    // ast connections
    .por_n_i                      ( por_n                      ),
    .clk_main_i                   ( ast_base_clks.clk_sys      ),
    .clk_io_i                     ( ast_base_clks.clk_io       ),
    .clk_usb_i                    ( ast_base_clks.clk_usb      ),
    .clk_aon_i                    ( ast_base_clks.clk_aon      ),
    .clks_ast_o                   ( clkmgr_aon_clocks          ),
    .clk_main_jitter_en_o         ( jen                        ),
    .rsts_ast_o                   ( rstmgr_aon_resets          ),
    .sck_monitor_o                ( sck_monitor                ),
    .pwrmgr_ast_req_o             ( base_ast_pwr               ),
    .pwrmgr_ast_rsp_i             ( ast_base_pwr               ),
    .sensor_ctrl_ast_alert_req_i  ( ast_alert_req              ),
    .sensor_ctrl_ast_alert_rsp_o  ( ast_alert_rsp              ),
    .sensor_ctrl_ast_status_i     ( ast_pwst.io_pok            ),
    .ast_edn_req_i                ( ast_edn_edn_req            ),
    .ast_edn_rsp_o                ( ast_edn_edn_rsp            ),
    .ast_tl_req_o                 ( base_ast_bus               ),
    .ast_tl_rsp_i                 ( ast_base_bus               ),
    .obs_ctrl_i                   ( obs_ctrl                   ),
    .otp_ctrl_otp_ast_pwr_seq_o   ( otp_ctrl_otp_ast_pwr_seq   ),
    .otp_ctrl_otp_ast_pwr_seq_h_i ( otp_ctrl_otp_ast_pwr_seq_h ),
    .otp_obs_o                    ( otp_obs                    ),
    .ctn_tl_h2d_o                 ( ctn_egress_tl_h2d          ),
    .ctn_tl_d2h_i                 ( ctn_egress_tl_d2h          ),
    .dma_sys_req_o                (                            ),
    .dma_sys_rsp_i                ( '0                         ),
    .dma_ctn_tl_h2d_o             (                            ),
    .dma_ctn_tl_d2h_i             ( tlul_pkg::TL_D2H_DEFAULT   ),
    .mbx_tl_req_i                 ( tlul_pkg::TL_H2D_DEFAULT   ),
    .mbx_tl_rsp_o                 (                            ),
    .mbx_jtag_dmi_req_i           ( tlul_pkg::TL_H2D_DEFAULT   ),
    .mbx_jtag_dmi_rsp_o           (                            ),
    .soc_fatal_alert_req_i        ( soc_fatal_alert_req        ),
    .soc_fatal_alert_rsp_o        (                            ),
    .soc_recov_alert_req_i        ( soc_recov_alert_req        ),
    .soc_recov_alert_rsp_o        (                            ),
    .soc_intr_async_i             ( '0                         ),
    .soc_wkup_async_i             ( 1'b0                       ),
    .soc_rst_req_async_i          ( 1'b0                       ),
    .soc_lsio_trigger_i           ( '0                         ),
    .entropy_src_hw_if_req_o      ( entropy_src_hw_if_req      ),
    .entropy_src_hw_if_rsp_i      ( entropy_src_hw_if_rsp      ),
    .io_clk_byp_req_o             ( io_clk_byp_req             ),
    .io_clk_byp_ack_i             ( io_clk_byp_ack             ),
    .all_clk_byp_req_o            ( all_clk_byp_req            ),
    .all_clk_byp_ack_i            ( all_clk_byp_ack            ),
    .hi_speed_sel_o               ( hi_speed_sel               ),
    .div_step_down_req_i          ( div_step_down_req          ),
    .ast2pinmux_i                 ( ast2pinmux                 ),
    .calib_rdy_i                  ( ast_init_done              ),
    .ast_init_done_i              ( ast_init_done              ),

    // OTP external voltage
    .otp_ext_voltage_h_io         ( OTP_EXT_VOLT               ),

    // DMI into lc_ctrl
    .lc_ctrl_dmi_h2d_i            ( lc_ctrl_dmi_h2d            ),
    .lc_ctrl_dmi_d2h_o            ( lc_ctrl_dmi_d2h            ),

    // DMI into RV_DM
    .rv_dm_dmi_h2d_i              ( rv_dm_dmi_h2d              ),
    .rv_dm_dmi_d2h_o              ( rv_dm_dmi_d2h              ),

    // Pinmux strap
    .pwrmgr_strap_en_o            ( pwrmgr_strap_en            ),
    // TODO: move the pinmux-side gating into RV_DM
    .rv_pinmux_hw_debug_en_i      ( lc_ctrl_pkg::On            ),

    // Multiplexed I/O
    .mio_in_i                     ( mio_in_coreside            ),
    .mio_out_o                    ( mio_out_coreside           ),
    .mio_oe_o                     ( mio_oe_coreside            ),

    // Dedicated I/O
    .dio_in_i                     ( dio_in_coreside            ),
    .dio_out_o                    ( dio_out_coreside           ),
    .dio_oe_o                     ( dio_oe_coreside            ),

    // Pad attributes
    .mio_attr_o                   ( mio_attr_coreside          ),
    .dio_attr_o                   ( dio_attr_coreside          ),

    // Memory attributes
    .ram_1p_cfg_i                 ( ram_1p_cfg                 ),
    .spi_ram_2p_cfg_i             ( spi_ram_2p_cfg             ),

    .rom_cfg_i                    ( rom_cfg                    ),

    // DFT signals
    .ast_lc_dft_en_o              ( lc_dft_en                  ),
    .ast_lc_hw_debug_en_o         ( lc_hw_debug_en             ),
    .dft_strap_test_o             ( dft_strap_test             ),
    .dft_hold_tap_sel_i           ( '0                         ),
    .scan_rst_ni                  ( scan_rst_n                 ),
    .scan_en_i                    ( scan_en                    ),
    .scanmode_i                   ( scanmode                   ),

    // FPGA build info
    .fpga_info_i                  ( '0                         )
  );



endmodule : chip_darjeeling_asic
