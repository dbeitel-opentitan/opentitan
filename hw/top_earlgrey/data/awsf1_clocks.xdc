## Copyright lowRISC contributors.
## Licensed under the Apache License, Version 2.0, see LICENSE for details.
## SPDX-License-Identifier: Apache-2.0

# Group A Clocks
create_clock -period 8  -name clk_main_a0 -waveform {0.000 4}  [get_ports clk_main_a0]
create_clock -period 16 -name clk_extra_a1 -waveform {0.000 8} [get_ports clk_extra_a1]
create_clock -period 5.333 -name clk_extra_a2 -waveform {0.000 2.667} [get_ports clk_extra_a2]
create_clock -period 4 -name clk_extra_a3 -waveform {0.000 2} [get_ports clk_extra_a3]

# Group B Clocks
create_clock -period 2.5 -name clk_extra_b0 -waveform {0.000 1.25} [get_ports clk_extra_b0]
create_clock -period 10 -name clk_extra_b1 -waveform {0.000 5} [get_ports clk_extra_b1]

# Group C Clocks
create_clock -period 3.333 -name clk_extra_c0 -waveform {0.000 1.667} [get_ports clk_extra_c0]
create_clock -period 2.5 -name clk_extra_c1 -waveform {0.000 1.25} [get_ports clk_extra_c1]

## Clock Signal
#create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports IO_CLK]

## Clock Domain Crossings
set clks_10_unbuf [get_clocks -of_objects [get_pin clkgen/pll/CLKOUT0]]
set clks_48_unbuf [get_clocks -of_objects [get_pin clkgen/pll/CLKOUT1]]
set clks_aon_unbuf [get_clocks -of_objects [get_pin clkgen/pll/CLKOUT2]]

## Divided clock
## This is not really recommended per Vivado's guidelines, but hopefully these clocks are slow enough and their
## destination flops few enough.

set u_pll clkgen/pll
set u_div2 top_*/u_clkmgr_aon/u_no_scan_io_div2_div
create_generated_clock -name clk_io_div2 -source [get_pin ${u_pll}/CLKOUT0] -divide_by 2 [get_pin ${u_div2}/u_clk_div_buf/gen_xilinx.u_impl_xilinx/gen_fpga_buf.bufg_i/O]

set u_div4 top_*/u_clkmgr_aon/u_no_scan_io_div4_div
create_generated_clock -name clk_io_div4 -source [get_pin ${u_pll}/CLKOUT0] -divide_by 4 [get_pin ${u_div4}/u_clk_div_buf/gen_xilinx.u_impl_xilinx/gen_fpga_buf.bufg_i/O]

# the step-down mux is implemented with a LUT right now and the mux switches on the falling edge. 
# therefore, Vivado propagates both clock edges down the clock network.
# this implementation is not ideal - but we can at least tell Vivado to only honour the rising edge for 
# timing analysis.
set_clock_sense -positive top_*/u_clkmgr_aon/u_no_scan_io_div2_div/gen_div2.u_div2/gen_fpga_buf.bufg_i_i_1__0/O

## JTAG and SPI clocks
create_clock -add -name lc_jtag_tck -period 100.00 -waveform {0 5} [get_pin top_*/u_pinmux_aon/u_pinmux_strap_sampling/u_pinmux_jtag_buf_lc/prim_clock_buf_tck/gen_xilinx.u_impl_xilinx/gen_fpga_buf.bufg_i/O]
create_clock -add -name rv_jtag_tck -period 100.00 -waveform {0 5} [get_pin top_*/u_pinmux_aon/u_pinmux_strap_sampling/u_pinmux_jtag_buf_rv/prim_clock_buf_tck/gen_xilinx.u_impl_xilinx/gen_fpga_buf.bufg_i/O]
create_clock -add -name clk_spi_in  -period 100.00 -waveform {0 5} [get_pin top_*/u_spi_device/u_clk_spi_in_buf/gen_xilinx.u_impl_xilinx/gen_fpga_buf.bufg_i/O]
create_clock -add -name clk_spi_out -period 100.00 -waveform {0 5} [get_pin top_*/u_spi_device/u_clk_spi_out_buf/gen_xilinx.u_impl_xilinx/gen_fpga_buf.bufg_i/O]

set_clock_groups -group ${clks_10_unbuf} -group ${clks_48_unbuf} -group ${clks_aon_unbuf} -group clk_io_div2 -group clk_io_div4 -group lc_jtag_tck -group rv_jtag_tck -group clk_spi_in -group clk_spi_out -group clk_extra_b1 -asynchronous
