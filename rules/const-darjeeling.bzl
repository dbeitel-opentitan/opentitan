# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0

# Must match with top_darjeeling_alert_id in hw/top_darjeeling/sw/autogen/top_darjeeling.h
# The order of this list must match the order of the alerts in the OTP. Do not
# use a set here.
DARJEELING_ALERTS = [
    "uart0_fatal_fault",
    "gpio_fatal_fault",
    "spi_device_fatal_fault",
    "i2c0_fatal_fault",
    "rv_timer_fatal_fault",
    "otp_ctrl_fatal_macro_error",
    "otp_ctrl_fatal_check_error",
    "otp_ctrl_fatal_bus_integ_error",
    "otp_ctrl_fatal_prim_otp_alert",
    "otp_ctrl_recov_prim_otp_alert",
    "lc_ctrl_fatal_prog_error",
    "lc_ctrl_fatal_state_error",
    "lc_ctrl_fatal_bus_integ_error",
    "spi_host0_fatal_fault",
    "spi_host1_fatal_fault",
    "usbdev_fatal_fault",
    "pwrmgr_aon_fatal_fault",
    "rstmgr_aon_fatal_fault",
    "rstmgr_aon_fatal_cnsty_fault",
    "clkmgr_aon_recov_fault",
    "clkmgr_aon_fatal_fault",
    "pinmux_aon_fatal_fault",
    "aon_timer_aon_fatal_fault",
    "sensor_ctrl_recov_alert",
    "sensor_ctrl_fatal_alert",
    "soc_proxy_fatal_alert_intg",
    "soc_proxy_fatal_alert_external0",
    "soc_proxy_fatal_alert_external1",
    "soc_proxy_fatal_alert_external2",
    "soc_proxy_fatal_alert_external3",
    "soc_proxy_fatal_alert_external4",
    "soc_proxy_fatal_alert_external5",
    "soc_proxy_fatal_alert_external6",
    "soc_proxy_fatal_alert_external7",
    "soc_proxy_recov_alert_external0",
    "soc_proxy_recov_alert_external1",
    "soc_proxy_recov_alert_external2",
    "soc_proxy_recov_alert_external3",
    "soc_proxy_recov_alert_external4",
    "soc_proxy_recov_alert_external5",
    "soc_proxy_recov_alert_external6",
    "soc_proxy_recov_alert_external7",
    "sram_ctrl_ret_aon_fatal_error",
    "rv_dm_fatal_fault",
    "rv_plic_fatal_fault",
    "aes_recov_ctrl_update_err",
    "aes_fatal_fault",
    "hmac_fatal_fault",
    "kmac_recov_operation_err",
    "kmac_fatal_fault_err",
    "otbn_fatal",
    "otbn_recov",
    "keymgr_recov_operation_err",
    "keymgr_fatal_fault_err",
    "csrng_recov_alert",
    "csrng_fatal_alert",
    "edn0_recov_alert",
    "edn0_fatal_alert",
    "edn1_recov_alert",
    "edn1_fatal_alert",
    "sram_ctrl_main_fatal_error",
    "sram_ctrl_mbx_fatal_error",
    "rom_ctrl0_fatal",
    "rom_ctrl1_fatal",
    "dma_fatal_fault",
    "mbx0_fatal_fault",
    "mbx0_recov_fault",
    "mbx1_fatal_fault",
    "mbx1_recov_fault",
    "mbx2_fatal_fault",
    "mbx2_recov_fault",
    "mbx3_fatal_fault",
    "mbx3_recov_fault",
    "mbx4_fatal_fault",
    "mbx4_recov_fault",
    "mbx5_fatal_fault",
    "mbx5_recov_fault",
    "mbx6_fatal_fault",
    "mbx6_recov_fault",
    "mbx_jtag_fatal_fault",
    "mbx_jtag_recov_fault",
    "mbx_pcie0_fatal_fault",
    "mbx_pcie0_recov_fault",
    "mbx_pcie1_fatal_fault",
    "mbx_pcie1_recov_fault",
    "rv_core_ibex_fatal_sw_err",
    "rv_core_ibex_recov_sw_err",
    "rv_core_ibex_fatal_hw_err",
    "rv_core_ibex_recov_hw_err",
]

# Must match with hw/top_darjeeling/ip_autogen/alert_handler/data/alert_handler.hjson
# The order of this list must match the order of the alerts in the OTP. Do not
# use a set here.
DARJEELING_LOC_ALERTS = [
    "alert_pingfail",
    "esc_pingfail",
    "alert_integfail",
    "esc_integfail",
    "bus_integfail",
    "shadow_reg_update_error",
    "shadow_reg_storage_error",
    "loc_dummy7",
    "loc_dummy8",
    "loc_dummy9",
    "loc_dummy10",
    "loc_dummy11",
    "loc_dummy12",
    "loc_dummy13",
    "loc_dummy14",
    "loc_dummy15",
]

DARJEELING_OPENTITANTOOL_OPENOCD_TEST_CMDS = [
    "--openocd=\"$(rootpath //third_party/openocd:openocd_bin)\"",
    "--openocd-adapter-config=\"$(rootpath //third_party/openocd:jtag_adapter_cfg)\"",
    "--openocd-riscv-target-config=\"$(rootpath //util/openocd/target:lowrisc-darjeeling.cfg)\"",
    "--openocd-lc-target-config=\"$(rootpath //util/openocd/target:lowrisc-darjeeling-lc.cfg)\"",
]
DARJEELING_OPENTITANTOOL_OPENOCD_DATA_DEPS = [
    "//third_party/openocd:jtag_adapter_cfg",
    "//third_party/openocd:openocd_bin",
    "//util/openocd/target:lowrisc-darjeeling.cfg",
    "//util/openocd/target:lowrisc-darjeeling-lc.cfg",
]
