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

#Param needed to avoid clock name collisions
set_param sta.enableAutoGenClkNamePersistence 0
set CL_MODULE $CL_MODULE
set VDEFINES $VDEFINES

create_project -in_memory -part [DEVICE_TYPE] -force

########################################
## Generate clocks based on Recipe
########################################

puts "AWS FPGA: ([clock format [clock seconds] -format %T]) Calling aws_gen_clk_constraints.tcl to generate clock constraints from developer's specified recipe.";

source $HDK_SHELL_DIR/build/scripts/aws_gen_clk_constraints.tcl

#############################
## Read design files
#############################

#Convenience to set the root of the RTL directory
set ENC_SRC_DIR $CL_DIR/build/src_post_encryption

puts "AWS FPGA: ([clock format [clock seconds] -format %T]) Reading developer's Custom Logic files post encryption.";

#---- User would replace this section -----

set_property generic {BootRomInitFile=/home/centos/rivos/org.lowRISC.dbeitel-opentitan/bazel-out/k8-fastbuild-ST-97f470ee3b14/bin/sw/device/silicon_creator/mask_rom/mask_rom_fpga_awsf1.scr.39.vmem OtpCtrlMemInitFile=/home/centos/rivos/org.lowRISC.dbeitel-opentitan/bazel-out/k8-fastbuild/bin/hw/ip/otp_ctrl/data/img_rma.vmem} [current_fileset]

# Reading the .sv and .v files, as proper designs would not require
# reading .v, .vh, nor .inc files

read_verilog -sv $ENC_SRC_DIR/cl_id_defines.vh
read_verilog -sv $ENC_SRC_DIR/cl_bus_pkg.sv
read_verilog -sv $ENC_SRC_DIR/cl_ocl_slv.sv
read_verilog -sv $ENC_SRC_DIR/axi_slv_defines.vh
read_verilog -sv $ENC_SRC_DIR/cl_pciw_mstr_defines.vh
read_verilog -sv $ENC_SRC_DIR/cl_pcir_mstr_defines.vh
read_verilog -sv $ENC_SRC_DIR/cl_pci_common_defines.vh
read_verilog -sv $ENC_SRC_DIR/dut.vh
read_verilog -sv $ENC_SRC_DIR/cl_dut_defines.vh
read_verilog -sv $ENC_SRC_DIR/cl_pciw_mstr.sv
read_verilog -sv $ENC_SRC_DIR/cl_pcir_mstr.sv
read_verilog -sv $ENC_SRC_DIR/read_port.sv
read_verilog -sv $ENC_SRC_DIR/write_port.sv
read_verilog -sv $ENC_SRC_DIR/streamx.sv

read_verilog -sv $ENC_SRC_DIR/prim_pkg.sv

read_verilog -sv $ENC_SRC_DIR/prim_and2.sv

read_verilog -sv $ENC_SRC_DIR/prim_buf.sv

read_verilog -sv $ENC_SRC_DIR/prim_clock_buf.sv

read_verilog -sv $ENC_SRC_DIR/prim_clock_gating.sv

read_verilog -sv $ENC_SRC_DIR/prim_clock_inv.sv

read_verilog -sv $ENC_SRC_DIR/prim_clock_mux2.sv

read_verilog -sv $ENC_SRC_DIR/prim_flop.sv

read_verilog -sv $ENC_SRC_DIR/prim_flop_en.sv

read_verilog -sv $ENC_SRC_DIR/prim_pad_attr.sv

read_verilog -sv $ENC_SRC_DIR/prim_pad_wrapper.sv

read_verilog -sv $ENC_SRC_DIR/prim_ram_1p.sv

read_verilog -sv $ENC_SRC_DIR/prim_ram_2p.sv

read_verilog -sv $ENC_SRC_DIR/prim_rom.sv

read_verilog -sv $ENC_SRC_DIR/prim_usb_diff_rx.sv

read_verilog -sv $ENC_SRC_DIR/prim_xnor2.sv

read_verilog -sv $ENC_SRC_DIR/prim_xor2.sv

read_verilog -sv $ENC_SRC_DIR/prim_flash.sv

read_verilog -sv $ENC_SRC_DIR/prim_otp.sv





read_verilog -sv $ENC_SRC_DIR/jtag_id_pkg.sv

read_verilog -sv $ENC_SRC_DIR/top_pkg.sv

read_verilog -sv $ENC_SRC_DIR/dv_fcov_macros.svh

read_verilog -sv $ENC_SRC_DIR/dv_macros.svh

read_verilog -sv $ENC_SRC_DIR/pins_if.sv

read_verilog -sv $ENC_SRC_DIR/ibex_pkg.sv

read_verilog -sv $ENC_SRC_DIR/entropy_src_pkg.sv

read_verilog -sv $ENC_SRC_DIR/jtag_pkg.sv

read_verilog -sv $ENC_SRC_DIR/spi_device_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/spi_device_pkg.sv

read_verilog -sv $ENC_SRC_DIR/usbdev_pkg.sv

read_verilog -sv $ENC_SRC_DIR/prim_pkg.sv

read_verilog -sv $ENC_SRC_DIR/prim_assert.sv
read_verilog -sv $ENC_SRC_DIR/prim_assert_dummy_macros.svh
read_verilog -sv $ENC_SRC_DIR/prim_assert_yosys_macros.svh
read_verilog -sv $ENC_SRC_DIR/prim_assert_standard_macros.svh
read_verilog -sv $ENC_SRC_DIR/prim_assert_sec_cm.svh
read_verilog -sv $ENC_SRC_DIR/prim_flop_macros.sv

read_verilog -sv $ENC_SRC_DIR/prim_cipher_pkg.sv

read_verilog -sv $ENC_SRC_DIR/prim_count_pkg.sv

read_verilog -sv $ENC_SRC_DIR/prim_crc32.sv

read_verilog -sv $ENC_SRC_DIR/prim_generic_and2.sv

read_verilog -sv $ENC_SRC_DIR/prim_generic_buf.sv

read_verilog -sv $ENC_SRC_DIR/prim_generic_clock_buf.sv

read_verilog -sv $ENC_SRC_DIR/prim_generic_clock_gating.sv

read_verilog -sv $ENC_SRC_DIR/prim_generic_flop.sv

read_verilog -sv $ENC_SRC_DIR/prim_generic_usb_diff_rx.sv

read_verilog -sv $ENC_SRC_DIR/prim_generic_xnor2.sv

read_verilog -sv $ENC_SRC_DIR/prim_generic_xor2.sv

read_verilog -sv $ENC_SRC_DIR/prim_otp_pkg.sv

read_verilog -sv $ENC_SRC_DIR/prim_pad_wrapper_pkg.sv

read_verilog -sv $ENC_SRC_DIR/prim_ram_1p_pkg.sv

read_verilog -sv $ENC_SRC_DIR/prim_ram_2p_pkg.sv

read_verilog -sv $ENC_SRC_DIR/prim_rom_pkg.sv

read_verilog -sv $ENC_SRC_DIR/prim_sec_anchor_buf.sv
read_verilog -sv $ENC_SRC_DIR/prim_sec_anchor_flop.sv

