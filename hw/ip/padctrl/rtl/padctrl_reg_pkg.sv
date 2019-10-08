// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Package auto-generated by `reggen` containing data structure

package padctrl_reg_pkg;

  // Param list
  localparam int NDioPads = 4;
  localparam int NMioPads = 18;
  localparam int AttrDw = 6;

/////////////////////////////////////////////////////////////////////
// Typedefs for multiregs
/////////////////////////////////////////////////////////////////////

typedef struct packed {
  logic [5:0] q;
} padctrl_reg2hw_dio_pads_mreg_t;
typedef struct packed {
  logic [5:0] q;
} padctrl_reg2hw_mio_pads_mreg_t;


/////////////////////////////////////////////////////////////////////
// Register to internal design logic
/////////////////////////////////////////////////////////////////////

typedef struct packed {
  padctrl_reg2hw_dio_pads_mreg_t [3:0] dio_pads; // [131:108]
  padctrl_reg2hw_mio_pads_mreg_t [17:0] mio_pads; // [107:0]
} padctrl_reg2hw_t;

/////////////////////////////////////////////////////////////////////
// Internal design logic to register
/////////////////////////////////////////////////////////////////////


  // Register Address
  parameter PADCTRL_REGEN_OFFSET = 5'h 0;
  parameter PADCTRL_DIO_PADS_OFFSET = 5'h 4;
  parameter PADCTRL_MIO_PADS0_OFFSET = 5'h 8;
  parameter PADCTRL_MIO_PADS1_OFFSET = 5'h c;
  parameter PADCTRL_MIO_PADS2_OFFSET = 5'h 10;
  parameter PADCTRL_MIO_PADS3_OFFSET = 5'h 14;


  // Register Index
  typedef enum int {
    PADCTRL_REGEN,
    PADCTRL_DIO_PADS,
    PADCTRL_MIO_PADS0,
    PADCTRL_MIO_PADS1,
    PADCTRL_MIO_PADS2,
    PADCTRL_MIO_PADS3
  } padctrl_id_e;

  // Register width information to check illegal writes
  localparam logic [3:0] PADCTRL_PERMIT [6] = '{
    4'b 0001, // index[0] PADCTRL_REGEN
    4'b 0111, // index[1] PADCTRL_DIO_PADS
    4'b 1111, // index[2] PADCTRL_MIO_PADS0
    4'b 1111, // index[3] PADCTRL_MIO_PADS1
    4'b 1111, // index[4] PADCTRL_MIO_PADS2
    4'b 0111  // index[5] PADCTRL_MIO_PADS3
  };
endpackage

