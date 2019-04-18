-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
-- Date        : Mon Mar 18 14:17:50 2019
-- Host        : ubuntu running 64-bit unknown
-- Command     : write_vhdl -force -mode funcsim
--               /home/junhonglin/Xilinx/PYNQ_Car/Robot/Robot.srcs/sources_1/bd/system/ip/system_constant_tkeep_tstrb_0/system_constant_tkeep_tstrb_0_sim_netlist.vhdl
-- Design      : system_constant_tkeep_tstrb_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_constant_tkeep_tstrb_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_constant_tkeep_tstrb_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_constant_tkeep_tstrb_0 : entity is "system_constant_tkeep_tstrb_0,xlconstant_v1_1_5_xlconstant,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_constant_tkeep_tstrb_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_constant_tkeep_tstrb_0 : entity is "xlconstant_v1_1_5_xlconstant,Vivado 2018.2";
end system_constant_tkeep_tstrb_0;

architecture STRUCTURE of system_constant_tkeep_tstrb_0 is
  signal \<const1>\ : STD_LOGIC;
begin
  dout(7) <= \<const1>\;
  dout(6) <= \<const1>\;
  dout(5) <= \<const1>\;
  dout(4) <= \<const1>\;
  dout(3) <= \<const1>\;
  dout(2) <= \<const1>\;
  dout(1) <= \<const1>\;
  dout(0) <= \<const1>\;
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
end STRUCTURE;