read_verilog -sv $ENC_SRC_DIR/prim_secded_pkg.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_22_16_dec.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_22_16_enc.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_28_22_dec.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_28_22_enc.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_39_32_dec.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_39_32_enc.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_64_57_dec.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_64_57_enc.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_72_64_dec.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_72_64_enc.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_hamming_22_16_dec.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_hamming_22_16_enc.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_hamming_39_32_dec.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_hamming_39_32_enc.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_hamming_72_64_dec.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_hamming_72_64_enc.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_hamming_76_68_dec.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_hamming_76_68_enc.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_inv_22_16_dec.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_inv_22_16_enc.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_inv_28_22_dec.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_inv_28_22_enc.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_inv_39_32_dec.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_inv_39_32_enc.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_inv_64_57_dec.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_inv_64_57_enc.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_inv_72_64_dec.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_inv_72_64_enc.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_inv_hamming_22_16_dec.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_inv_hamming_22_16_enc.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_inv_hamming_39_32_dec.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_inv_hamming_39_32_enc.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_inv_hamming_72_64_dec.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_inv_hamming_72_64_enc.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_inv_hamming_76_68_dec.sv
read_verilog -sv $ENC_SRC_DIR/prim_secded_inv_hamming_76_68_enc.sv

read_verilog -sv $ENC_SRC_DIR/prim_subreg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/prim_subreg_arb.sv
read_verilog -sv $ENC_SRC_DIR/prim_reg_cdc.sv
read_verilog -sv $ENC_SRC_DIR/prim_subreg.sv
read_verilog -sv $ENC_SRC_DIR/prim_subreg_ext.sv
read_verilog -sv $ENC_SRC_DIR/prim_subreg_shadow.sv

read_verilog -sv $ENC_SRC_DIR/prim_util_pkg.sv

read_verilog -sv $ENC_SRC_DIR/prim_util_get_scramble_params.svh

read_verilog -sv $ENC_SRC_DIR/prim_util_memload.svh

read_verilog -sv $ENC_SRC_DIR/prim_xilinx_and2.sv

read_verilog -sv $ENC_SRC_DIR/prim_xilinx_buf.sv

read_verilog -sv $ENC_SRC_DIR/prim_xilinx_clock_buf.sv

read_verilog -sv $ENC_SRC_DIR/prim_xilinx_clock_gating.sv

read_verilog -sv $ENC_SRC_DIR/prim_xilinx_clock_mux2.sv

read_verilog -sv $ENC_SRC_DIR/prim_xilinx_flop.sv

read_verilog -sv $ENC_SRC_DIR/prim_xilinx_flop_en.sv

read_verilog -sv $ENC_SRC_DIR/prim_xilinx_xor2.sv

read_verilog -sv $ENC_SRC_DIR/top_earlgrey_pkg.sv

read_verilog -sv $ENC_SRC_DIR/ibex_icache.sv

read_verilog -sv $ENC_SRC_DIR/lc_ctrl_state_pkg.sv

read_verilog -sv $ENC_SRC_DIR/rv_core_ibex_pkg.sv

read_verilog -sv $ENC_SRC_DIR/prim_arbiter_fixed.sv
read_verilog -sv $ENC_SRC_DIR/prim_arbiter_ppc.sv
read_verilog -sv $ENC_SRC_DIR/prim_arbiter_tree.sv
read_verilog -sv $ENC_SRC_DIR/prim_arbiter_tree_dup.sv

read_verilog -sv $ENC_SRC_DIR/prim_cdc_rand_delay.sv

read_verilog -sv $ENC_SRC_DIR/prim_subst_perm.sv
read_verilog -sv $ENC_SRC_DIR/prim_present.sv
read_verilog -sv $ENC_SRC_DIR/prim_prince.sv

read_verilog -sv $ENC_SRC_DIR/prim_count.sv

read_verilog -sv $ENC_SRC_DIR/prim_generic_clock_mux2.sv

read_verilog -sv $ENC_SRC_DIR/prim_generic_flop_en.sv

read_verilog -sv $ENC_SRC_DIR/prim_generic_pad_attr.sv

read_verilog -sv $ENC_SRC_DIR/prim_generic_pad_wrapper.sv

read_verilog -sv $ENC_SRC_DIR/prim_generic_ram_1p.sv

read_verilog -sv $ENC_SRC_DIR/prim_generic_ram_2p.sv

read_verilog -sv $ENC_SRC_DIR/prim_generic_rom.sv

read_verilog -sv $ENC_SRC_DIR/prim_gf_mult.sv

read_verilog -sv $ENC_SRC_DIR/prim_lfsr.sv

read_verilog -sv $ENC_SRC_DIR/prim_max_tree.sv

read_verilog -sv $ENC_SRC_DIR/prim_msb_extend.sv

read_verilog -sv $ENC_SRC_DIR/prim_onehot_enc.sv
read_verilog -sv $ENC_SRC_DIR/prim_onehot_mux.sv

read_verilog -sv $ENC_SRC_DIR/prim_onehot_check.sv

read_verilog -sv $ENC_SRC_DIR/prim_dom_and_2share.sv

read_verilog -sv $ENC_SRC_DIR/prim_sparse_fsm_flop.sv

read_verilog -sv $ENC_SRC_DIR/prim_sum_tree.sv

read_verilog -sv $ENC_SRC_DIR/prim_xilinx_pad_attr.sv

read_verilog -sv $ENC_SRC_DIR/prim_xilinx_pad_wrapper.sv

read_verilog -sv $ENC_SRC_DIR/prim_xoshiro256pp.sv

read_verilog -sv $ENC_SRC_DIR/physical_pads.sv

read_verilog -sv $ENC_SRC_DIR/prim_and2.sv

read_verilog -sv $ENC_SRC_DIR/prim_buf.sv

read_verilog -sv $ENC_SRC_DIR/prim_clock_buf.sv

read_verilog -sv $ENC_SRC_DIR/prim_clock_gating.sv

read_verilog -sv $ENC_SRC_DIR/prim_clock_mux2.sv

read_verilog -sv $ENC_SRC_DIR/prim_flop.sv

read_verilog -sv $ENC_SRC_DIR/prim_flop_en.sv

read_verilog -sv $ENC_SRC_DIR/prim_pad_attr.sv

read_verilog -sv $ENC_SRC_DIR/prim_pad_wrapper.sv

read_verilog -sv $ENC_SRC_DIR/prim_ram_2p.sv

read_verilog -sv $ENC_SRC_DIR/prim_rom.sv

read_verilog -sv $ENC_SRC_DIR/prim_usb_diff_rx.sv

read_verilog -sv $ENC_SRC_DIR/prim_xnor2.sv

read_verilog -sv $ENC_SRC_DIR/prim_xor2.sv

read_verilog -sv $ENC_SRC_DIR/prim_badbit_ram_1p.sv

