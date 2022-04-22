# Amazon FPGA Hardware Development Kit
#
# Copyright 2016 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Amazon Software License (the "License"). You may not use
# this file except in compliance with the License. A copy of the License is
# located at
#
#    http://aws.amazon.com/asl/
#
# or in the "license" file accompanying this file. This file is distributed on
# an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, express or
# implied. See the License for the specific language governing permissions and
# limitations under the License.

# TODO:
# Add check if CL_DIR and HDK_SHELL_DIR directories exist
# Add check if /build and /build/src_port_encryption directories exist
# Add check if the vivado_keyfile exist

set HDK_SHELL_DIR $::env(HDK_SHELL_DIR)
set HDK_SHELL_DESIGN_DIR $::env(HDK_SHELL_DESIGN_DIR)
set CL_DIR $::env(CL_DIR)

set TARGET_DIR $CL_DIR/build/src_post_encryption
set UNUSED_TEMPLATES_DIR $HDK_SHELL_DESIGN_DIR/interfaces


# Remove any previously encrypted files, that may no longer be used
if {[llength [glob -nocomplain -dir $TARGET_DIR *]] != 0} {
  eval file delete -force [glob $TARGET_DIR/*]
}

#---- Developr would replace this section with design files ----

## Change file names and paths below to reflect your CL area.  DO NOT include AWS RTL files.


file copy -force $CL_DIR/design/cl_id_defines.vh                               $TARGET_DIR
file copy -force $CL_DIR/design/cl_bus_pkg.sv                                  $TARGET_DIR
file copy -force $CL_DIR/design/cl_ocl_slv.sv                                  $TARGET_DIR
file copy -force $CL_DIR/design/axi_slv_defines.vh                             $TARGET_DIR
file copy -force $CL_DIR/design/cl_pciw_mstr_defines.vh                        $TARGET_DIR
file copy -force $CL_DIR/design/cl_pcir_mstr_defines.vh                        $TARGET_DIR
file copy -force $CL_DIR/design/cl_pci_common_defines.vh                       $TARGET_DIR
file copy -force $CL_DIR/design/dut.vh                                         $TARGET_DIR
file copy -force $CL_DIR/design/cl_dut_defines.vh                              $TARGET_DIR
file copy -force $CL_DIR/design/cl_pciw_mstr.sv                                $TARGET_DIR
file copy -force $CL_DIR/design/cl_pcir_mstr.sv                                $TARGET_DIR
file copy -force $CL_DIR/design/read_port.sv                                   $TARGET_DIR
file copy -force $CL_DIR/design/write_port.sv                                  $TARGET_DIR
file copy -force $CL_DIR/design/streamx.sv                                     $TARGET_DIR
file copy -force $CL_DIR/design/top_earlgrey_awsf1.sv                                $TARGET_DIR
file copy -force $CL_DIR/design/chip_earlgrey_awsf1.sv                                $TARGET_DIR




file copy -force $CL_DIR/synth-vivado/generated/lowrisc_prim_prim_pkg-impl_0.1/prim_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/synth-vivado/generated/lowrisc_prim_and2-impl_0/prim_and2.sv    $TARGET_DIR

file copy -force $CL_DIR/synth-vivado/generated/lowrisc_prim_buf-impl_0/prim_buf.sv    $TARGET_DIR

file copy -force $CL_DIR/synth-vivado/generated/lowrisc_prim_clock_buf-impl_0/prim_clock_buf.sv    $TARGET_DIR

file copy -force $CL_DIR/synth-vivado/generated/lowrisc_prim_clock_gating-impl_0/prim_clock_gating.sv    $TARGET_DIR

file copy -force $CL_DIR/synth-vivado/generated/lowrisc_prim_clock_inv-impl_0/prim_clock_inv.sv    $TARGET_DIR

file copy -force $CL_DIR/synth-vivado/generated/lowrisc_prim_clock_mux2-impl_0/prim_clock_mux2.sv    $TARGET_DIR

file copy -force $CL_DIR/synth-vivado/generated/lowrisc_prim_flop-impl_0/prim_flop.sv    $TARGET_DIR

file copy -force $CL_DIR/synth-vivado/generated/lowrisc_prim_flop_en-impl_0/prim_flop_en.sv    $TARGET_DIR

file copy -force $CL_DIR/synth-vivado/generated/lowrisc_prim_pad_attr-impl_0/prim_pad_attr.sv    $TARGET_DIR

file copy -force $CL_DIR/synth-vivado/generated/lowrisc_prim_pad_wrapper-impl_0/prim_pad_wrapper.sv    $TARGET_DIR

file copy -force $CL_DIR/synth-vivado/generated/lowrisc_prim_ram_1p-impl_0/prim_ram_1p.sv    $TARGET_DIR

file copy -force $CL_DIR/synth-vivado/generated/lowrisc_prim_ram_2p-impl_0/prim_ram_2p.sv    $TARGET_DIR

file copy -force $CL_DIR/synth-vivado/generated/lowrisc_prim_rom-impl_0/prim_rom.sv    $TARGET_DIR

file copy -force $CL_DIR/synth-vivado/generated/lowrisc_prim_usb_diff_rx-impl_0/prim_usb_diff_rx.sv    $TARGET_DIR

file copy -force $CL_DIR/synth-vivado/generated/lowrisc_prim_xnor2-impl_0/prim_xnor2.sv    $TARGET_DIR

file copy -force $CL_DIR/synth-vivado/generated/lowrisc_prim_xor2-impl_0/prim_xor2.sv    $TARGET_DIR

file copy -force $CL_DIR/synth-vivado/generated/lowrisc_prim_flash-impl_0/prim_flash.sv    $TARGET_DIR

file copy -force $CL_DIR/synth-vivado/generated/lowrisc_prim_otp-impl_0/prim_otp.sv    $TARGET_DIR





file copy -force $CL_DIR/src/lowrisc_constants_jtag_id_pkg_0/rtl/jtag_id_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_constants_top_pkg_0/rtl/top_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_dv_dv_fcov_macros_0/dv_fcov_macros.svh    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_dv_dv_macros_0/dv_macros.svh    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_dv_pins_if_0/pins_if.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ibex_ibex_pkg_0.1/rtl/ibex_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_entropy_src_pkg_0.1/rtl/entropy_src_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_jtag_pkg_0.1/rtl/jtag_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_spi_device_pkg_0.1/rtl/spi_device_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_device_pkg_0.1/rtl/spi_device_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_usbdev_pkg_0.1/rtl/usbdev_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_abstract_prim_pkg_0.1/prim_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_assert_0.1/rtl/prim_assert.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_assert_0.1/rtl/prim_assert_dummy_macros.svh    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_assert_0.1/rtl/prim_assert_yosys_macros.svh    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_assert_0.1/rtl/prim_assert_standard_macros.svh    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_assert_0.1/rtl/prim_assert_sec_cm.svh    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_assert_0.1/rtl/prim_flop_macros.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_cipher_pkg_0.1/rtl/prim_cipher_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_count_pkg_0.1/rtl/prim_count_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_crc32_0/rtl/prim_crc32.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_generic_and2_0/rtl/prim_generic_and2.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_generic_buf_0/rtl/prim_generic_buf.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_generic_clock_buf_0/rtl/prim_generic_clock_buf.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_generic_clock_gating_0/rtl/prim_generic_clock_gating.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_generic_flop_0/rtl/prim_generic_flop.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_generic_usb_diff_rx_0/rtl/prim_generic_usb_diff_rx.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_generic_xnor2_0/rtl/prim_generic_xnor2.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_generic_xor2_0/rtl/prim_generic_xor2.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_otp_pkg_0.1/rtl/prim_otp_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_pad_wrapper_pkg_0/rtl/prim_pad_wrapper_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_ram_1p_pkg_0/rtl/prim_ram_1p_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_ram_2p_pkg_0/rtl/prim_ram_2p_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_rom_pkg_0/rtl/prim_rom_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_sec_anchor_0.1/rtl/prim_sec_anchor_buf.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_sec_anchor_0.1/rtl/prim_sec_anchor_flop.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_22_16_dec.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_22_16_enc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_28_22_dec.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_28_22_enc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_39_32_dec.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_39_32_enc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_64_57_dec.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_64_57_enc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_72_64_dec.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_72_64_enc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_hamming_22_16_dec.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_hamming_22_16_enc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_hamming_39_32_dec.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_hamming_39_32_enc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_hamming_72_64_dec.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_hamming_72_64_enc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_hamming_76_68_dec.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_hamming_76_68_enc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_22_16_dec.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_22_16_enc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_28_22_dec.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_28_22_enc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_39_32_dec.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_39_32_enc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_64_57_dec.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_64_57_enc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_72_64_dec.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_72_64_enc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_hamming_22_16_dec.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_hamming_22_16_enc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_hamming_39_32_dec.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_hamming_39_32_enc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_hamming_72_64_dec.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_hamming_72_64_enc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_hamming_76_68_dec.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_secded_0.1/rtl/prim_secded_inv_hamming_76_68_enc.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_subreg_0/rtl/prim_subreg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_subreg_0/rtl/prim_subreg_arb.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_subreg_0/rtl/prim_reg_cdc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_subreg_0/rtl/prim_subreg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_subreg_0/rtl/prim_subreg_ext.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_subreg_0/rtl/prim_subreg_shadow.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_util_0.1/rtl/prim_util_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_util_get_scramble_params_0/rtl/prim_util_get_scramble_params.svh    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_util_memload_0/rtl/prim_util_memload.svh    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_xilinx_and2_0/rtl/prim_xilinx_and2.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_xilinx_buf_0/rtl/prim_xilinx_buf.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_xilinx_clock_buf_0/rtl/prim_xilinx_clock_buf.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_xilinx_clock_gating_0/rtl/prim_xilinx_clock_gating.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_xilinx_clock_mux2_0/rtl/prim_xilinx_clock_mux2.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_xilinx_flop_0/rtl/prim_xilinx_flop.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_xilinx_flop_en_0/rtl/prim_xilinx_flop_en.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_xilinx_xor2_0/rtl/prim_xilinx_xor2.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_systems_top_earlgrey_pkg_0.1/rtl/autogen/top_earlgrey_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ibex_ibex_icache_0.1/rtl/ibex_icache.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_lc_ctrl_state_pkg_0.1/rtl/lc_ctrl_state_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_rv_core_ibex_pkg_0.1/rtl/rv_core_ibex_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_arbiter_0/rtl/prim_arbiter_fixed.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_arbiter_0/rtl/prim_arbiter_ppc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_arbiter_0/rtl/prim_arbiter_tree.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_arbiter_0/rtl/prim_arbiter_tree_dup.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_cdc_rand_delay_0/rtl/prim_cdc_rand_delay.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_cipher_0/rtl/prim_subst_perm.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_cipher_0/rtl/prim_present.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_cipher_0/rtl/prim_prince.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_count_0/rtl/prim_count.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_generic_clock_mux2_0/rtl/prim_generic_clock_mux2.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_generic_flop_en_0/rtl/prim_generic_flop_en.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_generic_pad_attr_0/rtl/prim_generic_pad_attr.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_generic_pad_wrapper_0/rtl/prim_generic_pad_wrapper.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_generic_ram_1p_0/rtl/prim_generic_ram_1p.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_generic_ram_2p_0/rtl/prim_generic_ram_2p.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_generic_rom_0/rtl/prim_generic_rom.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_gf_mult_0/rtl/prim_gf_mult.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_lfsr_0.1/rtl/prim_lfsr.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_max_tree_0/rtl/prim_max_tree.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_msb_extend_0/rtl/prim_msb_extend.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_onehot_0/rtl/prim_onehot_enc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_onehot_0/rtl/prim_onehot_mux.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_onehot_check_0/rtl/prim_onehot_check.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_prim_dom_and_2share_0.1/rtl/prim_dom_and_2share.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_sparse_fsm_0/rtl/prim_sparse_fsm_flop.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_sum_tree_0/rtl/prim_sum_tree.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_xilinx_pad_attr_0/rtl/prim_xilinx_pad_attr.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_xilinx_pad_wrapper_0/rtl/prim_xilinx_pad_wrapper.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_xoshiro256pp_0/rtl/prim_xoshiro256pp.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_systems_physical_pads_0.1/rtl/physical_pads.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_abstract_and2_0/prim_and2.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_abstract_buf_0/prim_buf.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_abstract_clock_buf_0/prim_clock_buf.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_abstract_clock_gating_0/prim_clock_gating.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_abstract_clock_mux2_0/prim_clock_mux2.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_abstract_flop_0/prim_flop.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_abstract_flop_en_0/prim_flop_en.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_abstract_pad_attr_0/prim_pad_attr.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_abstract_pad_wrapper_0/prim_pad_wrapper.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_abstract_ram_2p_0/prim_ram_2p.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_abstract_rom_0/prim_rom.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_abstract_usb_diff_rx_0/prim_usb_diff_rx.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_abstract_xnor2_0/prim_xnor2.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_abstract_xor2_0/prim_xor2.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_badbit_ram_1p_0/prim_badbit_ram_1p.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_alu.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_branch_predict.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_compressed_decoder.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_controller.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_cs_registers.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_csr.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_counter.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_decoder.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_ex_block.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_fetch_fifo.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_id_stage.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_if_stage.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_load_store_unit.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_multdiv_fast.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_multdiv_slow.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_prefetch_buffer.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_pmp.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_wb_stage.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_dummy_instr.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_core.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ibex_ibex_core_0.1/rtl/ibex_pmp_reset_default.svh    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_abstract_ram_1p_0/prim_ram_1p.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_blanker_0/rtl/prim_blanker.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_double_lfsr_0/rtl/prim_double_lfsr.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_flop_2sync_0/rtl/prim_flop_2sync.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_generic_clock_inv_0/rtl/prim_generic_clock_inv.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_mubi_0.1/rtl/prim_mubi_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_mubi_0.1/rtl/prim_mubi4_sender.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_mubi_0.1/rtl/prim_mubi4_sync.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_mubi_0.1/rtl/prim_mubi4_dec.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_mubi_0.1/rtl/prim_mubi8_sender.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_mubi_0.1/rtl/prim_mubi8_sync.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_mubi_0.1/rtl/prim_mubi8_dec.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_mubi_0.1/rtl/prim_mubi12_sender.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_mubi_0.1/rtl/prim_mubi12_sync.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_mubi_0.1/rtl/prim_mubi12_dec.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_mubi_0.1/rtl/prim_mubi16_sender.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_mubi_0.1/rtl/prim_mubi16_sync.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_mubi_0.1/rtl/prim_mubi16_dec.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_ram_2p_async_adv_0.1/rtl/prim_ram_2p_async_adv.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_reg_we_check_0/rtl/prim_reg_we_check.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_rom_adv_0.1/rtl/prim_rom_adv.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_rom_ctrl_pkg_0.1/rtl/rom_ctrl_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_rom_ctrl_pkg_0.1/rtl/rom_ctrl_reg_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_abstract_clock_inv_0/prim_clock_inv.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_diff_decode_0/rtl/prim_diff_decode.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_edge_detector_0.1/rtl/prim_edge_detector.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_fifo_0/rtl/prim_fifo_async_sram_adapter.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_fifo_0/rtl/prim_fifo_async.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_fifo_0/rtl/prim_fifo_sync.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_fifo_0/rtl/prim_fifo_sync_cnt.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_ram_1p_adv_0.1/rtl/prim_ram_1p_adv.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_ram_2p_adv_0.1/rtl/prim_ram_2p_adv.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_tlul_headers_0.1/rtl/tlul_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_lc_ctrl_pkg_0.1/rtl/lc_ctrl_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_lc_ctrl_pkg_0.1/rtl/lc_ctrl_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_esc_0/rtl/prim_esc_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_esc_0/rtl/prim_esc_receiver.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_esc_0/rtl/prim_esc_sender.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_ram_1p_scr_0.1/rtl/prim_ram_1p_scr.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_systems_pinmux_reg_0.1/rtl/autogen/pinmux_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_pinmux_reg_0.1/rtl/autogen/pinmux_reg_top.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_systems_pwrmgr_reg_0.1/rtl/autogen/pwrmgr_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_pwrmgr_reg_0.1/rtl/autogen/pwrmgr_reg_top.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_systems_rstmgr_reg_0.1/rtl/autogen/rstmgr_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_rstmgr_reg_0.1/rtl/autogen/rstmgr_reg_top.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_tlul_trans_intg_0.1/rtl/tlul_data_integ_enc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_tlul_trans_intg_0.1/rtl/tlul_data_integ_dec.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_tlul_trans_intg_0.1/rtl/tlul_cmd_intg_gen.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_tlul_trans_intg_0.1/rtl/tlul_cmd_intg_chk.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_tlul_trans_intg_0.1/rtl/tlul_rsp_intg_gen.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_tlul_trans_intg_0.1/rtl/tlul_rsp_intg_chk.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ibex_ibex_top_0.1/rtl/ibex_register_file_ff.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ibex_ibex_top_0.1/rtl/ibex_register_file_fpga.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ibex_ibex_top_0.1/rtl/ibex_register_file_latch.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ibex_ibex_top_0.1/rtl/ibex_lockstep.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ibex_ibex_top_0.1/rtl/ibex_top.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_csrng_pkg_0.1/rtl/csrng_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_csrng_pkg_0.1/rtl/csrng_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_otp_ctrl_pkg_1.0/rtl/otp_ctrl_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otp_ctrl_pkg_1.0/rtl/otp_ctrl_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otp_ctrl_pkg_1.0/rtl/otp_ctrl_part_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_alert_0/rtl/prim_alert_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_alert_0/rtl/prim_alert_receiver.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_alert_0/rtl/prim_alert_sender.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_clock_div_0/rtl/prim_clock_div.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_lc_dec_0.1/rtl/prim_lc_dec.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_lc_sender_0.1/rtl/prim_lc_sender.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_lc_sync_0.1/rtl/prim_lc_sync.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_systems_ast_pkg_0/rtl/ast_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_tlul_common_0.1/rtl/tlul_fifo_sync.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_tlul_common_0.1/rtl/tlul_fifo_async.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_tlul_common_0.1/rtl/tlul_assert.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_tlul_common_0.1/rtl/tlul_err.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_tlul_common_0.1/rtl/tlul_assert_multiple.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_edn_pkg_0.1/rtl/edn_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_edn_pkg_0.1/rtl/edn_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_otbn_pkg_0.1/rtl/otbn_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_otp_ctrl_prim_reg_top_1.0/rtl/otp_ctrl_prim_reg_top.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_pwrmgr_pkg_0.1/rtl/pwrmgr_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_rv_plic_component_0.1/rtl/rv_plic_gateway.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_rv_plic_component_0.1/rtl/rv_plic_target.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_sram_ctrl_pkg_0.1/rtl/sram_ctrl_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_sram_ctrl_pkg_0.1/rtl/sram_ctrl_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_all_0.1/rtl/prim_clock_gating_sync.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_all_0.1/rtl/prim_sram_arbiter.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_all_0.1/rtl/prim_slicer.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_all_0.1/rtl/prim_sync_reqack.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_all_0.1/rtl/prim_sync_reqack_data.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_all_0.1/rtl/prim_sync_slow_fast.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_all_0.1/rtl/prim_keccak.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_all_0.1/rtl/prim_packer.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_all_0.1/rtl/prim_packer_fifo.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_all_0.1/rtl/prim_gate_gen.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_all_0.1/rtl/prim_pulse_sync.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_all_0.1/rtl/prim_filter.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_all_0.1/rtl/prim_filter_ctr.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_all_0.1/rtl/prim_intr_hw.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_tlul_adapter_reg_0.1/rtl/tlul_adapter_reg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_tlul_adapter_sram_0.1/rtl/tlul_sram_byte.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_tlul_adapter_sram_0.1/rtl/tlul_adapter_sram.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_tlul_lc_gate_0.1/rtl/tlul_lc_gate.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_tlul_socket_1n_0.1/rtl/tlul_err_resp.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_tlul_socket_1n_0.1/rtl/tlul_socket_1n.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_tlul_socket_m1_0.1/rtl/tlul_socket_m1.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_tlul_sram2tlul_0.1/rtl/sram2tlul.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_keymgr_pkg_0.1/rtl/keymgr_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_keymgr_pkg_0.1/rtl/keymgr_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_usb_fs_nb_pe_0.1/rtl/usb_consts_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_usb_fs_nb_pe_0.1/rtl/usb_fs_nb_in_pe.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_usb_fs_nb_pe_0.1/rtl/usb_fs_nb_out_pe.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_usb_fs_nb_pe_0.1/rtl/usb_fs_nb_pe.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_usb_fs_nb_pe_0.1/rtl/usb_fs_rx.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_usb_fs_nb_pe_0.1/rtl/usb_fs_tx.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_usb_fs_nb_pe_0.1/rtl/usb_fs_tx_mux.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_edn_req_0.1/rtl/prim_edn_req.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_generic_otp_0/rtl/prim_generic_otp.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_measure_0/rtl/prim_clock_meas.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_measure_0/rtl/prim_clock_timeout.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_systems_clkmgr_pkg_0.1/rtl/autogen/clkmgr_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_systems_flash_ctrl_pkg_0.1/rtl/autogen/flash_ctrl_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_flash_ctrl_pkg_0.1/rtl/autogen/flash_ctrl_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_tlul_adapter_host_0.1/rtl/tlul_adapter_host.sv    $TARGET_DIR

file copy -force $CL_DIR/src/pulp-platform_riscv-dbg_0.1_0/pulp_riscv_dbg/debug_rom/debug_rom.sv    $TARGET_DIR
file copy -force $CL_DIR/src/pulp-platform_riscv-dbg_0.1_0/pulp_riscv_dbg/debug_rom/debug_rom_one_scratch.sv    $TARGET_DIR

file copy -force $CL_DIR/src/pulp-platform_riscv-dbg_0.1_0/pulp_riscv_dbg/src/dm_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/pulp-platform_riscv-dbg_0.1_0/pulp_riscv_dbg/src/dm_sba.sv    $TARGET_DIR
file copy -force $CL_DIR/src/pulp-platform_riscv-dbg_0.1_0/pulp_riscv_dbg/src/dm_csrs.sv    $TARGET_DIR
file copy -force $CL_DIR/src/pulp-platform_riscv-dbg_0.1_0/pulp_riscv_dbg/src/dm_mem.sv    $TARGET_DIR
file copy -force $CL_DIR/src/pulp-platform_riscv-dbg_0.1_0/pulp_riscv_dbg/src/dmi_cdc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/pulp-platform_riscv-dbg_0.1_0/pulp_riscv_dbg/src/dmi_jtag.sv    $TARGET_DIR
file copy -force $CL_DIR/src/pulp-platform_riscv-dbg_0.1_0/pulp_riscv_dbg/src/dmi_jtag_tap.sv    $TARGET_DIR
file copy -force $CL_DIR/src/pulp-platform_riscv-dbg_0.1_0/pulp_riscv_dbg/src/dm_top.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_adc_ctrl_1.0/rtl/adc_ctrl_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_adc_ctrl_1.0/rtl/adc_ctrl_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_adc_ctrl_1.0/rtl/adc_ctrl_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_adc_ctrl_1.0/rtl/adc_ctrl_fsm.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_adc_ctrl_1.0/rtl/adc_ctrl_intr.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_adc_ctrl_1.0/rtl/adc_ctrl_core.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_adc_ctrl_1.0/rtl/adc_ctrl.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_ctrl_reg_shadowed.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_core.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_ctr.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_ctr_fsm.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_ctr_fsm_p.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_ctr_fsm_n.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_control.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_control_fsm.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_control_fsm_p.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_control_fsm_n.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_reg_status.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_sel_buf_chk.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_cipher_core.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_cipher_control.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_cipher_control_fsm.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_cipher_control_fsm_p.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_cipher_control_fsm_n.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_sub_bytes.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_sbox.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_sbox_lut.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_sbox_canright_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_sbox_canright.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_sbox_canright_masked_noreuse.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_sbox_canright_masked.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_sbox_dom.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_shift_rows.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_mix_columns.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_mix_single_column.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_key_expand.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_prng_clearing.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes_prng_masking.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aes_1.0/rtl/aes.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_aon_timer_0.1/rtl/aon_timer_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aon_timer_0.1/rtl/aon_timer_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aon_timer_0.1/rtl/aon_timer_core.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_aon_timer_0.1/rtl/aon_timer.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_clkmgr_components_0.1/rtl/clkmgr_byp.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_clkmgr_components_0.1/rtl/clkmgr_clk_status.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_clkmgr_components_0.1/rtl/clkmgr_meas_chk.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_clkmgr_components_0.1/rtl/clkmgr_root_ctrl.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_clkmgr_components_0.1/rtl/clkmgr_trans.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_edn_0.1/rtl/edn_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_edn_0.1/rtl/edn_ack_sm.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_edn_0.1/rtl/edn_main_sm.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_edn_0.1/rtl/edn_core.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_edn_0.1/rtl/edn.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_flash_ctrl_pkg_0.1/rtl/flash_phy_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_gpio_0.1/rtl/gpio_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_gpio_0.1/rtl/gpio.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_gpio_0.1/rtl/gpio_reg_top.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_hmac_0.1/rtl/hmac_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_hmac_0.1/rtl/sha2.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_hmac_0.1/rtl/sha2_pad.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_hmac_0.1/rtl/hmac_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_hmac_0.1/rtl/hmac_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_hmac_0.1/rtl/hmac_core.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_hmac_0.1/rtl/hmac.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_i2c_0.1/rtl/i2c_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_i2c_0.1/rtl/i2c_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_i2c_0.1/rtl/i2c_core.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_i2c_0.1/rtl/i2c_fsm.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_i2c_0.1/rtl/i2c.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_otbn_0.1/rtl/otbn_controller.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otbn_0.1/rtl/otbn_decoder.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otbn_0.1/rtl/otbn_predecode.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otbn_0.1/rtl/otbn_instruction_fetch.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otbn_0.1/rtl/otbn_rf_base.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otbn_0.1/rtl/otbn_rf_bignum.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otbn_0.1/rtl/otbn_rf_base_ff.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otbn_0.1/rtl/otbn_rf_bignum_ff.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otbn_0.1/rtl/otbn_rf_base_fpga.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otbn_0.1/rtl/otbn_rf_bignum_fpga.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otbn_0.1/rtl/otbn_lsu.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otbn_0.1/rtl/otbn_alu_base.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otbn_0.1/rtl/otbn_alu_bignum.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otbn_0.1/rtl/otbn_mac_bignum.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otbn_0.1/rtl/otbn_loop_controller.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otbn_0.1/rtl/otbn_stack.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otbn_0.1/rtl/otbn_rnd.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otbn_0.1/rtl/otbn_start_stop_control.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otbn_0.1/rtl/otbn_core.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otbn_0.1/rtl/otbn_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otbn_0.1/rtl/otbn_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otbn_0.1/rtl/otbn_scramble_ctrl.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otbn_0.1/rtl/otbn.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_pattgen_0.1/rtl/pattgen_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_pattgen_0.1/rtl/pattgen_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_pattgen_0.1/rtl/pattgen_ctrl_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_pattgen_0.1/rtl/pattgen_core.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_pattgen_0.1/rtl/pattgen_chan.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_pattgen_0.1/rtl/pattgen.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_pwm_0.1/rtl/pwm_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_pwm_0.1/rtl/pwm_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_pwm_0.1/rtl/pwm_chan.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_pwm_0.1/rtl/pwm_core.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_pwm_0.1/rtl/pwm.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_rv_dm_0.1/rtl/rv_dm_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_rv_dm_0.1/rtl/rv_dm_regs_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_rv_dm_0.1/rtl/rv_dm_rom_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_rv_dm_0.1/rtl/rv_dm.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_rv_timer_0.1/rtl/rv_timer_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_rv_timer_0.1/rtl/rv_timer_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_rv_timer_0.1/rtl/timer_core.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_rv_timer_0.1/rtl/rv_timer.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_sha3_0.1/rtl/sha3_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_sha3_0.1/rtl/keccak_round.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_sha3_0.1/rtl/keccak_2share.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_sha3_0.1/rtl/sha3pad.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_sha3_0.1/rtl/sha3.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_spi_device_0.1/rtl/spi_device_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_device_0.1/rtl/spi_fwm_rxf_ctrl.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_device_0.1/rtl/spi_fwm_txf_ctrl.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_device_0.1/rtl/spi_fwmode.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_device_0.1/rtl/spi_cmdparse.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_device_0.1/rtl/spid_readsram.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_device_0.1/rtl/spid_readbuffer.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_device_0.1/rtl/spi_readcmd.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_device_0.1/rtl/spi_passthrough.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_device_0.1/rtl/spid_status.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_device_0.1/rtl/spid_jedec.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_device_0.1/rtl/spid_addr_4b.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_device_0.1/rtl/spid_fifo2sram_adapter.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_device_0.1/rtl/spid_upload.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_device_0.1/rtl/spi_tpm.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_device_0.1/rtl/spi_s2p.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_device_0.1/rtl/spi_p2s.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_device_0.1/rtl/spi_device.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_spi_host_1.0/rtl/spi_host_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_host_1.0/rtl/spi_host_cmd_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_host_1.0/rtl/spi_host_shift_register.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_host_1.0/rtl/spi_host_byte_select.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_host_1.0/rtl/spi_host_byte_merge.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_host_1.0/rtl/spi_host_fsm.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_host_1.0/rtl/spi_host_core.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_host_1.0/rtl/spi_host_command_queue.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_host_1.0/rtl/spi_host_data_fifos.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_host_1.0/rtl/spi_host_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_host_1.0/rtl/spi_host_window.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_spi_host_1.0/rtl/spi_host.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_sram_ctrl_0.1/rtl/sram_ctrl_regs_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_sram_ctrl_0.1/rtl/sram_ctrl.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_sysrst_ctrl_1.0/rtl/sysrst_ctrl_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_sysrst_ctrl_1.0/rtl/sysrst_ctrl_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_sysrst_ctrl_1.0/rtl/sysrst_ctrl_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_sysrst_ctrl_1.0/rtl/sysrst_ctrl_autoblock.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_sysrst_ctrl_1.0/rtl/sysrst_ctrl_comboact.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_sysrst_ctrl_1.0/rtl/sysrst_ctrl_pin.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_sysrst_ctrl_1.0/rtl/sysrst_ctrl_keyintr.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_sysrst_ctrl_1.0/rtl/sysrst_ctrl_detect.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_sysrst_ctrl_1.0/rtl/sysrst_ctrl_combo.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_sysrst_ctrl_1.0/rtl/sysrst_ctrl_ulp.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_sysrst_ctrl_1.0/rtl/sysrst_ctrl.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_uart_0.1/rtl/uart_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_uart_0.1/rtl/uart_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_uart_0.1/rtl/uart_rx.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_uart_0.1/rtl/uart_tx.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_uart_0.1/rtl/uart_core.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_uart_0.1/rtl/uart.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_usbdev_0.1/rtl/usbdev_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_usbdev_0.1/rtl/usbdev_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_usbdev_0.1/rtl/usbdev_usbif.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_usbdev_0.1/rtl/usbdev_flop_2syncpulse.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_usbdev_0.1/rtl/usbdev_linkstate.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_usbdev_0.1/rtl/usbdev_iomux.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_usbdev_0.1/rtl/usbdev_aon_wake.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_usbdev_0.1/rtl/usbdev.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_opentitan_top_earlgrey_alert_handler_reg_0.1/rtl/alert_handler_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_opentitan_top_earlgrey_alert_handler_reg_0.1/rtl/alert_handler_reg_top.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_opentitan_top_earlgrey_rv_plic_0/rtl/rv_plic_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_opentitan_top_earlgrey_rv_plic_0/rtl/rv_plic_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_opentitan_top_earlgrey_rv_plic_0/rtl/rv_plic.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_abstract_otp_0/prim_otp.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_systems_sensor_ctrl_reg_0.1/rtl/sensor_ctrl_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_sensor_ctrl_reg_0.1/rtl/sensor_ctrl_reg_top.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_top_earlgrey_xbar_main_0.1/rtl/autogen/tl_main_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_top_earlgrey_xbar_main_0.1/rtl/autogen/xbar_main.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_top_earlgrey_xbar_peri_0.1/rtl/autogen/tl_peri_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_top_earlgrey_xbar_peri_0.1/rtl/autogen/xbar_peri.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_alert_handler_component_0.1/rtl/alert_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_alert_handler_component_0.1/rtl/alert_handler_reg_wrap.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_alert_handler_component_0.1/rtl/alert_handler_lpg_ctrl.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_alert_handler_component_0.1/rtl/alert_handler_class.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_alert_handler_component_0.1/rtl/alert_handler_ping_timer.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_alert_handler_component_0.1/rtl/alert_handler_esc_timer.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_alert_handler_component_0.1/rtl/alert_handler_accu.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_alert_handler_component_0.1/rtl/alert_handler.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_csrng_0.1/rtl/csrng_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_csrng_0.1/rtl/csrng_main_sm.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_csrng_0.1/rtl/csrng_state_db.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_csrng_0.1/rtl/csrng_cmd_stage.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_csrng_0.1/rtl/csrng_block_encrypt.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_csrng_0.1/rtl/csrng_ctr_drbg_cmd.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_csrng_0.1/rtl/csrng_ctr_drbg_upd.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_csrng_0.1/rtl/csrng_ctr_drbg_gen.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_csrng_0.1/rtl/csrng_core.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_csrng_0.1/rtl/csrng.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_entropy_src_0.1/rtl/entropy_src_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_entropy_src_0.1/rtl/entropy_src_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_entropy_src_0.1/rtl/entropy_src_watermark_reg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_entropy_src_0.1/rtl/entropy_src_field_en.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_entropy_src_0.1/rtl/entropy_src_cntr_reg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_entropy_src_0.1/rtl/entropy_src_ack_sm.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_entropy_src_0.1/rtl/entropy_src_main_sm.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_entropy_src_0.1/rtl/entropy_src_repcnt_ht.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_entropy_src_0.1/rtl/entropy_src_repcnts_ht.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_entropy_src_0.1/rtl/entropy_src_adaptp_ht.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_entropy_src_0.1/rtl/entropy_src_bucket_ht.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_entropy_src_0.1/rtl/entropy_src_markov_ht.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_entropy_src_0.1/rtl/entropy_src_core.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_entropy_src_0.1/rtl/entropy_src.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_kmac_pkg_0.1/rtl/kmac_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_pinmux_component_0.1/rtl/pinmux_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_pinmux_component_0.1/rtl/pinmux_wkup.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_pinmux_component_0.1/rtl/pinmux_jtag_buf.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_pinmux_component_0.1/rtl/pinmux_jtag_breakout.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_pinmux_component_0.1/rtl/pinmux_strap_sampling.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_pinmux_component_0.1/rtl/pinmux.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_pwrmgr_0.1/rtl/pwrmgr.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_pwrmgr_0.1/rtl/pwrmgr_cdc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_pwrmgr_0.1/rtl/pwrmgr_slow_fsm.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_pwrmgr_0.1/rtl/pwrmgr_fsm.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_pwrmgr_0.1/rtl/pwrmgr_wake_info.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_rv_core_ibex_0.1/rtl/rv_core_ibex_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_rv_core_ibex_0.1/rtl/rv_core_ibex_cfg_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_rv_core_ibex_0.1/rtl/rv_core_ibex.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_rv_core_ibex_0.1/rtl/rv_core_addr_trans.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_rv_core_ibex_0.1/rtl/ibex_pmp_reset.svh    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_generic_flash_0/rtl/prim_generic_flash_bank.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_prim_generic_flash_0/rtl/prim_generic_flash.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_systems_clkmgr_0.1/rtl/autogen/clkmgr_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_clkmgr_0.1/rtl/autogen/clkmgr_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_clkmgr_0.1/rtl/autogen/clkmgr.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_systems_flash_ctrl_0.1/rtl/autogen/flash_ctrl_core_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_flash_ctrl_0.1/rtl/autogen/flash_ctrl_region_cfg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_flash_ctrl_0.1/rtl/autogen/flash_ctrl.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_systems_sensor_ctrl_pkg_0.1/rtl/sensor_ctrl_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_keymgr_0.1/rtl/keymgr.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_keymgr_0.1/rtl/keymgr_ctrl.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_keymgr_0.1/rtl/keymgr_cfg_en.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_keymgr_0.1/rtl/keymgr_data_en_state.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_keymgr_0.1/rtl/keymgr_err.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_keymgr_0.1/rtl/keymgr_input_checks.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_keymgr_0.1/rtl/keymgr_kmac_if.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_keymgr_0.1/rtl/keymgr_op_state_ctrl.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_keymgr_0.1/rtl/keymgr_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_keymgr_0.1/rtl/keymgr_reseed_ctrl.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_keymgr_0.1/rtl/keymgr_sideload_key.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_keymgr_0.1/rtl/keymgr_sideload_key_ctrl.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_kmac_0.1/rtl/kmac_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_kmac_0.1/rtl/kmac_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_kmac_0.1/rtl/kmac_core.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_kmac_0.1/rtl/kmac_msgfifo.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_kmac_0.1/rtl/kmac_staterd.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_kmac_0.1/rtl/kmac_app.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_kmac_0.1/rtl/kmac_entropy.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_kmac_0.1/rtl/kmac_errchk.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_kmac_0.1/rtl/kmac.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_lc_ctrl_0.1/rtl/lc_ctrl_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_lc_ctrl_0.1/rtl/lc_ctrl_state_decode.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_lc_ctrl_0.1/rtl/lc_ctrl_state_transition.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_lc_ctrl_0.1/rtl/lc_ctrl_signal_decode.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_lc_ctrl_0.1/rtl/lc_ctrl_fsm.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_lc_ctrl_0.1/rtl/lc_ctrl_kmac_if.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_lc_ctrl_0.1/rtl/lc_ctrl.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_otp_ctrl_1.0/rtl/otp_ctrl_core_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otp_ctrl_1.0/rtl/otp_ctrl_ecc_reg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otp_ctrl_1.0/rtl/otp_ctrl_scrmbl.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otp_ctrl_1.0/rtl/otp_ctrl_lfsr_timer.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otp_ctrl_1.0/rtl/otp_ctrl_part_unbuf.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otp_ctrl_1.0/rtl/otp_ctrl_part_buf.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otp_ctrl_1.0/rtl/otp_ctrl_dai.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otp_ctrl_1.0/rtl/otp_ctrl_kdi.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otp_ctrl_1.0/rtl/otp_ctrl_lci.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_otp_ctrl_1.0/rtl/otp_ctrl.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_rom_ctrl_0.1/rtl/rom_ctrl_regs_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_rom_ctrl_0.1/rtl/rom_ctrl_rom_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_rom_ctrl_0.1/rtl/rom_ctrl.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_rom_ctrl_0.1/rtl/rom_ctrl_compare.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_rom_ctrl_0.1/rtl/rom_ctrl_counter.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_rom_ctrl_0.1/rtl/rom_ctrl_fsm.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_rom_ctrl_0.1/rtl/rom_ctrl_mux.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_rom_ctrl_0.1/rtl/rom_ctrl_scrambled_rom.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_abstract_flash_0/prim_flash.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_systems_padring_0.1/rtl/padring.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_systems_rstmgr_pkg_0.1/rtl/autogen/rstmgr_pkg.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_systems_sensor_ctrl_0.1/rtl/sensor_ctrl.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_flash_ctrl_0.1/rtl/flash_ctrl_erase.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_flash_ctrl_0.1/rtl/flash_ctrl_prog.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_flash_ctrl_0.1/rtl/flash_ctrl_rd.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_flash_ctrl_0.1/rtl/flash_ctrl_arb.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_flash_ctrl_0.1/rtl/flash_ctrl_info_cfg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_flash_ctrl_0.1/rtl/flash_ctrl_lcmgr.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_flash_ctrl_0.1/rtl/flash_mp.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_flash_ctrl_0.1/rtl/flash_mp_data_region_sel.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_flash_ctrl_0.1/rtl/flash_phy.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_flash_ctrl_0.1/rtl/flash_phy_core.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_flash_ctrl_0.1/rtl/flash_phy_rd.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_flash_ctrl_0.1/rtl/flash_phy_prog.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_flash_ctrl_0.1/rtl/flash_phy_erase.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_flash_ctrl_0.1/rtl/flash_phy_rd_buffers.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_flash_ctrl_0.1/rtl/flash_phy_scramble.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/ast_reg_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/ast_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/ast_bhv_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/ast.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/ast_reg_top.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/adc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/adc_ana.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/vcc_pgd.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/vio_pgd.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/vcaon_pgd.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/vcmain_pgd.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/ast_alert.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/aon_clk.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/aon_osc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/io_clk.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/io_osc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/sys_clk.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/sys_osc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/usb_clk.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/usb_osc.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/gfr_clk_mux2.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/ast_clks_byp.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/rglts_pdm_3p3v.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/ast_pulse_sync.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/ast_entropy.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/dev_entropy.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/rng.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_ast_0.1/rtl/ast_dft.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_systems_rstmgr_0.1/rtl/autogen/rstmgr.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_rstmgr_cnsty_chk_0/rtl/rstmgr_cnsty_chk.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_ip_rstmgr_0.1/rtl/rstmgr_ctrl.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_rstmgr_0.1/rtl/rstmgr_por.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_rstmgr_0.1/rtl/rstmgr_crash_info.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_ip_rstmgr_0.1/rtl/rstmgr_leaf_rst.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_systems_top_earlgrey_0.1/rtl/autogen/top_earlgrey_rnd_cnst_pkg.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_top_earlgrey_0.1/rtl/autogen/top_earlgrey.sv    $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_systems_chip_earlgrey_awsf1_0.1/rtl/clkgen_xil7series.sv    $TARGET_DIR
file copy -force $CL_DIR/src/lowrisc_systems_chip_earlgrey_awsf1_0.1/rtl/usr_access_xil7series.sv    $TARGET_DIR



#---- End of section replaced by Developr ---



# Make sure files have write permissions for the encryption

exec chmod +w {*}[glob $TARGET_DIR/*]

set TOOL_VERSION $::env(VIVADO_TOOL_VERSION)
set vivado_version [string range [version -short] 0 5]
puts "AWS FPGA: VIVADO_TOOL_VERSION $TOOL_VERSION"
puts "vivado_version $vivado_version"

# encrypt .v/.sv/.vh/inc as verilog files
encrypt -k $HDK_SHELL_DIR/build/scripts/vivado_keyfile_2017_4.txt -lang verilog  [glob -nocomplain -- $TARGET_DIR/*.{v,sv}] [glob -nocomplain -- $TARGET_DIR/*.vh]
# encrypt *vhdl files
encrypt -k $HDK_SHELL_DIR/build/scripts/vivado_vhdl_keyfile_2017_4.txt -lang vhdl -quiet [ glob -nocomplain -- $TARGET_DIR/*.vhd? ]

## Copy files unencrypted fod synthesis debug.
# file copy -force $CL_DIR/design/RVP_ASSERT_NOT_XZ.sv      $TARGET_DIR

file copy -force $CL_DIR/src/lowrisc_prim_util_memload_0/rtl/prim_util_memload.svh    $TARGET_DIR

