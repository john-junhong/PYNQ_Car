-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
-- Date        : Wed Mar 20 13:53:08 2019
-- Host        : ubuntu running 64-bit Ubuntu 18.04.2 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/junhonglin/Xilinx/PYNQ_Car/Robot/Robot.srcs/sources_1/bd/base/ip/base_rpi_i_27_0_0/base_rpi_i_27_0_0_sim_netlist.vhdl
-- Design      : base_rpi_i_27_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity base_rpi_i_27_0_0 is
  port (
    In0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    In1 : in STD_LOGIC_VECTOR ( 19 downto 0 );
    dout : out STD_LOGIC_VECTOR ( 27 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of base_rpi_i_27_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of base_rpi_i_27_0_0 : entity is "base_rpi_i_27_0_0,xlconcat_v2_1_1_xlconcat,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of base_rpi_i_27_0_0 : entity is "yes";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of base_rpi_i_27_0_0 : entity is "xlconcat_v2_1_1_xlconcat,Vivado 2018.2";
end base_rpi_i_27_0_0;

architecture STRUCTURE of base_rpi_i_27_0_0 is
  signal \^in0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \^in1\ : STD_LOGIC_VECTOR ( 19 downto 0 );
begin
  \^in0\(7 downto 0) <= In0(7 downto 0);
  \^in1\(19 downto 0) <= In1(19 downto 0);
  dout(27 downto 8) <= \^in1\(19 downto 0);
  dout(7 downto 0) <= \^in0\(7 downto 0);
end STRUCTURE;