read_verilog -sv $ENC_SRC_DIR/ibex_alu.sv
read_verilog -sv $ENC_SRC_DIR/ibex_branch_predict.sv
read_verilog -sv $ENC_SRC_DIR/ibex_compressed_decoder.sv
read_verilog -sv $ENC_SRC_DIR/ibex_controller.sv
read_verilog -sv $ENC_SRC_DIR/ibex_cs_registers.sv
read_verilog -sv $ENC_SRC_DIR/ibex_csr.sv
read_verilog -sv $ENC_SRC_DIR/ibex_counter.sv
read_verilog -sv $ENC_SRC_DIR/ibex_decoder.sv
read_verilog -sv $ENC_SRC_DIR/ibex_ex_block.sv
read_verilog -sv $ENC_SRC_DIR/ibex_fetch_fifo.sv
read_verilog -sv $ENC_SRC_DIR/ibex_id_stage.sv
read_verilog -sv $ENC_SRC_DIR/ibex_if_stage.sv
read_verilog -sv $ENC_SRC_DIR/ibex_load_store_unit.sv
read_verilog -sv $ENC_SRC_DIR/ibex_multdiv_fast.sv
read_verilog -sv $ENC_SRC_DIR/ibex_multdiv_slow.sv
read_verilog -sv $ENC_SRC_DIR/ibex_prefetch_buffer.sv
read_verilog -sv $ENC_SRC_DIR/ibex_pmp.sv
read_verilog -sv $ENC_SRC_DIR/ibex_wb_stage.sv
read_verilog -sv $ENC_SRC_DIR/ibex_dummy_instr.sv
read_verilog -sv $ENC_SRC_DIR/ibex_core.sv
read_verilog -sv $ENC_SRC_DIR/ibex_pmp_reset_default.svh

read_verilog -sv $ENC_SRC_DIR/prim_ram_1p.sv

read_verilog -sv $ENC_SRC_DIR/prim_blanker.sv

read_verilog -sv $ENC_SRC_DIR/prim_double_lfsr.sv

read_verilog -sv $ENC_SRC_DIR/prim_flop_2sync.sv

read_verilog -sv $ENC_SRC_DIR/prim_generic_clock_inv.sv

read_verilog -sv $ENC_SRC_DIR/prim_mubi_pkg.sv
read_verilog -sv $ENC_SRC_DIR/prim_mubi4_sender.sv
read_verilog -sv $ENC_SRC_DIR/prim_mubi4_sync.sv
read_verilog -sv $ENC_SRC_DIR/prim_mubi4_dec.sv
read_verilog -sv $ENC_SRC_DIR/prim_mubi8_sender.sv
read_verilog -sv $ENC_SRC_DIR/prim_mubi8_sync.sv
read_verilog -sv $ENC_SRC_DIR/prim_mubi8_dec.sv
read_verilog -sv $ENC_SRC_DIR/prim_mubi12_sender.sv
read_verilog -sv $ENC_SRC_DIR/prim_mubi12_sync.sv
read_verilog -sv $ENC_SRC_DIR/prim_mubi12_dec.sv
read_verilog -sv $ENC_SRC_DIR/prim_mubi16_sender.sv
read_verilog -sv $ENC_SRC_DIR/prim_mubi16_sync.sv
read_verilog -sv $ENC_SRC_DIR/prim_mubi16_dec.sv

read_verilog -sv $ENC_SRC_DIR/prim_ram_2p_async_adv.sv

read_verilog -sv $ENC_SRC_DIR/prim_reg_we_check.sv

read_verilog -sv $ENC_SRC_DIR/prim_rom_adv.sv

read_verilog -sv $ENC_SRC_DIR/rom_ctrl_pkg.sv
read_verilog -sv $ENC_SRC_DIR/rom_ctrl_reg_pkg.sv

read_verilog -sv $ENC_SRC_DIR/prim_clock_inv.sv

read_verilog -sv $ENC_SRC_DIR/prim_diff_decode.sv

read_verilog -sv $ENC_SRC_DIR/prim_edge_detector.sv

read_verilog -sv $ENC_SRC_DIR/prim_fifo_async_sram_adapter.sv
read_verilog -sv $ENC_SRC_DIR/prim_fifo_async.sv
read_verilog -sv $ENC_SRC_DIR/prim_fifo_sync.sv
read_verilog -sv $ENC_SRC_DIR/prim_fifo_sync_cnt.sv

read_verilog -sv $ENC_SRC_DIR/prim_ram_1p_adv.sv

read_verilog -sv $ENC_SRC_DIR/prim_ram_2p_adv.sv

read_verilog -sv $ENC_SRC_DIR/tlul_pkg.sv

read_verilog -sv $ENC_SRC_DIR/lc_ctrl_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/lc_ctrl_pkg.sv

read_verilog -sv $ENC_SRC_DIR/prim_esc_pkg.sv
read_verilog -sv $ENC_SRC_DIR/prim_esc_receiver.sv
read_verilog -sv $ENC_SRC_DIR/prim_esc_sender.sv

read_verilog -sv $ENC_SRC_DIR/prim_ram_1p_scr.sv

read_verilog -sv $ENC_SRC_DIR/pinmux_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/pinmux_reg_top.sv

read_verilog -sv $ENC_SRC_DIR/pwrmgr_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/pwrmgr_reg_top.sv

read_verilog -sv $ENC_SRC_DIR/rstmgr_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/rstmgr_reg_top.sv

read_verilog -sv $ENC_SRC_DIR/tlul_data_integ_enc.sv
read_verilog -sv $ENC_SRC_DIR/tlul_data_integ_dec.sv
read_verilog -sv $ENC_SRC_DIR/tlul_cmd_intg_gen.sv
read_verilog -sv $ENC_SRC_DIR/tlul_cmd_intg_chk.sv
read_verilog -sv $ENC_SRC_DIR/tlul_rsp_intg_gen.sv
read_verilog -sv $ENC_SRC_DIR/tlul_rsp_intg_chk.sv

read_verilog -sv $ENC_SRC_DIR/ibex_register_file_ff.sv
read_verilog -sv $ENC_SRC_DIR/ibex_register_file_fpga.sv
read_verilog -sv $ENC_SRC_DIR/ibex_register_file_latch.sv
read_verilog -sv $ENC_SRC_DIR/ibex_lockstep.sv
read_verilog -sv $ENC_SRC_DIR/ibex_top.sv

read_verilog -sv $ENC_SRC_DIR/csrng_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/csrng_pkg.sv

read_verilog -sv $ENC_SRC_DIR/otp_ctrl_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/otp_ctrl_pkg.sv
read_verilog -sv $ENC_SRC_DIR/otp_ctrl_part_pkg.sv

read_verilog -sv $ENC_SRC_DIR/prim_alert_pkg.sv
read_verilog -sv $ENC_SRC_DIR/prim_alert_receiver.sv
read_verilog -sv $ENC_SRC_DIR/prim_alert_sender.sv

read_verilog -sv $ENC_SRC_DIR/prim_clock_div.sv

read_verilog -sv $ENC_SRC_DIR/prim_lc_dec.sv

read_verilog -sv $ENC_SRC_DIR/prim_lc_sender.sv

read_verilog -sv $ENC_SRC_DIR/prim_lc_sync.sv

read_verilog -sv $ENC_SRC_DIR/ast_pkg.sv

