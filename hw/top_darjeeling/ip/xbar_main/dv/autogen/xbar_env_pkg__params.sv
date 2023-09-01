// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// xbar_env_pkg__params generated by `tlgen.py` tool


// List of Xbar device memory map
tl_device_t xbar_devices[$] = '{
    '{"rv_dm__regs", '{
        '{32'h21200000, 32'h21200003}
    }},
    '{"rv_dm__mem", '{
        '{32'h00040000, 32'h00040fff}
    }},
    '{"rom_ctrl0__rom", '{
        '{32'h00008000, 32'h0000ffff}
    }},
    '{"rom_ctrl0__regs", '{
        '{32'h211e0000, 32'h211e007f}
    }},
    '{"rom_ctrl1__rom", '{
        '{32'h00020000, 32'h0002ffff}
    }},
    '{"rom_ctrl1__regs", '{
        '{32'h211e1000, 32'h211e107f}
    }},
    '{"peri", '{
        '{32'h30000000, 32'h31ffffff}
    }},
    '{"soc_proxy__core", '{
        '{32'h22030000, 32'h22030003}
    }},
    '{"soc_proxy__ctn", '{
        '{32'h40000000, 32'h7fffffff}
    }},
    '{"spi_host1", '{
        '{32'h32000000, 32'h3200003f}
    }},
    '{"usbdev", '{
        '{32'h32010000, 32'h32010fff}
    }},
    '{"flash_ctrl__core", '{
        '{32'h33000000, 32'h330001ff}
    }},
    '{"flash_ctrl__prim", '{
        '{32'h33008000, 32'h3300807f}
    }},
    '{"flash_ctrl__mem", '{
        '{32'h34000000, 32'h340fffff}
    }},
    '{"hmac", '{
        '{32'h21110000, 32'h21110fff}
    }},
    '{"kmac", '{
        '{32'h21120000, 32'h21120fff}
    }},
    '{"aes", '{
        '{32'h21100000, 32'h211000ff}
    }},
    '{"csrng", '{
        '{32'h21150000, 32'h2115007f}
    }},
    '{"edn0", '{
        '{32'h21170000, 32'h2117007f}
    }},
    '{"edn1", '{
        '{32'h21180000, 32'h2118007f}
    }},
    '{"rv_plic", '{
        '{32'h28000000, 32'h2fffffff}
    }},
    '{"otbn", '{
        '{32'h21130000, 32'h2113ffff}
    }},
    '{"keymgr", '{
        '{32'h21140000, 32'h211400ff}
    }},
    '{"rv_core_ibex__cfg", '{
        '{32'h211f0000, 32'h211f07ff}
    }},
    '{"sram_ctrl_main__regs", '{
        '{32'h211c0000, 32'h211c001f}
    }},
    '{"sram_ctrl_main__ram", '{
        '{32'h10000000, 32'h1000ffff}
    }},
    '{"sram_ctrl_mbox__regs", '{
        '{32'h211d0000, 32'h211d001f}
    }},
    '{"sram_ctrl_mbox__ram", '{
        '{32'h11000000, 32'h11000fff}
    }},
    '{"dma", '{
        '{32'h22010000, 32'h220100ff}
}}};

  // List of Xbar hosts
tl_host_t xbar_hosts[$] = '{
    '{"rv_core_ibex__corei", 0, '{
        "rom_ctrl0__rom",
        "rom_ctrl1__rom",
        "rv_dm__mem",
        "sram_ctrl_main__ram",
        "flash_ctrl__mem",
        "soc_proxy__ctn"}}
    ,
    '{"rv_core_ibex__cored", 1, '{
        "rom_ctrl0__rom",
        "rom_ctrl0__regs",
        "rom_ctrl1__rom",
        "rom_ctrl1__regs",
        "rv_dm__mem",
        "rv_dm__regs",
        "sram_ctrl_main__ram",
        "peri",
        "spi_host1",
        "usbdev",
        "flash_ctrl__core",
        "flash_ctrl__prim",
        "flash_ctrl__mem",
        "aes",
        "csrng",
        "edn0",
        "edn1",
        "hmac",
        "rv_plic",
        "otbn",
        "keymgr",
        "kmac",
        "sram_ctrl_main__regs",
        "rv_core_ibex__cfg",
        "sram_ctrl_mbox__ram",
        "sram_ctrl_mbox__regs",
        "soc_proxy__ctn",
        "soc_proxy__core",
        "dma"}}
    ,
    '{"rv_dm__sba", 2, '{
        "rom_ctrl0__rom",
        "rom_ctrl0__regs",
        "rom_ctrl1__rom",
        "rom_ctrl1__regs",
        "rv_dm__mem",
        "rv_dm__regs",
        "sram_ctrl_main__ram",
        "peri",
        "spi_host1",
        "usbdev",
        "flash_ctrl__core",
        "flash_ctrl__prim",
        "flash_ctrl__mem",
        "aes",
        "csrng",
        "edn0",
        "edn1",
        "hmac",
        "rv_plic",
        "otbn",
        "keymgr",
        "kmac",
        "sram_ctrl_main__regs",
        "rv_core_ibex__cfg",
        "sram_ctrl_mbox__ram",
        "sram_ctrl_mbox__regs",
        "soc_proxy__ctn",
        "soc_proxy__core",
        "dma"}}
    ,
    '{"dma__host", 3, '{
        "sram_ctrl_main__ram",
        "peri"}}
};
