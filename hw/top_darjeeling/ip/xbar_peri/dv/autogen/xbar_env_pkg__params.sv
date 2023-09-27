// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// xbar_env_pkg__params generated by `tlgen.py` tool


// List of Xbar device memory map
tl_device_t xbar_devices[$] = '{
    '{"uart0", '{
        '{32'h30010000, 32'h3001003f}
    }},
    '{"i2c0", '{
        '{32'h30080000, 32'h3008007f}
    }},
    '{"gpio", '{
        '{32'h30000000, 32'h3000007f}
    }},
    '{"spi_host0", '{
        '{32'h30300000, 32'h3030003f}
    }},
    '{"spi_device", '{
        '{32'h30310000, 32'h30311fff}
    }},
    '{"rv_timer", '{
        '{32'h30100000, 32'h301001ff}
    }},
    '{"pwrmgr_aon", '{
        '{32'h30400000, 32'h3040007f}
    }},
    '{"rstmgr_aon", '{
        '{32'h30410000, 32'h3041007f}
    }},
    '{"clkmgr_aon", '{
        '{32'h30420000, 32'h3042007f}
    }},
    '{"pinmux_aon", '{
        '{32'h30460000, 32'h304607ff}
    }},
    '{"otp_ctrl__core", '{
        '{32'h30130000, 32'h30137fff}
    }},
    '{"otp_ctrl__prim", '{
        '{32'h30138000, 32'h3013801f}
    }},
    '{"lc_ctrl", '{
        '{32'h30140000, 32'h301400ff}
    }},
    '{"sensor_ctrl", '{
        '{32'h30020000, 32'h3002003f}
    }},
    '{"alert_handler", '{
        '{32'h30150000, 32'h301507ff}
    }},
    '{"sram_ctrl_ret_aon__regs", '{
        '{32'h30500000, 32'h3050001f}
    }},
    '{"sram_ctrl_ret_aon__ram", '{
        '{32'h30600000, 32'h30600fff}
    }},
    '{"aon_timer_aon", '{
        '{32'h30470000, 32'h3047003f}
    }},
    '{"ast", '{
        '{32'h30480000, 32'h304803ff}
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
        "sensor_ctrl",
        "alert_handler",
        "ast",
        "sram_ctrl_ret_aon__ram",
        "sram_ctrl_ret_aon__regs",
        "aon_timer_aon"}}
};