read_verilog -sv $ENC_SRC_DIR/tlul_fifo_sync.sv
read_verilog -sv $ENC_SRC_DIR/tlul_fifo_async.sv
read_verilog -sv $ENC_SRC_DIR/tlul_assert.sv
read_verilog -sv $ENC_SRC_DIR/tlul_err.sv
read_verilog -sv $ENC_SRC_DIR/tlul_assert_multiple.sv

read_verilog -sv $ENC_SRC_DIR/edn_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/edn_pkg.sv

read_verilog -sv $ENC_SRC_DIR/otbn_pkg.sv

read_verilog -sv $ENC_SRC_DIR/otp_ctrl_prim_reg_top.sv

read_verilog -sv $ENC_SRC_DIR/pwrmgr_pkg.sv

read_verilog -sv $ENC_SRC_DIR/rv_plic_gateway.sv
read_verilog -sv $ENC_SRC_DIR/rv_plic_target.sv

read_verilog -sv $ENC_SRC_DIR/sram_ctrl_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/sram_ctrl_pkg.sv

read_verilog -sv $ENC_SRC_DIR/prim_clock_gating_sync.sv
read_verilog -sv $ENC_SRC_DIR/prim_sram_arbiter.sv
read_verilog -sv $ENC_SRC_DIR/prim_slicer.sv
read_verilog -sv $ENC_SRC_DIR/prim_sync_reqack.sv
read_verilog -sv $ENC_SRC_DIR/prim_sync_reqack_data.sv
read_verilog -sv $ENC_SRC_DIR/prim_sync_slow_fast.sv
read_verilog -sv $ENC_SRC_DIR/prim_keccak.sv
read_verilog -sv $ENC_SRC_DIR/prim_packer.sv
read_verilog -sv $ENC_SRC_DIR/prim_packer_fifo.sv
read_verilog -sv $ENC_SRC_DIR/prim_gate_gen.sv
read_verilog -sv $ENC_SRC_DIR/prim_pulse_sync.sv
read_verilog -sv $ENC_SRC_DIR/prim_filter.sv
read_verilog -sv $ENC_SRC_DIR/prim_filter_ctr.sv
read_verilog -sv $ENC_SRC_DIR/prim_intr_hw.sv

read_verilog -sv $ENC_SRC_DIR/tlul_adapter_reg.sv

read_verilog -sv $ENC_SRC_DIR/tlul_sram_byte.sv
read_verilog -sv $ENC_SRC_DIR/tlul_adapter_sram.sv

read_verilog -sv $ENC_SRC_DIR/tlul_lc_gate.sv

read_verilog -sv $ENC_SRC_DIR/tlul_err_resp.sv
read_verilog -sv $ENC_SRC_DIR/tlul_socket_1n.sv

read_verilog -sv $ENC_SRC_DIR/tlul_socket_m1.sv

read_verilog -sv $ENC_SRC_DIR/sram2tlul.sv

read_verilog -sv $ENC_SRC_DIR/keymgr_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/keymgr_pkg.sv

read_verilog -sv $ENC_SRC_DIR/usb_consts_pkg.sv
read_verilog -sv $ENC_SRC_DIR/usb_fs_nb_in_pe.sv
read_verilog -sv $ENC_SRC_DIR/usb_fs_nb_out_pe.sv
read_verilog -sv $ENC_SRC_DIR/usb_fs_nb_pe.sv
read_verilog -sv $ENC_SRC_DIR/usb_fs_rx.sv
read_verilog -sv $ENC_SRC_DIR/usb_fs_tx.sv
read_verilog -sv $ENC_SRC_DIR/usb_fs_tx_mux.sv

read_verilog -sv $ENC_SRC_DIR/prim_edn_req.sv

read_verilog -sv $ENC_SRC_DIR/prim_generic_otp.sv

read_verilog -sv $ENC_SRC_DIR/prim_clock_meas.sv
read_verilog -sv $ENC_SRC_DIR/prim_clock_timeout.sv

read_verilog -sv $ENC_SRC_DIR/clkmgr_pkg.sv

read_verilog -sv $ENC_SRC_DIR/flash_ctrl_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/flash_ctrl_pkg.sv

read_verilog -sv $ENC_SRC_DIR/tlul_adapter_host.sv

read_verilog -sv $ENC_SRC_DIR/debug_rom.sv
read_verilog -sv $ENC_SRC_DIR/debug_rom_one_scratch.sv

read_verilog -sv $ENC_SRC_DIR/dm_pkg.sv
read_verilog -sv $ENC_SRC_DIR/dm_sba.sv
read_verilog -sv $ENC_SRC_DIR/dm_csrs.sv
read_verilog -sv $ENC_SRC_DIR/dm_mem.sv
read_verilog -sv $ENC_SRC_DIR/dmi_cdc.sv
read_verilog -sv $ENC_SRC_DIR/dmi_jtag.sv
read_verilog -sv $ENC_SRC_DIR/dmi_jtag_tap.sv
read_verilog -sv $ENC_SRC_DIR/dm_top.sv

read_verilog -sv $ENC_SRC_DIR/adc_ctrl_pkg.sv
read_verilog -sv $ENC_SRC_DIR/adc_ctrl_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/adc_ctrl_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/adc_ctrl_fsm.sv
read_verilog -sv $ENC_SRC_DIR/adc_ctrl_intr.sv
read_verilog -sv $ENC_SRC_DIR/adc_ctrl_core.sv
read_verilog -sv $ENC_SRC_DIR/adc_ctrl.sv

read_verilog -sv $ENC_SRC_DIR/aes_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/aes_pkg.sv
read_verilog -sv $ENC_SRC_DIR/aes_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/aes_ctrl_reg_shadowed.sv
read_verilog -sv $ENC_SRC_DIR/aes_core.sv
read_verilog -sv $ENC_SRC_DIR/aes_ctr.sv
read_verilog -sv $ENC_SRC_DIR/aes_ctr_fsm.sv
read_verilog -sv $ENC_SRC_DIR/aes_ctr_fsm_p.sv
read_verilog -sv $ENC_SRC_DIR/aes_ctr_fsm_n.sv
read_verilog -sv $ENC_SRC_DIR/aes_control.sv
read_verilog -sv $ENC_SRC_DIR/aes_control_fsm.sv
read_verilog -sv $ENC_SRC_DIR/aes_control_fsm_p.sv
read_verilog -sv $ENC_SRC_DIR/aes_control_fsm_n.sv
read_verilog -sv $ENC_SRC_DIR/aes_reg_status.sv
read_verilog -sv $ENC_SRC_DIR/aes_sel_buf_chk.sv
read_verilog -sv $ENC_SRC_DIR/aes_cipher_core.sv
read_verilog -sv $ENC_SRC_DIR/aes_cipher_control.sv
read_verilog -sv $ENC_SRC_DIR/aes_cipher_control_fsm.sv
read_verilog -sv $ENC_SRC_DIR/aes_cipher_control_fsm_p.sv
read_verilog -sv $ENC_SRC_DIR/aes_cipher_control_fsm_n.sv
read_verilog -sv $ENC_SRC_DIR/aes_sub_bytes.sv
read_verilog -sv $ENC_SRC_DIR/aes_sbox.sv
read_verilog -sv $ENC_SRC_DIR/aes_sbox_lut.sv
read_verilog -sv $ENC_SRC_DIR/aes_sbox_canright_pkg.sv
read_verilog -sv $ENC_SRC_DIR/aes_sbox_canright.sv
read_verilog -sv $ENC_SRC_DIR/aes_sbox_canright_masked_noreuse.sv
read_verilog -sv $ENC_SRC_DIR/aes_sbox_canright_masked.sv
read_verilog -sv $ENC_SRC_DIR/aes_sbox_dom.sv
read_verilog -sv $ENC_SRC_DIR/aes_shift_rows.sv
read_verilog -sv $ENC_SRC_DIR/aes_mix_columns.sv
read_verilog -sv $ENC_SRC_DIR/aes_mix_single_column.sv
read_verilog -sv $ENC_SRC_DIR/aes_key_expand.sv
read_verilog -sv $ENC_SRC_DIR/aes_prng_clearing.sv
read_verilog -sv $ENC_SRC_DIR/aes_prng_masking.sv
read_verilog -sv $ENC_SRC_DIR/aes.sv

