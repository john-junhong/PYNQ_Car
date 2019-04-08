-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
-- Date        : Mon Mar 18 13:45:42 2019
-- Host        : ubuntu running 64-bit Ubuntu 16.04.5 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/junhonglin/Xilinx/PYNQ_Car/Robot/Robot.srcs/sources_1/bd/system/ip/system_mb3_timer_capture_4_0/system_mb3_timer_capture_4_0_sim_netlist.vhdl
-- Design      : system_mb3_timer_capture_4_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_mb3_timer_capture_4_0 is
  port (
    Din : in STD_LOGIC_VECTOR ( 7 downto 0 );
    Dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of system_mb3_timer_capture_4_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of system_mb3_timer_capture_4_0 : entity is "system_mb3_timer_capture_4_0,xlslice_v1_0_1_xlslice,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of system_mb3_timer_capture_4_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of system_mb3_timer_capture_4_0 : entity is "xlslice_v1_0_1_xlslice,Vivado 2018.2";
end system_mb3_timer_capture_4_0;

architecture STRUCTURE of system_mb3_timer_capture_4_0 is
  signal \^din\ : STD_LOGIC_VECTOR ( 7 downto 0 );
begin
  Dout(0) <= \^din\(4);
  \^din\(4) <= Din(4);
end STRUCTURE;
