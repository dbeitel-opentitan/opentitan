# SPDX-FileCopyrightText: Copyright (c) 2022 by Rivos Inc.
# Confidential and proprietary, see LICENSE for details.
# SPDX-License-Identifier: LicenseRef-Rivos-Internal-Only

# Parses the instruction data in the files from `riscv-opcode` as well as
# similar files for our custom ISA to generate JSON representation
# of the RISC-V instructions implemented by the Rivos core.

import os
from os.path import exists
import sys



define_list = {"AST_BYPASS_CLK", "FPGA_XILINX", "PRIM_DEFAULT_IMPL"}
include_file = "opentitan_defines.vh"

def check_file_defines (sv_file_name):

   has_define = 0
   has_include = 0
   if not exists(sv_file_name):
        print(f'Cannot locate: {sv_file_name}')
        sys.exit()

   sv_file = open(sv_file_name, "r")
   for in_line in sv_file:
      if (in_line.find(include_file) != -1):
         has_include = 1
      for define_str in define_list:
         if (in_line.find(define_str) != -1):
            has_define = 1

   return has_define, has_include


def add_include (sv_file_name):
   copy_file_name = "temp_copy_file.12341"

   linux_cmd = 'echo "//" > ' + copy_file_name
   os.system(linux_cmd)
   linux_cmd = 'echo "// Include auto-inserted by add_header.ph" >> ' + copy_file_name
   os.system(linux_cmd)
   linux_cmd = 'echo "//" >> ' + copy_file_name
   os.system(linux_cmd)
   linux_cmd = 'echo "\`include \\"' + include_file + '\\"" >> ' + copy_file_name
   print (linux_cmd);
   os.system(linux_cmd)
   linux_cmd = 'echo "" >> ' + copy_file_name
   os.system(linux_cmd)
   linux_cmd = 'cat ' + sv_file_name + ' >> ' + copy_file_name
   os.system(linux_cmd)
   linux_cmd = 'mv ' + copy_file_name + ' ' + sv_file_name
   os.system(linux_cmd)



def main():

   for file_name in os.listdir('.'):
      if (os.path.isfile(file_name)):
         has_define, has_include = check_file_defines(file_name)
         if (has_define == 0):
            print(f'File %s has no defines, not updating' % file_name);
         elif ((has_define == 1) & (has_include == 0)):
            print(f'Adding include to file %s' % file_name);
            add_include (file_name)
         else:
            print(f'File %s has already been updated, not updating again' % file_name);


if __name__ == '__main__':
    main()