read_verilog -sv $ENC_SRC_DIR/aon_timer_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/aon_timer_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/aon_timer_core.sv
read_verilog -sv $ENC_SRC_DIR/aon_timer.sv

read_verilog -sv $ENC_SRC_DIR/clkmgr_byp.sv
read_verilog -sv $ENC_SRC_DIR/clkmgr_clk_status.sv
read_verilog -sv $ENC_SRC_DIR/clkmgr_meas_chk.sv
read_verilog -sv $ENC_SRC_DIR/clkmgr_root_ctrl.sv
read_verilog -sv $ENC_SRC_DIR/clkmgr_trans.sv

read_verilog -sv $ENC_SRC_DIR/edn_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/edn_ack_sm.sv
read_verilog -sv $ENC_SRC_DIR/edn_main_sm.sv
read_verilog -sv $ENC_SRC_DIR/edn_core.sv
read_verilog -sv $ENC_SRC_DIR/edn.sv

read_verilog -sv $ENC_SRC_DIR/flash_phy_pkg.sv

read_verilog -sv $ENC_SRC_DIR/gpio_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/gpio.sv
read_verilog -sv $ENC_SRC_DIR/gpio_reg_top.sv

read_verilog -sv $ENC_SRC_DIR/hmac_pkg.sv
read_verilog -sv $ENC_SRC_DIR/sha2.sv
read_verilog -sv $ENC_SRC_DIR/sha2_pad.sv
read_verilog -sv $ENC_SRC_DIR/hmac_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/hmac_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/hmac_core.sv
read_verilog -sv $ENC_SRC_DIR/hmac.sv

read_verilog -sv $ENC_SRC_DIR/i2c_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/i2c_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/i2c_core.sv
read_verilog -sv $ENC_SRC_DIR/i2c_fsm.sv
read_verilog -sv $ENC_SRC_DIR/i2c.sv

read_verilog -sv $ENC_SRC_DIR/otbn_controller.sv
read_verilog -sv $ENC_SRC_DIR/otbn_decoder.sv
read_verilog -sv $ENC_SRC_DIR/otbn_predecode.sv
read_verilog -sv $ENC_SRC_DIR/otbn_instruction_fetch.sv
read_verilog -sv $ENC_SRC_DIR/otbn_rf_base.sv
read_verilog -sv $ENC_SRC_DIR/otbn_rf_bignum.sv
read_verilog -sv $ENC_SRC_DIR/otbn_rf_base_ff.sv
read_verilog -sv $ENC_SRC_DIR/otbn_rf_bignum_ff.sv
read_verilog -sv $ENC_SRC_DIR/otbn_rf_base_fpga.sv
read_verilog -sv $ENC_SRC_DIR/otbn_rf_bignum_fpga.sv
read_verilog -sv $ENC_SRC_DIR/otbn_lsu.sv
read_verilog -sv $ENC_SRC_DIR/otbn_alu_base.sv
read_verilog -sv $ENC_SRC_DIR/otbn_alu_bignum.sv
read_verilog -sv $ENC_SRC_DIR/otbn_mac_bignum.sv
read_verilog -sv $ENC_SRC_DIR/otbn_loop_controller.sv
read_verilog -sv $ENC_SRC_DIR/otbn_stack.sv
read_verilog -sv $ENC_SRC_DIR/otbn_rnd.sv
read_verilog -sv $ENC_SRC_DIR/otbn_start_stop_control.sv
read_verilog -sv $ENC_SRC_DIR/otbn_core.sv
read_verilog -sv $ENC_SRC_DIR/otbn_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/otbn_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/otbn_scramble_ctrl.sv
read_verilog -sv $ENC_SRC_DIR/otbn.sv

read_verilog -sv $ENC_SRC_DIR/pattgen_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/pattgen_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/pattgen_ctrl_pkg.sv
read_verilog -sv $ENC_SRC_DIR/pattgen_core.sv
read_verilog -sv $ENC_SRC_DIR/pattgen_chan.sv
read_verilog -sv $ENC_SRC_DIR/pattgen.sv

read_verilog -sv $ENC_SRC_DIR/pwm_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/pwm_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/pwm_chan.sv
read_verilog -sv $ENC_SRC_DIR/pwm_core.sv
read_verilog -sv $ENC_SRC_DIR/pwm.sv

read_verilog -sv $ENC_SRC_DIR/rv_dm_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/rv_dm_regs_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/rv_dm_rom_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/rv_dm.sv

read_verilog -sv $ENC_SRC_DIR/rv_timer_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/rv_timer_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/timer_core.sv
read_verilog -sv $ENC_SRC_DIR/rv_timer.sv

read_verilog -sv $ENC_SRC_DIR/sha3_pkg.sv
read_verilog -sv $ENC_SRC_DIR/keccak_round.sv
read_verilog -sv $ENC_SRC_DIR/keccak_2share.sv
read_verilog -sv $ENC_SRC_DIR/sha3pad.sv
read_verilog -sv $ENC_SRC_DIR/sha3.sv

read_verilog -sv $ENC_SRC_DIR/spi_device_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/spi_fwm_rxf_ctrl.sv
read_verilog -sv $ENC_SRC_DIR/spi_fwm_txf_ctrl.sv
read_verilog -sv $ENC_SRC_DIR/spi_fwmode.sv
read_verilog -sv $ENC_SRC_DIR/spi_cmdparse.sv
read_verilog -sv $ENC_SRC_DIR/spid_readsram.sv
read_verilog -sv $ENC_SRC_DIR/spid_readbuffer.sv
read_verilog -sv $ENC_SRC_DIR/spi_readcmd.sv
read_verilog -sv $ENC_SRC_DIR/spi_passthrough.sv
read_verilog -sv $ENC_SRC_DIR/spid_status.sv
read_verilog -sv $ENC_SRC_DIR/spid_jedec.sv
read_verilog -sv $ENC_SRC_DIR/spid_addr_4b.sv
read_verilog -sv $ENC_SRC_DIR/spid_fifo2sram_adapter.sv
read_verilog -sv $ENC_SRC_DIR/spid_upload.sv
read_verilog -sv $ENC_SRC_DIR/spi_tpm.sv
read_verilog -sv $ENC_SRC_DIR/spi_s2p.sv
read_verilog -sv $ENC_SRC_DIR/spi_p2s.sv
read_verilog -sv $ENC_SRC_DIR/spi_device.sv

