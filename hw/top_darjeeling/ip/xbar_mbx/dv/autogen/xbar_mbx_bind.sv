// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// xbar_mbx_bind module generated by `tlgen.py` tool for assertions
module xbar_mbx_bind;
`ifndef GATE_LEVEL
  // Host interfaces
  bind xbar_mbx tlul_assert #(.EndpointType("Device")) tlul_assert_host_mbx (
    .clk_i  (clk_mbx_i),
    .rst_ni (rst_mbx_ni),
    .h2d    (tl_mbx_i),
    .d2h    (tl_mbx_o)
  );

  // Device interfaces
  bind xbar_mbx tlul_assert #(.EndpointType("Host")) tlul_assert_device_mbx0__soc (
    .clk_i  (clk_mbx_i),
    .rst_ni (rst_mbx_ni),
    .h2d    (tl_mbx0__soc_o),
    .d2h    (tl_mbx0__soc_i)
  );
  bind xbar_mbx tlul_assert #(.EndpointType("Host")) tlul_assert_device_mbx1__soc (
    .clk_i  (clk_mbx_i),
    .rst_ni (rst_mbx_ni),
    .h2d    (tl_mbx1__soc_o),
    .d2h    (tl_mbx1__soc_i)
  );
  bind xbar_mbx tlul_assert #(.EndpointType("Host")) tlul_assert_device_mbx2__soc (
    .clk_i  (clk_mbx_i),
    .rst_ni (rst_mbx_ni),
    .h2d    (tl_mbx2__soc_o),
    .d2h    (tl_mbx2__soc_i)
  );
  bind xbar_mbx tlul_assert #(.EndpointType("Host")) tlul_assert_device_mbx3__soc (
    .clk_i  (clk_mbx_i),
    .rst_ni (rst_mbx_ni),
    .h2d    (tl_mbx3__soc_o),
    .d2h    (tl_mbx3__soc_i)
  );
  bind xbar_mbx tlul_assert #(.EndpointType("Host")) tlul_assert_device_mbx4__soc (
    .clk_i  (clk_mbx_i),
    .rst_ni (rst_mbx_ni),
    .h2d    (tl_mbx4__soc_o),
    .d2h    (tl_mbx4__soc_i)
  );
  bind xbar_mbx tlul_assert #(.EndpointType("Host")) tlul_assert_device_mbx5__soc (
    .clk_i  (clk_mbx_i),
    .rst_ni (rst_mbx_ni),
    .h2d    (tl_mbx5__soc_o),
    .d2h    (tl_mbx5__soc_i)
  );
  bind xbar_mbx tlul_assert #(.EndpointType("Host")) tlul_assert_device_mbx6__soc (
    .clk_i  (clk_mbx_i),
    .rst_ni (rst_mbx_ni),
    .h2d    (tl_mbx6__soc_o),
    .d2h    (tl_mbx6__soc_i)
  );
  bind xbar_mbx tlul_assert #(.EndpointType("Host")) tlul_assert_device_mbx7__soc (
    .clk_i  (clk_mbx_i),
    .rst_ni (rst_mbx_ni),
    .h2d    (tl_mbx7__soc_o),
    .d2h    (tl_mbx7__soc_i)
  );
  bind xbar_mbx tlul_assert #(.EndpointType("Host")) tlul_assert_device_mbx_jtag__soc (
    .clk_i  (clk_mbx_i),
    .rst_ni (rst_mbx_ni),
    .h2d    (tl_mbx_jtag__soc_o),
    .d2h    (tl_mbx_jtag__soc_i)
  );
  bind xbar_mbx tlul_assert #(.EndpointType("Host")) tlul_assert_device_mbx_pcie0__soc (
    .clk_i  (clk_mbx_i),
    .rst_ni (rst_mbx_ni),
    .h2d    (tl_mbx_pcie0__soc_o),
    .d2h    (tl_mbx_pcie0__soc_i)
  );
`endif
endmodule
