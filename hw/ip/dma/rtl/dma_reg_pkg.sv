// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Package auto-generated by `reggen` containing data structure

package dma_reg_pkg;

  // Param list
  parameter int NumIntClearSources = 8;
  parameter int NumAlerts = 1;

  // Address widths within the block
  parameter int BlockAw = 8;

  ////////////////////////////
  // Typedefs for registers //
  ////////////////////////////

  typedef struct packed {
    struct packed {
      logic        q;
    } dma_done;
    struct packed {
      logic        q;
    } dma_error;
    struct packed {
      logic        q;
    } dma_memory_buffer_limit;
  } dma_reg2hw_intr_state_reg_t;

  typedef struct packed {
    struct packed {
      logic        q;
    } dma_done;
    struct packed {
      logic        q;
    } dma_error;
    struct packed {
      logic        q;
    } dma_memory_buffer_limit;
  } dma_reg2hw_intr_enable_reg_t;

  typedef struct packed {
    struct packed {
      logic        q;
      logic        qe;
    } dma_done;
    struct packed {
      logic        q;
      logic        qe;
    } dma_error;
    struct packed {
      logic        q;
      logic        qe;
    } dma_memory_buffer_limit;
  } dma_reg2hw_intr_test_reg_t;

  typedef struct packed {
    logic        q;
    logic        qe;
  } dma_reg2hw_alert_test_reg_t;

  typedef struct packed {
    logic [31:0] q;
    logic        qe;
  } dma_reg2hw_source_address_lo_reg_t;

  typedef struct packed {
    logic [31:0] q;
    logic        qe;
  } dma_reg2hw_source_address_hi_reg_t;

  typedef struct packed {
    logic [31:0] q;
    logic        qe;
  } dma_reg2hw_destination_address_lo_reg_t;

  typedef struct packed {
    logic [31:0] q;
    logic        qe;
  } dma_reg2hw_destination_address_hi_reg_t;

  typedef struct packed {
    struct packed {
      logic [3:0]  q;
      logic        qe;
    } source_asid;
    struct packed {
      logic [3:0]  q;
      logic        qe;
    } destination_asid;
  } dma_reg2hw_address_space_id_reg_t;

  typedef struct packed {
    logic [31:0] q;
    logic        qe;
  } dma_reg2hw_enabled_memory_range_base_reg_t;

  typedef struct packed {
    logic [31:0] q;
    logic        qe;
  } dma_reg2hw_enabled_memory_range_limit_reg_t;

  typedef struct packed {
    logic [3:0]  q;
  } dma_reg2hw_range_unlock_regwen_reg_t;

  typedef struct packed {
    logic [31:0] q;
    logic        qe;
  } dma_reg2hw_total_data_size_reg_t;

  typedef struct packed {
    logic [1:0]  q;
    logic        qe;
  } dma_reg2hw_transfer_width_reg_t;

  typedef struct packed {
    logic [31:0] q;
    logic        qe;
  } dma_reg2hw_destination_address_limit_lo_reg_t;

  typedef struct packed {
    logic [31:0] q;
    logic        qe;
  } dma_reg2hw_destination_address_limit_hi_reg_t;

  typedef struct packed {
    logic [31:0] q;
    logic        qe;
  } dma_reg2hw_destination_address_almost_limit_lo_reg_t;

  typedef struct packed {
    logic [31:0] q;
    logic        qe;
  } dma_reg2hw_destination_address_almost_limit_hi_reg_t;

  typedef struct packed {
    struct packed {
      logic [3:0]  q;
      logic        qe;
    } opcode;
    struct packed {
      logic        q;
      logic        qe;
    } hardware_handshake_enable;
    struct packed {
      logic        q;
      logic        qe;
    } memory_buffer_auto_increment_enable;
    struct packed {
      logic        q;
      logic        qe;
    } fifo_auto_increment_enable;
    struct packed {
      logic        q;
      logic        qe;
    } data_direction;
    struct packed {
      logic        q;
      logic        qe;
    } abort;
    struct packed {
      logic        q;
      logic        qe;
    } go;
  } dma_reg2hw_control_reg_t;

  typedef struct packed {
    struct packed {
      logic        q;
      logic        qe;
    } busy;
    struct packed {
      logic        q;
      logic        qe;
    } done;
    struct packed {
      logic        q;
      logic        qe;
    } aborted;
    struct packed {
      logic        q;
      logic        qe;
    } error;
    struct packed {
      logic [7:0]  q;
      logic        qe;
    } error_code;
  } dma_reg2hw_status_reg_t;

  typedef struct packed {
    logic        q;
    logic        qe;
  } dma_reg2hw_clear_state_reg_t;

  typedef struct packed {
    logic [31:0] q;
  } dma_reg2hw_handshake_interrupt_enable_reg_t;

  typedef struct packed {
    logic [7:0]  q;
    logic        qe;
  } dma_reg2hw_clear_int_src_reg_t;

  typedef struct packed {
    logic [7:0]  q;
    logic        qe;
  } dma_reg2hw_clear_int_bus_reg_t;

  typedef struct packed {
    logic [31:0] q;
    logic        qe;
  } dma_reg2hw_int_source_addr_mreg_t;

  typedef struct packed {
    logic [31:0] q;
    logic        qe;
  } dma_reg2hw_int_source_wr_val_mreg_t;

  typedef struct packed {
    logic [31:0] q;
  } dma_reg2hw_sha2_digest_mreg_t;

  typedef struct packed {
    struct packed {
      logic        d;
      logic        de;
    } dma_done;
    struct packed {
      logic        d;
      logic        de;
    } dma_error;
    struct packed {
      logic        d;
      logic        de;
    } dma_memory_buffer_limit;
  } dma_hw2reg_intr_state_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } dma_hw2reg_source_address_lo_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } dma_hw2reg_source_address_hi_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } dma_hw2reg_destination_address_lo_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } dma_hw2reg_destination_address_hi_reg_t;

  typedef struct packed {
    struct packed {
      logic [3:0]  d;
      logic        de;
    } opcode;
    struct packed {
      logic        d;
      logic        de;
    } hardware_handshake_enable;
    struct packed {
      logic        d;
      logic        de;
    } memory_buffer_auto_increment_enable;
    struct packed {
      logic        d;
      logic        de;
    } fifo_auto_increment_enable;
    struct packed {
      logic        d;
      logic        de;
    } data_direction;
    struct packed {
      logic        d;
      logic        de;
    } abort;
    struct packed {
      logic        d;
      logic        de;
    } go;
  } dma_hw2reg_control_reg_t;

  typedef struct packed {
    struct packed {
      logic        d;
      logic        de;
    } busy;
    struct packed {
      logic        d;
      logic        de;
    } done;
    struct packed {
      logic        d;
      logic        de;
    } aborted;
    struct packed {
      logic        d;
      logic        de;
    } error;
    struct packed {
      logic [7:0]  d;
      logic        de;
    } error_code;
  } dma_hw2reg_status_reg_t;

  typedef struct packed {
    logic        d;
    logic        de;
  } dma_hw2reg_clear_state_reg_t;

  typedef struct packed {
    logic [31:0] d;
    logic        de;
  } dma_hw2reg_sha2_digest_mreg_t;

  // Register -> HW type
  typedef struct packed {
    dma_reg2hw_intr_state_reg_t intr_state; // [1519:1517]
    dma_reg2hw_intr_enable_reg_t intr_enable; // [1516:1514]
    dma_reg2hw_intr_test_reg_t intr_test; // [1513:1508]
    dma_reg2hw_alert_test_reg_t alert_test; // [1507:1506]
    dma_reg2hw_source_address_lo_reg_t source_address_lo; // [1505:1473]
    dma_reg2hw_source_address_hi_reg_t source_address_hi; // [1472:1440]
    dma_reg2hw_destination_address_lo_reg_t destination_address_lo; // [1439:1407]
    dma_reg2hw_destination_address_hi_reg_t destination_address_hi; // [1406:1374]
    dma_reg2hw_address_space_id_reg_t address_space_id; // [1373:1364]
    dma_reg2hw_enabled_memory_range_base_reg_t enabled_memory_range_base; // [1363:1331]
    dma_reg2hw_enabled_memory_range_limit_reg_t enabled_memory_range_limit; // [1330:1298]
    dma_reg2hw_range_unlock_regwen_reg_t range_unlock_regwen; // [1297:1294]
    dma_reg2hw_total_data_size_reg_t total_data_size; // [1293:1261]
    dma_reg2hw_transfer_width_reg_t transfer_width; // [1260:1258]
    dma_reg2hw_destination_address_limit_lo_reg_t destination_address_limit_lo; // [1257:1225]
    dma_reg2hw_destination_address_limit_hi_reg_t destination_address_limit_hi; // [1224:1192]
    dma_reg2hw_destination_address_almost_limit_lo_reg_t
        destination_address_almost_limit_lo; // [1191:1159]
    dma_reg2hw_destination_address_almost_limit_hi_reg_t
        destination_address_almost_limit_hi; // [1158:1126]
    dma_reg2hw_control_reg_t control; // [1125:1109]
    dma_reg2hw_status_reg_t status; // [1108:1092]
    dma_reg2hw_clear_state_reg_t clear_state; // [1091:1090]
    dma_reg2hw_handshake_interrupt_enable_reg_t handshake_interrupt_enable; // [1089:1058]
    dma_reg2hw_clear_int_src_reg_t clear_int_src; // [1057:1049]
    dma_reg2hw_clear_int_bus_reg_t clear_int_bus; // [1048:1040]
    dma_reg2hw_int_source_addr_mreg_t [7:0] int_source_addr; // [1039:776]
    dma_reg2hw_int_source_wr_val_mreg_t [7:0] int_source_wr_val; // [775:512]
    dma_reg2hw_sha2_digest_mreg_t [15:0] sha2_digest; // [511:0]
  } dma_reg2hw_t;

  // HW -> register type
  typedef struct packed {
    dma_hw2reg_intr_state_reg_t intr_state; // [701:696]
    dma_hw2reg_source_address_lo_reg_t source_address_lo; // [695:663]
    dma_hw2reg_source_address_hi_reg_t source_address_hi; // [662:630]
    dma_hw2reg_destination_address_lo_reg_t destination_address_lo; // [629:597]
    dma_hw2reg_destination_address_hi_reg_t destination_address_hi; // [596:564]
    dma_hw2reg_control_reg_t control; // [563:547]
    dma_hw2reg_status_reg_t status; // [546:530]
    dma_hw2reg_clear_state_reg_t clear_state; // [529:528]
    dma_hw2reg_sha2_digest_mreg_t [15:0] sha2_digest; // [527:0]
  } dma_hw2reg_t;

  // Register offsets
  parameter logic [BlockAw-1:0] DMA_INTR_STATE_OFFSET = 8'h 0;
  parameter logic [BlockAw-1:0] DMA_INTR_ENABLE_OFFSET = 8'h 4;
  parameter logic [BlockAw-1:0] DMA_INTR_TEST_OFFSET = 8'h 8;
  parameter logic [BlockAw-1:0] DMA_ALERT_TEST_OFFSET = 8'h c;
  parameter logic [BlockAw-1:0] DMA_SOURCE_ADDRESS_LO_OFFSET = 8'h 10;
  parameter logic [BlockAw-1:0] DMA_SOURCE_ADDRESS_HI_OFFSET = 8'h 14;
  parameter logic [BlockAw-1:0] DMA_DESTINATION_ADDRESS_LO_OFFSET = 8'h 18;
  parameter logic [BlockAw-1:0] DMA_DESTINATION_ADDRESS_HI_OFFSET = 8'h 1c;
  parameter logic [BlockAw-1:0] DMA_ADDRESS_SPACE_ID_OFFSET = 8'h 20;
  parameter logic [BlockAw-1:0] DMA_ENABLED_MEMORY_RANGE_BASE_OFFSET = 8'h 24;
  parameter logic [BlockAw-1:0] DMA_ENABLED_MEMORY_RANGE_LIMIT_OFFSET = 8'h 28;
  parameter logic [BlockAw-1:0] DMA_RANGE_UNLOCK_REGWEN_OFFSET = 8'h 2c;
  parameter logic [BlockAw-1:0] DMA_TOTAL_DATA_SIZE_OFFSET = 8'h 30;
  parameter logic [BlockAw-1:0] DMA_TRANSFER_WIDTH_OFFSET = 8'h 34;
  parameter logic [BlockAw-1:0] DMA_DESTINATION_ADDRESS_LIMIT_LO_OFFSET = 8'h 38;
  parameter logic [BlockAw-1:0] DMA_DESTINATION_ADDRESS_LIMIT_HI_OFFSET = 8'h 3c;
  parameter logic [BlockAw-1:0] DMA_DESTINATION_ADDRESS_ALMOST_LIMIT_LO_OFFSET = 8'h 40;
  parameter logic [BlockAw-1:0] DMA_DESTINATION_ADDRESS_ALMOST_LIMIT_HI_OFFSET = 8'h 44;
  parameter logic [BlockAw-1:0] DMA_CONTROL_OFFSET = 8'h 48;
  parameter logic [BlockAw-1:0] DMA_STATUS_OFFSET = 8'h 4c;
  parameter logic [BlockAw-1:0] DMA_CLEAR_STATE_OFFSET = 8'h 50;
  parameter logic [BlockAw-1:0] DMA_HANDSHAKE_INTERRUPT_ENABLE_OFFSET = 8'h 54;
  parameter logic [BlockAw-1:0] DMA_CLEAR_INT_SRC_OFFSET = 8'h 58;
  parameter logic [BlockAw-1:0] DMA_CLEAR_INT_BUS_OFFSET = 8'h 5c;
  parameter logic [BlockAw-1:0] DMA_INT_SOURCE_ADDR_0_OFFSET = 8'h 60;
  parameter logic [BlockAw-1:0] DMA_INT_SOURCE_ADDR_1_OFFSET = 8'h 64;
  parameter logic [BlockAw-1:0] DMA_INT_SOURCE_ADDR_2_OFFSET = 8'h 68;
  parameter logic [BlockAw-1:0] DMA_INT_SOURCE_ADDR_3_OFFSET = 8'h 6c;
  parameter logic [BlockAw-1:0] DMA_INT_SOURCE_ADDR_4_OFFSET = 8'h 70;
  parameter logic [BlockAw-1:0] DMA_INT_SOURCE_ADDR_5_OFFSET = 8'h 74;
  parameter logic [BlockAw-1:0] DMA_INT_SOURCE_ADDR_6_OFFSET = 8'h 78;
  parameter logic [BlockAw-1:0] DMA_INT_SOURCE_ADDR_7_OFFSET = 8'h 7c;
  parameter logic [BlockAw-1:0] DMA_INT_SOURCE_WR_VAL_0_OFFSET = 8'h 80;
  parameter logic [BlockAw-1:0] DMA_INT_SOURCE_WR_VAL_1_OFFSET = 8'h 84;
  parameter logic [BlockAw-1:0] DMA_INT_SOURCE_WR_VAL_2_OFFSET = 8'h 88;
  parameter logic [BlockAw-1:0] DMA_INT_SOURCE_WR_VAL_3_OFFSET = 8'h 8c;
  parameter logic [BlockAw-1:0] DMA_INT_SOURCE_WR_VAL_4_OFFSET = 8'h 90;
  parameter logic [BlockAw-1:0] DMA_INT_SOURCE_WR_VAL_5_OFFSET = 8'h 94;
  parameter logic [BlockAw-1:0] DMA_INT_SOURCE_WR_VAL_6_OFFSET = 8'h 98;
  parameter logic [BlockAw-1:0] DMA_INT_SOURCE_WR_VAL_7_OFFSET = 8'h 9c;
  parameter logic [BlockAw-1:0] DMA_SHA2_DIGEST_0_OFFSET = 8'h a0;
  parameter logic [BlockAw-1:0] DMA_SHA2_DIGEST_1_OFFSET = 8'h a4;
  parameter logic [BlockAw-1:0] DMA_SHA2_DIGEST_2_OFFSET = 8'h a8;
  parameter logic [BlockAw-1:0] DMA_SHA2_DIGEST_3_OFFSET = 8'h ac;
  parameter logic [BlockAw-1:0] DMA_SHA2_DIGEST_4_OFFSET = 8'h b0;
  parameter logic [BlockAw-1:0] DMA_SHA2_DIGEST_5_OFFSET = 8'h b4;
  parameter logic [BlockAw-1:0] DMA_SHA2_DIGEST_6_OFFSET = 8'h b8;
  parameter logic [BlockAw-1:0] DMA_SHA2_DIGEST_7_OFFSET = 8'h bc;
  parameter logic [BlockAw-1:0] DMA_SHA2_DIGEST_8_OFFSET = 8'h c0;
  parameter logic [BlockAw-1:0] DMA_SHA2_DIGEST_9_OFFSET = 8'h c4;
  parameter logic [BlockAw-1:0] DMA_SHA2_DIGEST_10_OFFSET = 8'h c8;
  parameter logic [BlockAw-1:0] DMA_SHA2_DIGEST_11_OFFSET = 8'h cc;
  parameter logic [BlockAw-1:0] DMA_SHA2_DIGEST_12_OFFSET = 8'h d0;
  parameter logic [BlockAw-1:0] DMA_SHA2_DIGEST_13_OFFSET = 8'h d4;
  parameter logic [BlockAw-1:0] DMA_SHA2_DIGEST_14_OFFSET = 8'h d8;
  parameter logic [BlockAw-1:0] DMA_SHA2_DIGEST_15_OFFSET = 8'h dc;

  // Reset values for hwext registers and their fields
  parameter logic [2:0] DMA_INTR_TEST_RESVAL = 3'h 0;
  parameter logic [0:0] DMA_INTR_TEST_DMA_DONE_RESVAL = 1'h 0;
  parameter logic [0:0] DMA_INTR_TEST_DMA_ERROR_RESVAL = 1'h 0;
  parameter logic [0:0] DMA_INTR_TEST_DMA_MEMORY_BUFFER_LIMIT_RESVAL = 1'h 0;
  parameter logic [0:0] DMA_ALERT_TEST_RESVAL = 1'h 0;
  parameter logic [0:0] DMA_ALERT_TEST_FATAL_FAULT_RESVAL = 1'h 0;

  // Register index
  typedef enum int {
    DMA_INTR_STATE,
    DMA_INTR_ENABLE,
    DMA_INTR_TEST,
    DMA_ALERT_TEST,
    DMA_SOURCE_ADDRESS_LO,
    DMA_SOURCE_ADDRESS_HI,
    DMA_DESTINATION_ADDRESS_LO,
    DMA_DESTINATION_ADDRESS_HI,
    DMA_ADDRESS_SPACE_ID,
    DMA_ENABLED_MEMORY_RANGE_BASE,
    DMA_ENABLED_MEMORY_RANGE_LIMIT,
    DMA_RANGE_UNLOCK_REGWEN,
    DMA_TOTAL_DATA_SIZE,
    DMA_TRANSFER_WIDTH,
    DMA_DESTINATION_ADDRESS_LIMIT_LO,
    DMA_DESTINATION_ADDRESS_LIMIT_HI,
    DMA_DESTINATION_ADDRESS_ALMOST_LIMIT_LO,
    DMA_DESTINATION_ADDRESS_ALMOST_LIMIT_HI,
    DMA_CONTROL,
    DMA_STATUS,
    DMA_CLEAR_STATE,
    DMA_HANDSHAKE_INTERRUPT_ENABLE,
    DMA_CLEAR_INT_SRC,
    DMA_CLEAR_INT_BUS,
    DMA_INT_SOURCE_ADDR_0,
    DMA_INT_SOURCE_ADDR_1,
    DMA_INT_SOURCE_ADDR_2,
    DMA_INT_SOURCE_ADDR_3,
    DMA_INT_SOURCE_ADDR_4,
    DMA_INT_SOURCE_ADDR_5,
    DMA_INT_SOURCE_ADDR_6,
    DMA_INT_SOURCE_ADDR_7,
    DMA_INT_SOURCE_WR_VAL_0,
    DMA_INT_SOURCE_WR_VAL_1,
    DMA_INT_SOURCE_WR_VAL_2,
    DMA_INT_SOURCE_WR_VAL_3,
    DMA_INT_SOURCE_WR_VAL_4,
    DMA_INT_SOURCE_WR_VAL_5,
    DMA_INT_SOURCE_WR_VAL_6,
    DMA_INT_SOURCE_WR_VAL_7,
    DMA_SHA2_DIGEST_0,
    DMA_SHA2_DIGEST_1,
    DMA_SHA2_DIGEST_2,
    DMA_SHA2_DIGEST_3,
    DMA_SHA2_DIGEST_4,
    DMA_SHA2_DIGEST_5,
    DMA_SHA2_DIGEST_6,
    DMA_SHA2_DIGEST_7,
    DMA_SHA2_DIGEST_8,
    DMA_SHA2_DIGEST_9,
    DMA_SHA2_DIGEST_10,
    DMA_SHA2_DIGEST_11,
    DMA_SHA2_DIGEST_12,
    DMA_SHA2_DIGEST_13,
    DMA_SHA2_DIGEST_14,
    DMA_SHA2_DIGEST_15
  } dma_id_e;

  // Register width information to check illegal writes
  parameter logic [3:0] DMA_PERMIT [56] = '{
    4'b 0001, // index[ 0] DMA_INTR_STATE
    4'b 0001, // index[ 1] DMA_INTR_ENABLE
    4'b 0001, // index[ 2] DMA_INTR_TEST
    4'b 0001, // index[ 3] DMA_ALERT_TEST
    4'b 1111, // index[ 4] DMA_SOURCE_ADDRESS_LO
    4'b 1111, // index[ 5] DMA_SOURCE_ADDRESS_HI
    4'b 1111, // index[ 6] DMA_DESTINATION_ADDRESS_LO
    4'b 1111, // index[ 7] DMA_DESTINATION_ADDRESS_HI
    4'b 0001, // index[ 8] DMA_ADDRESS_SPACE_ID
    4'b 1111, // index[ 9] DMA_ENABLED_MEMORY_RANGE_BASE
    4'b 1111, // index[10] DMA_ENABLED_MEMORY_RANGE_LIMIT
    4'b 0001, // index[11] DMA_RANGE_UNLOCK_REGWEN
    4'b 1111, // index[12] DMA_TOTAL_DATA_SIZE
    4'b 0001, // index[13] DMA_TRANSFER_WIDTH
    4'b 1111, // index[14] DMA_DESTINATION_ADDRESS_LIMIT_LO
    4'b 1111, // index[15] DMA_DESTINATION_ADDRESS_LIMIT_HI
    4'b 1111, // index[16] DMA_DESTINATION_ADDRESS_ALMOST_LIMIT_LO
    4'b 1111, // index[17] DMA_DESTINATION_ADDRESS_ALMOST_LIMIT_HI
    4'b 1111, // index[18] DMA_CONTROL
    4'b 0011, // index[19] DMA_STATUS
    4'b 0001, // index[20] DMA_CLEAR_STATE
    4'b 1111, // index[21] DMA_HANDSHAKE_INTERRUPT_ENABLE
    4'b 0001, // index[22] DMA_CLEAR_INT_SRC
    4'b 0001, // index[23] DMA_CLEAR_INT_BUS
    4'b 1111, // index[24] DMA_INT_SOURCE_ADDR_0
    4'b 1111, // index[25] DMA_INT_SOURCE_ADDR_1
    4'b 1111, // index[26] DMA_INT_SOURCE_ADDR_2
    4'b 1111, // index[27] DMA_INT_SOURCE_ADDR_3
    4'b 1111, // index[28] DMA_INT_SOURCE_ADDR_4
    4'b 1111, // index[29] DMA_INT_SOURCE_ADDR_5
    4'b 1111, // index[30] DMA_INT_SOURCE_ADDR_6
    4'b 1111, // index[31] DMA_INT_SOURCE_ADDR_7
    4'b 1111, // index[32] DMA_INT_SOURCE_WR_VAL_0
    4'b 1111, // index[33] DMA_INT_SOURCE_WR_VAL_1
    4'b 1111, // index[34] DMA_INT_SOURCE_WR_VAL_2
    4'b 1111, // index[35] DMA_INT_SOURCE_WR_VAL_3
    4'b 1111, // index[36] DMA_INT_SOURCE_WR_VAL_4
    4'b 1111, // index[37] DMA_INT_SOURCE_WR_VAL_5
    4'b 1111, // index[38] DMA_INT_SOURCE_WR_VAL_6
    4'b 1111, // index[39] DMA_INT_SOURCE_WR_VAL_7
    4'b 1111, // index[40] DMA_SHA2_DIGEST_0
    4'b 1111, // index[41] DMA_SHA2_DIGEST_1
    4'b 1111, // index[42] DMA_SHA2_DIGEST_2
    4'b 1111, // index[43] DMA_SHA2_DIGEST_3
    4'b 1111, // index[44] DMA_SHA2_DIGEST_4
    4'b 1111, // index[45] DMA_SHA2_DIGEST_5
    4'b 1111, // index[46] DMA_SHA2_DIGEST_6
    4'b 1111, // index[47] DMA_SHA2_DIGEST_7
    4'b 1111, // index[48] DMA_SHA2_DIGEST_8
    4'b 1111, // index[49] DMA_SHA2_DIGEST_9
    4'b 1111, // index[50] DMA_SHA2_DIGEST_10
    4'b 1111, // index[51] DMA_SHA2_DIGEST_11
    4'b 1111, // index[52] DMA_SHA2_DIGEST_12
    4'b 1111, // index[53] DMA_SHA2_DIGEST_13
    4'b 1111, // index[54] DMA_SHA2_DIGEST_14
    4'b 1111  // index[55] DMA_SHA2_DIGEST_15
  };

endpackage
