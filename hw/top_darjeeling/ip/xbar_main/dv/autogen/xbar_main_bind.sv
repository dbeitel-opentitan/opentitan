// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// xbar_main_bind module generated by `tlgen.py` tool for assertions
module xbar_main_bind;
`ifndef GATE_LEVEL
  // Host interfaces
  bind xbar_main tlul_assert #(.EndpointType("Device")) tlul_assert_host_rv_core_ibex__corei (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_rv_core_ibex__corei_i),
    .d2h    (tl_rv_core_ibex__corei_o)
  );
  bind xbar_main tlul_assert #(.EndpointType("Device")) tlul_assert_host_rv_core_ibex__cored (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_rv_core_ibex__cored_i),
    .d2h    (tl_rv_core_ibex__cored_o)
  );
  bind xbar_main tlul_assert #(.EndpointType("Device")) tlul_assert_host_rv_dm__sba (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_rv_dm__sba_i),
    .d2h    (tl_rv_dm__sba_o)
  );
  bind xbar_main tlul_assert #(.EndpointType("Device")) tlul_assert_host_dma__host (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_dma__host_i),
    .d2h    (tl_dma__host_o)
  );

  // Device interfaces
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_rv_dm__regs (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_rv_dm__regs_o),
    .d2h    (tl_rv_dm__regs_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_rv_dm__mem (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_rv_dm__mem_o),
    .d2h    (tl_rv_dm__mem_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_rom_ctrl0__rom (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_rom_ctrl0__rom_o),
    .d2h    (tl_rom_ctrl0__rom_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_rom_ctrl0__regs (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_rom_ctrl0__regs_o),
    .d2h    (tl_rom_ctrl0__regs_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_rom_ctrl1__rom (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_rom_ctrl1__rom_o),
    .d2h    (tl_rom_ctrl1__rom_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_rom_ctrl1__regs (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_rom_ctrl1__regs_o),
    .d2h    (tl_rom_ctrl1__regs_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_peri (
    .clk_i  (clk_fixed_i),
    .rst_ni (rst_fixed_ni),
    .h2d    (tl_peri_o),
    .d2h    (tl_peri_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_soc_proxy__core (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_soc_proxy__core_o),
    .d2h    (tl_soc_proxy__core_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_soc_proxy__ctn (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_soc_proxy__ctn_o),
    .d2h    (tl_soc_proxy__ctn_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_spi_host1 (
    .clk_i  (clk_spi_host1_i),
    .rst_ni (rst_spi_host1_ni),
    .h2d    (tl_spi_host1_o),
    .d2h    (tl_spi_host1_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_usbdev (
    .clk_i  (clk_usb_i),
    .rst_ni (rst_usb_ni),
    .h2d    (tl_usbdev_o),
    .d2h    (tl_usbdev_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_flash_ctrl__core (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_flash_ctrl__core_o),
    .d2h    (tl_flash_ctrl__core_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_flash_ctrl__prim (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_flash_ctrl__prim_o),
    .d2h    (tl_flash_ctrl__prim_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_flash_ctrl__mem (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_flash_ctrl__mem_o),
    .d2h    (tl_flash_ctrl__mem_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_hmac (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_hmac_o),
    .d2h    (tl_hmac_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_kmac (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_kmac_o),
    .d2h    (tl_kmac_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_aes (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_aes_o),
    .d2h    (tl_aes_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_entropy_src (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_entropy_src_o),
    .d2h    (tl_entropy_src_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_csrng (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_csrng_o),
    .d2h    (tl_csrng_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_edn0 (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_edn0_o),
    .d2h    (tl_edn0_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_edn1 (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_edn1_o),
    .d2h    (tl_edn1_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_rv_plic (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_rv_plic_o),
    .d2h    (tl_rv_plic_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_otbn (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_otbn_o),
    .d2h    (tl_otbn_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_keymgr (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_keymgr_o),
    .d2h    (tl_keymgr_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_rv_core_ibex__cfg (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_rv_core_ibex__cfg_o),
    .d2h    (tl_rv_core_ibex__cfg_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_sram_ctrl_main__regs (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_sram_ctrl_main__regs_o),
    .d2h    (tl_sram_ctrl_main__regs_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_sram_ctrl_main__ram (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_sram_ctrl_main__ram_o),
    .d2h    (tl_sram_ctrl_main__ram_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_sram_ctrl_mbox__regs (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_sram_ctrl_mbox__regs_o),
    .d2h    (tl_sram_ctrl_mbox__regs_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_sram_ctrl_mbox__ram (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_sram_ctrl_mbox__ram_o),
    .d2h    (tl_sram_ctrl_mbox__ram_i)
  );
  bind xbar_main tlul_assert #(.EndpointType("Host")) tlul_assert_device_dma (
    .clk_i  (clk_main_i),
    .rst_ni (rst_main_ni),
    .h2d    (tl_dma_o),
    .d2h    (tl_dma_i)
  );
`endif
endmodule
