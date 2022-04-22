#!/bin/bash

BootRomInitFile="/home/centos/rivos/org.lowRISC.dbeitel-opentitan/bazel-out/k8-fastbuild-ST-97f470ee3b14/bin/sw/device/silicon_creator/mask_rom/mask_rom_fpga_awsf1.scr.39.vmem"
OtpCtrlMemInitFile="/home/centos/rivos/org.lowRISC.dbeitel-opentitan/bazel-out/k8-fastbuild/bin/hw/ip/otp_ctrl/data/img_rma.vmem"

FPGA_XILINX=1 
AST_BYPASS_CLK=1 
IBEX_CUSTOM_PMP_RESET_VALUES=1 
PRIM_DEFAULT_IMPL="prim_pkg::ImplXilinx"


./aws_build_dcp_from_cl.sh -clock_recipe_a A0 -notify \
    -vdefine BootRomInitFile=$BootRomInitFile,OtpCtrlMemInitFile=$OtpCtrlMemInitFile,FPGA_XILINX=$FPGA_XILINX,AST_BYPASS_CLK=$AST_BYPASS_CLK,IBEX_CUSTOM_PMP_RESET_VALUES=$IBEX_CUSTOM_PMP_RESET_VALUES,PRIM_DEFAULT_IMPL=$PRIM_DEFAULT_IMPL
             
             
             