read_verilog -sv $ENC_SRC_DIR/spi_host_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/spi_host_cmd_pkg.sv
read_verilog -sv $ENC_SRC_DIR/spi_host_shift_register.sv
read_verilog -sv $ENC_SRC_DIR/spi_host_byte_select.sv
read_verilog -sv $ENC_SRC_DIR/spi_host_byte_merge.sv
read_verilog -sv $ENC_SRC_DIR/spi_host_fsm.sv
read_verilog -sv $ENC_SRC_DIR/spi_host_core.sv
read_verilog -sv $ENC_SRC_DIR/spi_host_command_queue.sv
read_verilog -sv $ENC_SRC_DIR/spi_host_data_fifos.sv
read_verilog -sv $ENC_SRC_DIR/spi_host_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/spi_host_window.sv
read_verilog -sv $ENC_SRC_DIR/spi_host.sv

read_verilog -sv $ENC_SRC_DIR/sram_ctrl_regs_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/sram_ctrl.sv

read_verilog -sv $ENC_SRC_DIR/sysrst_ctrl_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/sysrst_ctrl_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/sysrst_ctrl_pkg.sv
read_verilog -sv $ENC_SRC_DIR/sysrst_ctrl_autoblock.sv
read_verilog -sv $ENC_SRC_DIR/sysrst_ctrl_comboact.sv
read_verilog -sv $ENC_SRC_DIR/sysrst_ctrl_pin.sv
read_verilog -sv $ENC_SRC_DIR/sysrst_ctrl_keyintr.sv
read_verilog -sv $ENC_SRC_DIR/sysrst_ctrl_detect.sv
read_verilog -sv $ENC_SRC_DIR/sysrst_ctrl_combo.sv
read_verilog -sv $ENC_SRC_DIR/sysrst_ctrl_ulp.sv
read_verilog -sv $ENC_SRC_DIR/sysrst_ctrl.sv

read_verilog -sv $ENC_SRC_DIR/uart_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/uart_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/uart_rx.sv
read_verilog -sv $ENC_SRC_DIR/uart_tx.sv
read_verilog -sv $ENC_SRC_DIR/uart_core.sv
read_verilog -sv $ENC_SRC_DIR/uart.sv

read_verilog -sv $ENC_SRC_DIR/usbdev_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/usbdev_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/usbdev_usbif.sv
read_verilog -sv $ENC_SRC_DIR/usbdev_flop_2syncpulse.sv
read_verilog -sv $ENC_SRC_DIR/usbdev_linkstate.sv
read_verilog -sv $ENC_SRC_DIR/usbdev_iomux.sv
read_verilog -sv $ENC_SRC_DIR/usbdev_aon_wake.sv
read_verilog -sv $ENC_SRC_DIR/usbdev.sv

read_verilog -sv $ENC_SRC_DIR/alert_handler_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/alert_handler_reg_top.sv

read_verilog -sv $ENC_SRC_DIR/rv_plic_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/rv_plic_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/rv_plic.sv

read_verilog -sv $ENC_SRC_DIR/prim_otp.sv

read_verilog -sv $ENC_SRC_DIR/sensor_ctrl_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/sensor_ctrl_reg_top.sv

read_verilog -sv $ENC_SRC_DIR/tl_main_pkg.sv
read_verilog -sv $ENC_SRC_DIR/xbar_main.sv

read_verilog -sv $ENC_SRC_DIR/tl_peri_pkg.sv
read_verilog -sv $ENC_SRC_DIR/xbar_peri.sv

read_verilog -sv $ENC_SRC_DIR/alert_pkg.sv
read_verilog -sv $ENC_SRC_DIR/alert_handler_reg_wrap.sv
read_verilog -sv $ENC_SRC_DIR/alert_handler_lpg_ctrl.sv
read_verilog -sv $ENC_SRC_DIR/alert_handler_class.sv
read_verilog -sv $ENC_SRC_DIR/alert_handler_ping_timer.sv
read_verilog -sv $ENC_SRC_DIR/alert_handler_esc_timer.sv
read_verilog -sv $ENC_SRC_DIR/alert_handler_accu.sv
read_verilog -sv $ENC_SRC_DIR/alert_handler.sv

read_verilog -sv $ENC_SRC_DIR/csrng_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/csrng_main_sm.sv
read_verilog -sv $ENC_SRC_DIR/csrng_state_db.sv
read_verilog -sv $ENC_SRC_DIR/csrng_cmd_stage.sv
read_verilog -sv $ENC_SRC_DIR/csrng_block_encrypt.sv
read_verilog -sv $ENC_SRC_DIR/csrng_ctr_drbg_cmd.sv
read_verilog -sv $ENC_SRC_DIR/csrng_ctr_drbg_upd.sv
read_verilog -sv $ENC_SRC_DIR/csrng_ctr_drbg_gen.sv
read_verilog -sv $ENC_SRC_DIR/csrng_core.sv
read_verilog -sv $ENC_SRC_DIR/csrng.sv

read_verilog -sv $ENC_SRC_DIR/entropy_src_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/entropy_src_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/entropy_src_watermark_reg.sv
read_verilog -sv $ENC_SRC_DIR/entropy_src_field_en.sv
read_verilog -sv $ENC_SRC_DIR/entropy_src_cntr_reg.sv
read_verilog -sv $ENC_SRC_DIR/entropy_src_ack_sm.sv
read_verilog -sv $ENC_SRC_DIR/entropy_src_main_sm.sv
read_verilog -sv $ENC_SRC_DIR/entropy_src_repcnt_ht.sv
read_verilog -sv $ENC_SRC_DIR/entropy_src_repcnts_ht.sv
read_verilog -sv $ENC_SRC_DIR/entropy_src_adaptp_ht.sv
read_verilog -sv $ENC_SRC_DIR/entropy_src_bucket_ht.sv
read_verilog -sv $ENC_SRC_DIR/entropy_src_markov_ht.sv
read_verilog -sv $ENC_SRC_DIR/entropy_src_core.sv
read_verilog -sv $ENC_SRC_DIR/entropy_src.sv

read_verilog -sv $ENC_SRC_DIR/kmac_pkg.sv

read_verilog -sv $ENC_SRC_DIR/pinmux_pkg.sv
read_verilog -sv $ENC_SRC_DIR/pinmux_wkup.sv
read_verilog -sv $ENC_SRC_DIR/pinmux_jtag_buf.sv
read_verilog -sv $ENC_SRC_DIR/pinmux_jtag_breakout.sv
read_verilog -sv $ENC_SRC_DIR/pinmux_strap_sampling.sv
read_verilog -sv $ENC_SRC_DIR/pinmux.sv

