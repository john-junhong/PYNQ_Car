// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
// Date        : Wed Mar 20 13:53:08 2019
// Host        : ubuntu running 64-bit Ubuntu 18.04.2 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/junhonglin/Xilinx/PYNQ_Car/Robot/Robot.srcs/sources_1/bd/base/ip/base_rpi_i_27_0_0/base_rpi_i_27_0_0_stub.v
// Design      : base_rpi_i_27_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "xlconcat_v2_1_1_xlconcat,Vivado 2018.2" *)
module base_rpi_i_27_0_0(In0, In1, dout)
/* synthesis syn_black_box black_box_pad_pin="In0[7:0],In1[19:0],dout[27:0]" */;
  input [7:0]In0;
  input [19:0]In1;
  output [27:0]dout;
endmodule
