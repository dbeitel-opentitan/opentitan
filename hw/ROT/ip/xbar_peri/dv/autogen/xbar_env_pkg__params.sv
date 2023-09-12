// SPDX-FileCopyrightText: Copyright (c) 2022 by Rivos Inc.
// Confidential and proprietary, see LICENSE for details.
// SPDX-License-Identifier: LicenseRef-Rivos-Internal-Only

// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// xbar_env_pkg__params generated by `tlgen.py` tool


// List of Xbar device memory map
tl_device_t xbar_devices[$] = '{
    '{"uart0", '{
        '{32'h30000000, 32'h30000fff}
    }},
    '{"i2c0", '{
        '{32'h30080000, 32'h30080fff}
    }},
    '{"gpio", '{
        '{32'h30040000, 32'h30040fff}
    }},
    '{"spi_host0", '{
        '{32'h30300000, 32'h3030003f}
    }},
    '{"spi_device", '{
        '{32'h30050000, 32'h30050fff}
    }},
    '{"rv_timer", '{
        '{32'h30100000, 32'h30100fff}
    }},
    '{"pwrmgr_aon", '{
        '{32'h30400000, 32'h30400fff}
    }},
    '{"rstmgr_aon", '{
        '{32'h30410000, 32'h30410fff}
    }},
    '{"clkmgr_aon", '{
        '{32'h30420000, 32'h30420fff}
    }},
    '{"pinmux_aon", '{
        '{32'h30460000, 32'h30460fff}
    }},
    '{"otp_ctrl__core", '{
        '{32'h30130000, 32'h30133fff}
    }},
    '{"otp_ctrl__prim", '{
        '{32'h30134000, 32'h30134fff}
    }},
    '{"lc_ctrl", '{
        '{32'h30140000, 32'h30140fff}
    }},
    '{"alert_handler", '{
        '{32'h30150000, 32'h30150fff}
    }},
    '{"sram_ctrl_ret_aon__regs", '{
        '{32'h30500000, 32'h30500fff}
    }},
    '{"sram_ctrl_ret_aon__ram", '{
        '{32'h30600000, 32'h30600fff}
    }},
    '{"aon_timer_aon", '{
        '{32'h30470000, 32'h30470fff}
    }},
    '{"ast", '{
        '{32'h30480000, 32'h30480fff}
}}};

  // List of Xbar hosts
tl_host_t xbar_hosts[$] = '{
    '{"main", 0, '{
        "uart0",
        "i2c0",
        "gpio",
        "spi_host0",
        "spi_device",
        "rv_timer",
        "pwrmgr_aon",
        "rstmgr_aon",
        "clkmgr_aon",
        "pinmux_aon",
        "otp_ctrl__core",
        "otp_ctrl__prim",
        "lc_ctrl",
        "alert_handler",
        "ast",
        "sram_ctrl_ret_aon__ram",
        "sram_ctrl_ret_aon__regs",
        "aon_timer_aon"}}
};