read_verilog -sv $ENC_SRC_DIR/pwrmgr.sv
read_verilog -sv $ENC_SRC_DIR/pwrmgr_cdc.sv
read_verilog -sv $ENC_SRC_DIR/pwrmgr_slow_fsm.sv
read_verilog -sv $ENC_SRC_DIR/pwrmgr_fsm.sv
read_verilog -sv $ENC_SRC_DIR/pwrmgr_wake_info.sv

read_verilog -sv $ENC_SRC_DIR/rv_core_ibex_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/rv_core_ibex_cfg_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/rv_core_ibex.sv
read_verilog -sv $ENC_SRC_DIR/rv_core_addr_trans.sv
read_verilog -sv $ENC_SRC_DIR/ibex_pmp_reset.svh

read_verilog -sv $ENC_SRC_DIR/prim_generic_flash_bank.sv
read_verilog -sv $ENC_SRC_DIR/prim_generic_flash.sv

read_verilog -sv $ENC_SRC_DIR/clkmgr_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/clkmgr_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/clkmgr.sv

read_verilog -sv $ENC_SRC_DIR/flash_ctrl_core_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/flash_ctrl_region_cfg.sv
read_verilog -sv $ENC_SRC_DIR/flash_ctrl.sv

read_verilog -sv $ENC_SRC_DIR/sensor_ctrl_pkg.sv

read_verilog -sv $ENC_SRC_DIR/keymgr.sv
read_verilog -sv $ENC_SRC_DIR/keymgr_ctrl.sv
read_verilog -sv $ENC_SRC_DIR/keymgr_cfg_en.sv
read_verilog -sv $ENC_SRC_DIR/keymgr_data_en_state.sv
read_verilog -sv $ENC_SRC_DIR/keymgr_err.sv
read_verilog -sv $ENC_SRC_DIR/keymgr_input_checks.sv
read_verilog -sv $ENC_SRC_DIR/keymgr_kmac_if.sv
read_verilog -sv $ENC_SRC_DIR/keymgr_op_state_ctrl.sv
read_verilog -sv $ENC_SRC_DIR/keymgr_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/keymgr_reseed_ctrl.sv
read_verilog -sv $ENC_SRC_DIR/keymgr_sideload_key.sv
read_verilog -sv $ENC_SRC_DIR/keymgr_sideload_key_ctrl.sv

read_verilog -sv $ENC_SRC_DIR/kmac_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/kmac_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/kmac_core.sv
read_verilog -sv $ENC_SRC_DIR/kmac_msgfifo.sv
read_verilog -sv $ENC_SRC_DIR/kmac_staterd.sv
read_verilog -sv $ENC_SRC_DIR/kmac_app.sv
read_verilog -sv $ENC_SRC_DIR/kmac_entropy.sv
read_verilog -sv $ENC_SRC_DIR/kmac_errchk.sv
read_verilog -sv $ENC_SRC_DIR/kmac.sv

read_verilog -sv $ENC_SRC_DIR/lc_ctrl_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/lc_ctrl_state_decode.sv
read_verilog -sv $ENC_SRC_DIR/lc_ctrl_state_transition.sv
read_verilog -sv $ENC_SRC_DIR/lc_ctrl_signal_decode.sv
read_verilog -sv $ENC_SRC_DIR/lc_ctrl_fsm.sv
read_verilog -sv $ENC_SRC_DIR/lc_ctrl_kmac_if.sv
read_verilog -sv $ENC_SRC_DIR/lc_ctrl.sv

read_verilog -sv $ENC_SRC_DIR/otp_ctrl_core_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/otp_ctrl_ecc_reg.sv
read_verilog -sv $ENC_SRC_DIR/otp_ctrl_scrmbl.sv
read_verilog -sv $ENC_SRC_DIR/otp_ctrl_lfsr_timer.sv
read_verilog -sv $ENC_SRC_DIR/otp_ctrl_part_unbuf.sv
read_verilog -sv $ENC_SRC_DIR/otp_ctrl_part_buf.sv
read_verilog -sv $ENC_SRC_DIR/otp_ctrl_dai.sv
read_verilog -sv $ENC_SRC_DIR/otp_ctrl_kdi.sv
read_verilog -sv $ENC_SRC_DIR/otp_ctrl_lci.sv
read_verilog -sv $ENC_SRC_DIR/otp_ctrl.sv

read_verilog -sv $ENC_SRC_DIR/rom_ctrl_regs_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/rom_ctrl_rom_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/rom_ctrl.sv
read_verilog -sv $ENC_SRC_DIR/rom_ctrl_compare.sv
read_verilog -sv $ENC_SRC_DIR/rom_ctrl_counter.sv
read_verilog -sv $ENC_SRC_DIR/rom_ctrl_fsm.sv
read_verilog -sv $ENC_SRC_DIR/rom_ctrl_mux.sv
read_verilog -sv $ENC_SRC_DIR/rom_ctrl_scrambled_rom.sv

read_verilog -sv $ENC_SRC_DIR/prim_flash.sv

read_verilog -sv $ENC_SRC_DIR/padring.sv

read_verilog -sv $ENC_SRC_DIR/rstmgr_pkg.sv

read_verilog -sv $ENC_SRC_DIR/sensor_ctrl.sv

read_verilog -sv $ENC_SRC_DIR/flash_ctrl_erase.sv
read_verilog -sv $ENC_SRC_DIR/flash_ctrl_prog.sv
read_verilog -sv $ENC_SRC_DIR/flash_ctrl_rd.sv
read_verilog -sv $ENC_SRC_DIR/flash_ctrl_arb.sv
read_verilog -sv $ENC_SRC_DIR/flash_ctrl_info_cfg.sv
read_verilog -sv $ENC_SRC_DIR/flash_ctrl_lcmgr.sv
read_verilog -sv $ENC_SRC_DIR/flash_mp.sv
read_verilog -sv $ENC_SRC_DIR/flash_mp_data_region_sel.sv
read_verilog -sv $ENC_SRC_DIR/flash_phy.sv
read_verilog -sv $ENC_SRC_DIR/flash_phy_core.sv
read_verilog -sv $ENC_SRC_DIR/flash_phy_rd.sv
read_verilog -sv $ENC_SRC_DIR/flash_phy_prog.sv
read_verilog -sv $ENC_SRC_DIR/flash_phy_erase.sv
read_verilog -sv $ENC_SRC_DIR/flash_phy_rd_buffers.sv
read_verilog -sv $ENC_SRC_DIR/flash_phy_scramble.sv

