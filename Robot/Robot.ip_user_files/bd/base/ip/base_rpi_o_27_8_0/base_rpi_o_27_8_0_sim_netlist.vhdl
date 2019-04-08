-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
-- Date        : Wed Mar 20 13:53:25 2019
-- Host        : ubuntu running 64-bit Ubuntu 18.04.2 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/junhonglin/Xilinx/PYNQ_Car/Robot/Robot.srcs/sources_1/bd/base/ip/base_rpi_o_27_8_0/base_rpi_o_27_8_0_sim_netlist.vhdl
-- Design      : base_rpi_o_27_8_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_rpi_o_27_8_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 27 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 19 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of base_rpi_o_27_8_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of base_rpi_o_27_8_0 : entity is "base_rpi_o_27_8_0,xlslice_v1_0_1_xlslice,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of base_rpi_o_27_8_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of base_rpi_o_27_8_0 : entity is "xlslice_v1_0_1_xlslice,Vivado 2018.2";
end base_rpi_o_27_8_0;

architecture STRUCTURE of base_rpi_o_27_8_0 is
  signal \^din\ : STD_LOGIC_VECTOR ( 27 downto 0 );
begin
  Dout(19 downto 0) <= \^din\(27 downto 8);
  \^din\(27 downto 8) <= Din(27 downto 8);
end STRUCTURE;
