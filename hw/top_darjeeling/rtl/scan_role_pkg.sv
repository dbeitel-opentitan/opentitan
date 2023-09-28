// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Open-source scan role definitions for pads.
// This is only relevant for the ASIC target.

package scan_role_pkg;

  import prim_pad_wrapper_pkg::*;

  parameter scan_role_e DioPadAstMiscScanRole         = NoScan;
  parameter scan_role_e DioPadPorNScanRole            = NoScan;
  parameter scan_role_e DioPadSpiHostD0ScanRole       = NoScan;
  parameter scan_role_e DioPadSpiHostD1ScanRole       = NoScan;
  parameter scan_role_e DioPadSpiHostD2ScanRole       = NoScan;
  parameter scan_role_e DioPadSpiHostD3ScanRole       = NoScan;
  parameter scan_role_e DioPadSpiHostClkScanRole      = NoScan;
  parameter scan_role_e DioPadSpiHostCsLScanRole      = NoScan;
  parameter scan_role_e DioPadSpiDevD0ScanRole        = NoScan;
  parameter scan_role_e DioPadSpiDevD1ScanRole        = NoScan;
  parameter scan_role_e DioPadSpiDevD2ScanRole        = NoScan;
  parameter scan_role_e DioPadSpiDevD3ScanRole        = NoScan;
  parameter scan_role_e DioPadSpiDevClkScanRole       = NoScan;
  parameter scan_role_e DioPadSpiDevCsLScanRole       = NoScan;
  parameter scan_role_e DioPadSocGpi0ScanRole         = NoScan;
  parameter scan_role_e DioPadSocGpi1ScanRole         = NoScan;
  parameter scan_role_e DioPadSocGpi2ScanRole         = NoScan;
  parameter scan_role_e DioPadSocGpi3ScanRole         = NoScan;
  parameter scan_role_e DioPadSocGpi4ScanRole         = NoScan;
  parameter scan_role_e DioPadSocGpi5ScanRole         = NoScan;
  parameter scan_role_e DioPadSocGpi6ScanRole         = NoScan;
  parameter scan_role_e DioPadSocGpi7ScanRole         = NoScan;
  parameter scan_role_e DioPadSocGpi8ScanRole         = NoScan;
  parameter scan_role_e DioPadSocGpi9ScanRole         = NoScan;
  parameter scan_role_e DioPadSocGpi10ScanRole        = NoScan;
  parameter scan_role_e DioPadSocGpi11ScanRole        = NoScan;
  parameter scan_role_e DioPadSocGpo0ScanRole         = NoScan;
  parameter scan_role_e DioPadSocGpo1ScanRole         = NoScan;
  parameter scan_role_e DioPadSocGpo2ScanRole         = NoScan;
  parameter scan_role_e DioPadSocGpo3ScanRole         = NoScan;
  parameter scan_role_e DioPadSocGpo4ScanRole         = NoScan;
  parameter scan_role_e DioPadSocGpo5ScanRole         = NoScan;
  parameter scan_role_e DioPadSocGpo6ScanRole         = NoScan;
  parameter scan_role_e DioPadSocGpo7ScanRole         = NoScan;
  parameter scan_role_e DioPadSocGpo8ScanRole         = NoScan;
  parameter scan_role_e DioPadSocGpo9ScanRole         = NoScan;
  parameter scan_role_e DioPadSocGpo10ScanRole        = NoScan;
  parameter scan_role_e DioPadSocGpo11ScanRole        = NoScan;
  parameter scan_role_e DioPadOtpExtVoltScanRole      = NoScan;
  parameter scan_role_e MioPadIoa0ScanRole            = NoScan;
  parameter scan_role_e MioPadIoa1ScanRole            = NoScan;
  parameter scan_role_e MioPadIoa2ScanRole            = NoScan;
  parameter scan_role_e MioPadIoa3ScanRole            = NoScan;
  parameter scan_role_e MioPadIoa4ScanRole            = NoScan;
  parameter scan_role_e MioPadIoa5ScanRole            = NoScan;
  parameter scan_role_e MioPadIoa6ScanRole            = NoScan;
  parameter scan_role_e MioPadIoa7ScanRole            = NoScan;
  parameter scan_role_e MioPadIoa8ScanRole            = NoScan;
  parameter scan_role_e MioPadIob0ScanRole            = NoScan;
  parameter scan_role_e MioPadIob1ScanRole            = NoScan;
  parameter scan_role_e MioPadIob2ScanRole            = NoScan;
  parameter scan_role_e MioPadIob3ScanRole            = NoScan;
  parameter scan_role_e MioPadIob4ScanRole            = NoScan;
  parameter scan_role_e MioPadIob5ScanRole            = NoScan;
  parameter scan_role_e MioPadIob6ScanRole            = NoScan;
  parameter scan_role_e MioPadIob7ScanRole            = NoScan;
  parameter scan_role_e MioPadIob8ScanRole            = NoScan;
  parameter scan_role_e MioPadIob9ScanRole            = NoScan;
  parameter scan_role_e MioPadIob10ScanRole           = NoScan;
  parameter scan_role_e MioPadIob11ScanRole           = NoScan;
  parameter scan_role_e MioPadIob12ScanRole           = NoScan;
  parameter scan_role_e MioPadIoc0ScanRole            = NoScan;
  parameter scan_role_e MioPadIoc1ScanRole            = NoScan;
  parameter scan_role_e MioPadIoc2ScanRole            = NoScan;
  parameter scan_role_e MioPadIoc3ScanRole            = NoScan;
  parameter scan_role_e MioPadIoc4ScanRole            = NoScan;
  parameter scan_role_e MioPadIoc5ScanRole            = NoScan;
  parameter scan_role_e MioPadIoc6ScanRole            = NoScan;
  parameter scan_role_e MioPadIoc7ScanRole            = NoScan;
  parameter scan_role_e MioPadIoc8ScanRole            = NoScan;
  parameter scan_role_e MioPadIoc9ScanRole            = NoScan;
  parameter scan_role_e MioPadIoc10ScanRole           = NoScan;
  parameter scan_role_e MioPadIoc11ScanRole           = NoScan;
  parameter scan_role_e MioPadIoc12ScanRole           = NoScan;
  parameter scan_role_e MioPadIor0ScanRole            = NoScan;
  parameter scan_role_e MioPadIor1ScanRole            = NoScan;
  parameter scan_role_e MioPadIor2ScanRole            = NoScan;
  parameter scan_role_e MioPadIor3ScanRole            = NoScan;
  parameter scan_role_e MioPadIor4ScanRole            = NoScan;
  parameter scan_role_e MioPadIor5ScanRole            = NoScan;
  parameter scan_role_e MioPadIor6ScanRole            = NoScan;
  parameter scan_role_e MioPadIor7ScanRole            = NoScan;
  parameter scan_role_e MioPadIor10ScanRole           = NoScan;
  parameter scan_role_e MioPadIor11ScanRole           = NoScan;
  parameter scan_role_e MioPadIor12ScanRole           = NoScan;
  parameter scan_role_e MioPadIor13ScanRole           = NoScan;

endpackage : scan_role_pkg