read_verilog -sv $ENC_SRC_DIR/ast_reg_pkg.sv
read_verilog -sv $ENC_SRC_DIR/ast_pkg.sv
read_verilog -sv $ENC_SRC_DIR/ast_bhv_pkg.sv
read_verilog -sv $ENC_SRC_DIR/ast.sv
read_verilog -sv $ENC_SRC_DIR/ast_reg_top.sv
read_verilog -sv $ENC_SRC_DIR/adc.sv
read_verilog -sv $ENC_SRC_DIR/adc_ana.sv
read_verilog -sv $ENC_SRC_DIR/vcc_pgd.sv
read_verilog -sv $ENC_SRC_DIR/vio_pgd.sv
read_verilog -sv $ENC_SRC_DIR/vcaon_pgd.sv
read_verilog -sv $ENC_SRC_DIR/vcmain_pgd.sv
read_verilog -sv $ENC_SRC_DIR/ast_alert.sv
read_verilog -sv $ENC_SRC_DIR/aon_clk.sv
read_verilog -sv $ENC_SRC_DIR/aon_osc.sv
read_verilog -sv $ENC_SRC_DIR/io_clk.sv
read_verilog -sv $ENC_SRC_DIR/io_osc.sv
read_verilog -sv $ENC_SRC_DIR/sys_clk.sv
read_verilog -sv $ENC_SRC_DIR/sys_osc.sv
read_verilog -sv $ENC_SRC_DIR/usb_clk.sv
read_verilog -sv $ENC_SRC_DIR/usb_osc.sv
read_verilog -sv $ENC_SRC_DIR/gfr_clk_mux2.sv
read_verilog -sv $ENC_SRC_DIR/ast_clks_byp.sv
read_verilog -sv $ENC_SRC_DIR/rglts_pdm_3p3v.sv
read_verilog -sv $ENC_SRC_DIR/ast_pulse_sync.sv
read_verilog -sv $ENC_SRC_DIR/ast_entropy.sv
read_verilog -sv $ENC_SRC_DIR/dev_entropy.sv
read_verilog -sv $ENC_SRC_DIR/rng.sv
read_verilog -sv $ENC_SRC_DIR/ast_dft.sv

read_verilog -sv $ENC_SRC_DIR/rstmgr.sv

read_verilog -sv $ENC_SRC_DIR/rstmgr_cnsty_chk.sv

read_verilog -sv $ENC_SRC_DIR/rstmgr_ctrl.sv
read_verilog -sv $ENC_SRC_DIR/rstmgr_por.sv
read_verilog -sv $ENC_SRC_DIR/rstmgr_crash_info.sv
read_verilog -sv $ENC_SRC_DIR/rstmgr_leaf_rst.sv

read_verilog -sv $ENC_SRC_DIR/top_earlgrey_rnd_cnst_pkg.sv
read_verilog -sv $ENC_SRC_DIR/top_earlgrey.sv

read_verilog -sv $ENC_SRC_DIR/clkgen_xil7series.sv
read_verilog -sv $ENC_SRC_DIR/usr_access_xil7series.sv

read_verilog -sv $ENC_SRC_DIR/top_earlgrey_awsf1.sv
read_verilog -sv $ENC_SRC_DIR/chip_earlgrey_awsf1.sv


#   read_verilog -sv [glob $ENC_SRC_DIR/*.?v]

#---- End of section replaced by User ----

puts "AWS FPGA: Reading AWS Shell design";

#Read AWS Design files
read_verilog -sv [ list \
  $HDK_SHELL_DESIGN_DIR/lib/lib_pipe.sv \
  $HDK_SHELL_DESIGN_DIR/lib/bram_2rw.sv \
  $HDK_SHELL_DESIGN_DIR/lib/flop_fifo.sv \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/synth/sync.v \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/synth/flop_ccf.sv \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/synth/ccf_ctl.v \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/synth/mgt_acc_axl.sv  \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/synth/mgt_gen_axl.sv  \
  $HDK_SHELL_DESIGN_DIR/sh_ddr/synth/sh_ddr.sv \
  $HDK_SHELL_DESIGN_DIR/interfaces/cl_ports.vh
]

puts "AWS FPGA: Reading IP blocks";

#Read DDR IP
# read_ip [ list \
#  $HDK_SHELL_DESIGN_DIR/ip/ddr4_core/ddr4_core.xci
# ]

#Read IP for axi register slices
read_ip [ list \
  $HDK_SHELL_DESIGN_DIR/ip/src_register_slice/src_register_slice.xci \
  $HDK_SHELL_DESIGN_DIR/ip/dest_register_slice/dest_register_slice.xci \
  $HDK_SHELL_DESIGN_DIR/ip/axi_clock_converter_0/axi_clock_converter_0.xci \
  $HDK_SHELL_DESIGN_DIR/ip/axi_register_slice/axi_register_slice.xci \
  $HDK_SHELL_DESIGN_DIR/ip/axi_register_slice_light/axi_register_slice_light.xci
]

#Read IP for virtual jtag / ILA/VIO
read_ip [ list \
  $HDK_SHELL_DESIGN_DIR/ip/cl_debug_bridge/cl_debug_bridge.xci \
  $HDK_SHELL_DESIGN_DIR/ip/ila_1/ila_1.xci \
  $HDK_SHELL_DESIGN_DIR/ip/ila_vio_counter/ila_vio_counter.xci \
  $HDK_SHELL_DESIGN_DIR/ip/vio_0/vio_0.xci
]

# Additional IP's that might be needed if using the DDR
# read_bd [ list \
#  $HDK_SHELL_DESIGN_DIR/ip/cl_axi_interconnect/cl_axi_interconnect.bd
# ]

puts "AWS FPGA: Reading AWS constraints";

#Read all the constraints
#
#  cl_clocks_aws.xdc  - AWS auto-generated clock constraint.   ***DO NOT MODIFY***
#  cl_ddr.xdc         - AWS provided DDR pin constraints.      ***DO NOT MODIFY***
#  cl_synth_user.xdc  - Developer synthesis constraints.
read_xdc [ list \
   $CL_DIR/build/constraints/cl_clocks_aws.xdc \
   $HDK_SHELL_DIR/build/constraints/cl_ddr.xdc \
   $HDK_SHELL_DIR/build/constraints/cl_synth_aws.xdc \
   $CL_DIR/build/constraints/cl_synth_user.xdc
]

#Do not propagate local clock constraints for clocks generated in the SH
set_property USED_IN {synthesis implementation OUT_OF_CONTEXT} [get_files cl_clocks_aws.xdc]
set_property PROCESSING_ORDER EARLY  [get_files cl_clocks_aws.xdc]

########################
# CL Synthesis
########################
puts "AWS FPGA: ([clock format [clock seconds] -format %T]) Start design synthesis.";

update_compile_order -fileset sources_1
puts "\nRunning synth_design for $CL_MODULE $CL_DIR/build/scripts \[[clock format [clock seconds] -format {%a %b %d %H:%M:%S %Y}]\]"
eval [concat synth_design -top $CL_MODULE -verilog_define XSDB_SLV_DIS $VDEFINES -part [DEVICE_TYPE] -mode out_of_context $synth_options -directive $synth_directive]

set failval [catch {exec grep "FAIL" failfast.csv}]
if { $failval==0 } {
	puts "AWS FPGA: FATAL ERROR--Resource utilization error; check failfast.csv for details"
	exit 1
}

puts "AWS FPGA: ([clock format [clock seconds] -format %T]) writing post synth checkpoint.";
write_checkpoint -force $CL_DIR/build/checkpoints/${timestamp}.CL.post_synth.dcp
#write_checkpoint -force $CL_DIR/build/checkpoints/CL.post_synth.dcp


close_project
#Set param back to default value
set_param sta.enableAutoGenClkNamePersistence 1
