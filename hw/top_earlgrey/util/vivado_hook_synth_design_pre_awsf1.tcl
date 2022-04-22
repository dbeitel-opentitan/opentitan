# Copyright lowRISC contributors.
# Licensed under the Apache License, Version 2.0, see LICENSE for details.
# SPDX-License-Identifier: Apache-2.0


package require tar

## Do not edit $TOP
set TOP top_sp

## Replace with the name of your module
set CL_MODULE chip_earlgrey_awsf1

#################################################
## Command-line Arguments
#################################################
set timestamp           22_07_08-041014
set strategy            DEFAULT
set hdk_version         1.4.24
set shell_version       0x04261818
set device_id           0xF080
set vendor_id           0x1D1F
set subsystem_id        0x1D01
set subsystem_vendor_id 0xFE0D
set clock_recipe_a      A0
set clock_recipe_b      B0
set clock_recipe_c      C0
set uram_option         2
set notify_via_sns      1

##################################################
## Flow control variables
##################################################
set cl.synth   1
set implement  1

#################################################
## Generate CL_routed.dcp (Done by User)
#################################################
puts "AWS FPGA Scripts";
puts "Creating Design Checkpoint from Custom Logic source code";
puts "HDK Version:            $hdk_version";
puts "Shell Version:          $shell_version";
puts "Vivado Script Name:     $argv0";
puts "Strategy:               $strategy";
puts "PCI Device ID           $device_id";
puts "PCI Vendor ID           $vendor_id";
puts "PCI Subsystem ID        $subsystem_id";
puts "PCI Subsystem Vendor ID $subsystem_vendor_id";
puts "Clock Recipe A:         $clock_recipe_a";
puts "Clock Recipe B:         $clock_recipe_b";
puts "Clock Recipe C:         $clock_recipe_c";
puts "URAM option:            $uram_option";
puts "Notify when done:       $notify_via_sns";

#checking if CL_DIR env variable exists
#if { [info exists ::env(CL_DIR)] } {
#        set CL_DIR $::env(CL_DIR)
#        puts "Using CL directory $CL_DIR";
#} else {
#        puts "Error: CL_DIR environment variable not defined ! ";
#        puts "Use export CL_DIR=Your_Design_Root_Directory"
#        exit 2
#}

#checking if HDK_SHELL_DIR env variable exists
if { [info exists ::env(HDK_SHELL_DIR)] } {
        set HDK_SHELL_DIR $::env(HDK_SHELL_DIR)
        puts "Using Shell directory $HDK_SHELL_DIR";
} else {
        puts "Error: HDK_SHELL_DIR environment variable not defined ! ";
        puts "Run the hdk_setup.sh script from the root directory of aws-fpga";
        exit 2
}

#checking if HDK_SHELL_DESIGN_DIR env variable exists
if { [info exists ::env(HDK_SHELL_DESIGN_DIR)] } {
        set HDK_SHELL_DESIGN_DIR $::env(HDK_SHELL_DESIGN_DIR)
        puts "Using Shell design directory $HDK_SHELL_DESIGN_DIR";
} else {
        puts "Error: HDK_SHELL_DESIGN_DIR environment variable not defined ! ";
        puts "Run the hdk_setup.sh script from the root directory of aws-fpga";
        exit 2
}

##################################################
### Output Directories used by step_user.tcl
##################################################
#set implDir   $CL_DIR/build/checkpoints
#set rptDir    $CL_DIR/build/reports
#set cacheDir  $HDK_SHELL_DESIGN_DIR/cache/ddr4_phy

puts "All reports and intermediate results will be time stamped with $timestamp";

set_msg_config -id {Chipscope 16-3} -suppress
set_msg_config -string {AXI_QUAD_SPI} -suppress

# Change the severity of some messages.

# Abort if the boot ROM init file cannot be found. This is normally just a critical warning
# which is easily overlooked. The bitstream can still be generated but is not functional.
set_msg_config -id {[Synth 8-4445]} -new_severity ERROR

# Abort upon inferring latches. This is normally just a warning. We want to avoid that
# code inferring latches ends up in the repo in the first place.
set_msg_config -id {[Synth 8-327]} -new_severity ERROR

# Abort if a create_clock command fails. This typically happens if anchor points for clock
# constraints inside the design change. The failure is normally just reported as a critical
# warning in batch mode which is easily overlooked. The design might still work but some clocks
# will be unconstrained which can lead to other problems later on.
set_msg_config -id {[Vivado 12-4739]} -new_severity ERROR

# Abort if pblock constraints lose their target cells. This can happen if hierarchies change and
# the constraint doesn't get updated.
set_msg_config -id {[Vivado 12-1433]} -new_severity ERROR

set_msg_config -severity "CRITICAL WARNING" -string "WRAPPER_INST/SH" -suppress
set_msg_config -severity "WARNING"          -string "WRAPPER_INST/SH" -suppress

# Check that an email address has been set, else unset notify_via_sns

if {[string compare $notify_via_sns "1"] == 0} {
  if {![info exists env(EMAIL)]} {
    puts "AWS FPGA: ([clock format [clock seconds] -format %T]) EMAIL variable empty!  Completition notification will *not* be sent!";
    set notify_via_sns 0;
  } else {
    puts "AWS FPGA: ([clock format [clock seconds] -format %T]) EMAIL address for completion notification set to $env(EMAIL).";
  }
}

##################################################
### Strategy options
##################################################
switch $strategy {
    "BASIC" {
        puts "BASIC strategy."
        source $HDK_SHELL_DIR/build/scripts/strategy_BASIC.tcl
    }
    "EXPLORE" {
        puts "EXPLORE strategy."
        source $HDK_SHELL_DIR/build/scripts/strategy_EXPLORE.tcl
    }
    "TIMING" {
        puts "TIMING strategy."
        source $HDK_SHELL_DIR/build/scripts/strategy_TIMING.tcl
    }
    "CONGESTION" {
        puts "CONGESTION strategy."
        source $HDK_SHELL_DIR/build/scripts/strategy_CONGESTION.tcl
    }
    "DEFAULT" {
        puts "DEFAULT strategy."
        source $HDK_SHELL_DIR/build/scripts/strategy_DEFAULT.tcl
    }
    default {
        puts "$strategy is NOT a valid strategy. Defaulting to strategy DEFAULT."
        source $HDK_SHELL_DIR/build/scripts/strategy_DEFAULT.tcl
    }
}


#Procedure for running various implementation steps (impl_step)
source $HDK_SHELL_DIR/build/scripts/step_user.tcl -notrace


#################################################################
##### Do not remove this setting. Need to workaround bug in Vivado
##################################################################
set_param hd.clockRoutingWireReduction false


#Param needed to avoid clock name collisions
set_param sta.enableAutoGenClkNamePersistence 0

########################
# CL Synthesis
########################
puts "AWS FPGA: ([clock format [clock seconds] -format %T]) Start design synthesis.";

update_compile_order -fileset sources_1

