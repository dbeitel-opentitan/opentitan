// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Package auto-generated by `reggen` containing data structure

package mbx_reg_pkg;

  // Param list
  parameter int NumAlerts = 1;

  // Address widths within the block
  parameter int HostAw = 6;
  parameter int SysAw = 5;

  ///////////////////////////////////////////////
  // Typedefs for registers for host interface //
  ///////////////////////////////////////////////

  typedef struct packed {
    logic        q;
  } mbx_reg2hw_intr_state_reg_t;

  typedef struct packed {
    logic        q;
  } mbx_reg2hw_intr_enable_reg_t;

  typedef struct packed {
    logic        q;
    logic        qe;
  } mbx_reg2hw_intr_test_reg_t;

  typedef struct packed {
    logic        q;
    logic        qe;
  } mbx_reg2hw_alert_test_reg_t;

  typedef struct packed {
    struct packed {
      logic        q;
      logic        qe;
    } abort;
    struct packed {
      logic        q;
      logic        qe;
    } doe_intr_en;
  } mbx_reg2hw_control_reg_t;

  typedef struct packed {
    struct packed {
      logic        q;
      logic        qe;
    } busy;
    struct packed {
      logic        q;
      logic        qe;
    } doe_intr_status;
    struct packed {
      logic        q;
      logic        qe;
    } error;
    struct packed {
      logic        q;
      logic        qe;
    } async_msg_status;
    struct packed {
      logic        q;
      logic        qe;
    } ready;
  } mbx_reg2hw_status_reg_t;

  typedef struct packed {
    logic        q;
  } mbx_reg2hw_address_range_regwen_reg_t;

  typedef struct packed {
    logic        q;
  } mbx_reg2hw_address_range_valid_reg_t;

  typedef struct packed {
    logic [29:0] q;
    logic        qe;
  } mbx_reg2hw_inbound_base_address_reg_t;

  typedef struct packed {
    logic [29:0] q;
    logic        qe;
  } mbx_reg2hw_inbound_limit_address_reg_t;

  typedef struct packed {
    logic [29:0] q;
    logic        qe;
  } mbx_reg2hw_inbound_write_ptr_reg_t;

  typedef struct packed {
    logic [29:0] q;
    logic        qe;
  } mbx_reg2hw_outbound_base_address_reg_t;

  typedef struct packed {
    logic [29:0] q;
    logic        qe;
  } mbx_reg2hw_outbound_limit_address_reg_t;

  typedef struct packed {
    logic [29:0] q;
    logic        qe;
  } mbx_reg2hw_outbound_read_ptr_reg_t;

  typedef struct packed {
    logic [10:0] q;
    logic        qe;
  } mbx_reg2hw_outbound_object_size_reg_t;

  typedef struct packed {
    logic        d;
    logic        de;
  } mbx_hw2reg_intr_state_reg_t;

  typedef struct packed {
    struct packed {
      logic        d;
    } abort;
    struct packed {
      logic        d;
    } doe_intr_en;
  } mbx_hw2reg_control_reg_t;

  typedef struct packed {
    struct packed {
      logic        d;
    } busy;
    struct packed {
      logic        d;
    } doe_intr_status;
    struct packed {
      logic        d;
    } error;
    struct packed {
      logic        d;
    } async_msg_status;
    struct packed {
      logic        d;
    } ready;
  } mbx_hw2reg_status_reg_t;

  typedef struct packed {
    logic [29:0] d;
  } mbx_hw2reg_inbound_write_ptr_reg_t;

  typedef struct packed {
    logic [29:0] d;
  } mbx_hw2reg_outbound_read_ptr_reg_t;

  typedef struct packed {
    logic [10:0] d;
    logic        de;
  } mbx_hw2reg_outbound_object_size_reg_t;

  // Register -> HW type for host interface
  typedef struct packed {
    mbx_reg2hw_intr_state_reg_t intr_state; // [219:219]
    mbx_reg2hw_intr_enable_reg_t intr_enable; // [218:218]
    mbx_reg2hw_intr_test_reg_t intr_test; // [217:216]
    mbx_reg2hw_alert_test_reg_t alert_test; // [215:214]
    mbx_reg2hw_control_reg_t control; // [213:210]
    mbx_reg2hw_status_reg_t status; // [209:200]
    mbx_reg2hw_address_range_regwen_reg_t address_range_regwen; // [199:199]
    mbx_reg2hw_address_range_valid_reg_t address_range_valid; // [198:198]
    mbx_reg2hw_inbound_base_address_reg_t inbound_base_address; // [197:167]
    mbx_reg2hw_inbound_limit_address_reg_t inbound_limit_address; // [166:136]
    mbx_reg2hw_inbound_write_ptr_reg_t inbound_write_ptr; // [135:105]
    mbx_reg2hw_outbound_base_address_reg_t outbound_base_address; // [104:74]
    mbx_reg2hw_outbound_limit_address_reg_t outbound_limit_address; // [73:43]
    mbx_reg2hw_outbound_read_ptr_reg_t outbound_read_ptr; // [42:12]
    mbx_reg2hw_outbound_object_size_reg_t outbound_object_size; // [11:0]
  } mbx_host_reg2hw_t;

  // HW -> register type for host interface
  typedef struct packed {
    mbx_hw2reg_intr_state_reg_t intr_state; // [80:79]
    mbx_hw2reg_control_reg_t control; // [78:77]
    mbx_hw2reg_status_reg_t status; // [76:72]
    mbx_hw2reg_inbound_write_ptr_reg_t inbound_write_ptr; // [71:42]
    mbx_hw2reg_outbound_read_ptr_reg_t outbound_read_ptr; // [41:12]
    mbx_hw2reg_outbound_object_size_reg_t outbound_object_size; // [11:0]
  } mbx_host_hw2reg_t;

  // Register offsets for host interface
  parameter logic [HostAw-1:0] MBX_INTR_STATE_OFFSET = 6'h 0;
  parameter logic [HostAw-1:0] MBX_INTR_ENABLE_OFFSET = 6'h 4;
  parameter logic [HostAw-1:0] MBX_INTR_TEST_OFFSET = 6'h 8;
  parameter logic [HostAw-1:0] MBX_ALERT_TEST_OFFSET = 6'h c;
  parameter logic [HostAw-1:0] MBX_CONTROL_OFFSET = 6'h 10;
  parameter logic [HostAw-1:0] MBX_STATUS_OFFSET = 6'h 14;
  parameter logic [HostAw-1:0] MBX_ADDRESS_RANGE_REGWEN_OFFSET = 6'h 18;
  parameter logic [HostAw-1:0] MBX_ADDRESS_RANGE_VALID_OFFSET = 6'h 1c;
  parameter logic [HostAw-1:0] MBX_INBOUND_BASE_ADDRESS_OFFSET = 6'h 20;
  parameter logic [HostAw-1:0] MBX_INBOUND_LIMIT_ADDRESS_OFFSET = 6'h 24;
  parameter logic [HostAw-1:0] MBX_INBOUND_WRITE_PTR_OFFSET = 6'h 28;
  parameter logic [HostAw-1:0] MBX_OUTBOUND_BASE_ADDRESS_OFFSET = 6'h 2c;
  parameter logic [HostAw-1:0] MBX_OUTBOUND_LIMIT_ADDRESS_OFFSET = 6'h 30;
  parameter logic [HostAw-1:0] MBX_OUTBOUND_READ_PTR_OFFSET = 6'h 34;
  parameter logic [HostAw-1:0] MBX_OUTBOUND_OBJECT_SIZE_OFFSET = 6'h 38;

  // Reset values for hwext registers and their fields for host interface
  parameter logic [0:0] MBX_INTR_TEST_RESVAL = 1'h 0;
  parameter logic [0:0] MBX_INTR_TEST_MBX_READY_RESVAL = 1'h 0;
  parameter logic [0:0] MBX_ALERT_TEST_RESVAL = 1'h 0;
  parameter logic [0:0] MBX_ALERT_TEST_FATAL_FAULT_RESVAL = 1'h 0;
  parameter logic [1:0] MBX_CONTROL_RESVAL = 2'h 0;
  parameter logic [0:0] MBX_CONTROL_ABORT_RESVAL = 1'h 0;
  parameter logic [0:0] MBX_CONTROL_DOE_INTR_EN_RESVAL = 1'h 0;
  parameter logic [31:0] MBX_STATUS_RESVAL = 32'h 1;
  parameter logic [0:0] MBX_STATUS_BUSY_RESVAL = 1'h 1;
  parameter logic [0:0] MBX_STATUS_DOE_INTR_STATUS_RESVAL = 1'h 0;
  parameter logic [0:0] MBX_STATUS_ERROR_RESVAL = 1'h 0;
  parameter logic [0:0] MBX_STATUS_ASYNC_MSG_STATUS_RESVAL = 1'h 0;
  parameter logic [0:0] MBX_STATUS_READY_RESVAL = 1'h 0;
  parameter logic [31:0] MBX_INBOUND_WRITE_PTR_RESVAL = 32'h 0;
  parameter logic [29:0] MBX_INBOUND_WRITE_PTR_INBOUND_READ_PTR_RESVAL = 30'h 0;
  parameter logic [31:0] MBX_OUTBOUND_READ_PTR_RESVAL = 32'h 0;
  parameter logic [29:0] MBX_OUTBOUND_READ_PTR_OUTBOUND_WRITE_PTR_RESVAL = 30'h 0;

  // Register index for host interface
  typedef enum int {
    MBX_INTR_STATE,
    MBX_INTR_ENABLE,
    MBX_INTR_TEST,
    MBX_ALERT_TEST,
    MBX_CONTROL,
    MBX_STATUS,
    MBX_ADDRESS_RANGE_REGWEN,
    MBX_ADDRESS_RANGE_VALID,
    MBX_INBOUND_BASE_ADDRESS,
    MBX_INBOUND_LIMIT_ADDRESS,
    MBX_INBOUND_WRITE_PTR,
    MBX_OUTBOUND_BASE_ADDRESS,
    MBX_OUTBOUND_LIMIT_ADDRESS,
    MBX_OUTBOUND_READ_PTR,
    MBX_OUTBOUND_OBJECT_SIZE
  } mbx_host_id_e;

  // Register width information to check illegal writes for host interface
  parameter logic [3:0] MBX_HOST_PERMIT [15] = '{
    4'b 0001, // index[ 0] MBX_INTR_STATE
    4'b 0001, // index[ 1] MBX_INTR_ENABLE
    4'b 0001, // index[ 2] MBX_INTR_TEST
    4'b 0001, // index[ 3] MBX_ALERT_TEST
    4'b 0001, // index[ 4] MBX_CONTROL
    4'b 1111, // index[ 5] MBX_STATUS
    4'b 0001, // index[ 6] MBX_ADDRESS_RANGE_REGWEN
    4'b 0001, // index[ 7] MBX_ADDRESS_RANGE_VALID
    4'b 1111, // index[ 8] MBX_INBOUND_BASE_ADDRESS
    4'b 1111, // index[ 9] MBX_INBOUND_LIMIT_ADDRESS
    4'b 1111, // index[10] MBX_INBOUND_WRITE_PTR
    4'b 1111, // index[11] MBX_OUTBOUND_BASE_ADDRESS
    4'b 1111, // index[12] MBX_OUTBOUND_LIMIT_ADDRESS
    4'b 1111, // index[13] MBX_OUTBOUND_READ_PTR
    4'b 0011  // index[14] MBX_OUTBOUND_OBJECT_SIZE
  };

  //////////////////////////////////////////////
  // Typedefs for registers for sys interface //
  //////////////////////////////////////////////

  typedef struct packed {
    struct packed {
      logic [15:0] q;
    } cap_id;
    struct packed {
      logic [3:0]  q;
    } cap_version;
    struct packed {
      logic [11:0] q;
    } next_capaility_offset;
  } mbx_reg2hw_extended_cap_header_reg_t;

  typedef struct packed {
    struct packed {
      logic        q;
    } doe_intr_support;
    struct packed {
      logic [10:0] q;
    } doe_intr_msg_nr;
  } mbx_reg2hw_cap_header_reg_t;

  typedef struct packed {
    struct packed {
      logic        q;
      logic        qe;
    } abort;
    struct packed {
      logic        q;
      logic        qe;
    } doe_intr_en;
    struct packed {
      logic        q;
      logic        qe;
    } async_msg_en;
    struct packed {
      logic        q;
      logic        qe;
    } go;
  } mbx_reg2hw_sys_control_reg_t;

  typedef struct packed {
    struct packed {
      logic        q;
    } busy;
    struct packed {
      logic        q;
      logic        qe;
    } doe_intr_status;
    struct packed {
      logic        q;
    } error;
    struct packed {
      logic        q;
    } async_msg_status;
    struct packed {
      logic        q;
    } ready;
  } mbx_reg2hw_sys_status_reg_t;

  typedef struct packed {
    struct packed {
      logic [15:0] d;
    } cap_id;
    struct packed {
      logic [3:0]  d;
    } cap_version;
    struct packed {
      logic [11:0] d;
    } next_capaility_offset;
  } mbx_hw2reg_extended_cap_header_reg_t;

  typedef struct packed {
    struct packed {
      logic        d;
      logic        de;
    } doe_intr_support;
    struct packed {
      logic [10:0] d;
      logic        de;
    } doe_intr_msg_nr;
  } mbx_hw2reg_cap_header_reg_t;

  typedef struct packed {
    struct packed {
      logic        d;
    } abort;
    struct packed {
      logic        d;
    } doe_intr_en;
    struct packed {
      logic        d;
    } async_msg_en;
    struct packed {
      logic        d;
    } go;
  } mbx_hw2reg_sys_control_reg_t;

  typedef struct packed {
    struct packed {
      logic        d;
      logic        de;
    } busy;
    struct packed {
      logic        d;
      logic        de;
    } doe_intr_status;
    struct packed {
      logic        d;
      logic        de;
    } error;
    struct packed {
      logic        d;
      logic        de;
    } async_msg_status;
    struct packed {
      logic        d;
      logic        de;
    } ready;
  } mbx_hw2reg_sys_status_reg_t;

  // Register -> HW type for sys interface
  typedef struct packed {
    mbx_reg2hw_extended_cap_header_reg_t extended_cap_header; // [57:26]
    mbx_reg2hw_cap_header_reg_t cap_header; // [25:14]
    mbx_reg2hw_sys_control_reg_t sys_control; // [13:6]
    mbx_reg2hw_sys_status_reg_t sys_status; // [5:0]
  } mbx_sys_reg2hw_t;

  // HW -> register type for sys interface
  typedef struct packed {
    mbx_hw2reg_extended_cap_header_reg_t extended_cap_header; // [59:28]
    mbx_hw2reg_cap_header_reg_t cap_header; // [27:14]
    mbx_hw2reg_sys_control_reg_t sys_control; // [13:10]
    mbx_hw2reg_sys_status_reg_t sys_status; // [9:0]
  } mbx_sys_hw2reg_t;

  // Register offsets for sys interface
  parameter logic [SysAw-1:0] MBX_EXTENDED_CAP_HEADER_OFFSET = 5'h 0;
  parameter logic [SysAw-1:0] MBX_CAP_HEADER_OFFSET = 5'h 4;
  parameter logic [SysAw-1:0] MBX_SYS_CONTROL_OFFSET = 5'h 8;
  parameter logic [SysAw-1:0] MBX_SYS_STATUS_OFFSET = 5'h c;

  // Reset values for hwext registers and their fields for sys interface
  parameter logic [31:0] MBX_EXTENDED_CAP_HEADER_RESVAL = 32'h 2002e;
  parameter logic [15:0] MBX_EXTENDED_CAP_HEADER_CAP_ID_RESVAL = 16'h 2e;
  parameter logic [3:0] MBX_EXTENDED_CAP_HEADER_CAP_VERSION_RESVAL = 4'h 2;
  parameter logic [11:0] MBX_EXTENDED_CAP_HEADER_NEXT_CAPAILITY_OFFSET_RESVAL = 12'h 0;
  parameter logic [31:0] MBX_SYS_CONTROL_RESVAL = 32'h 0;
  parameter logic [0:0] MBX_SYS_CONTROL_ABORT_RESVAL = 1'h 0;
  parameter logic [0:0] MBX_SYS_CONTROL_DOE_INTR_EN_RESVAL = 1'h 0;
  parameter logic [0:0] MBX_SYS_CONTROL_ASYNC_MSG_EN_RESVAL = 1'h 0;
  parameter logic [0:0] MBX_SYS_CONTROL_GO_RESVAL = 1'h 0;

  // Window parameters for sys interface
  parameter logic [SysAw-1:0] MBX_WDATA_OFFSET = 5'h 10;
  parameter int unsigned      MBX_WDATA_SIZE   = 'h 4;
  parameter int unsigned      MBX_WDATA_IDX    = 0;
  parameter logic [SysAw-1:0] MBX_RDATA_OFFSET = 5'h 14;
  parameter int unsigned      MBX_RDATA_SIZE   = 'h 4;
  parameter int unsigned      MBX_RDATA_IDX    = 1;

  // Register index for sys interface
  typedef enum int {
    MBX_EXTENDED_CAP_HEADER,
    MBX_CAP_HEADER,
    MBX_SYS_CONTROL,
    MBX_SYS_STATUS
  } mbx_sys_id_e;

  // Register width information to check illegal writes for sys interface
  parameter logic [3:0] MBX_SYS_PERMIT [4] = '{
    4'b 1111, // index[0] MBX_EXTENDED_CAP_HEADER
    4'b 0011, // index[1] MBX_CAP_HEADER
    4'b 1111, // index[2] MBX_SYS_CONTROL
    4'b 1111  // index[3] MBX_SYS_STATUS
  };

endpackage
