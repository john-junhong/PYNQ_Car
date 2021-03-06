connect -url tcp:127.0.0.1:3121
source /home/junhonglin/Xilinx/PYNQ_Car/base.sdk/hw_base/ps7_init.tcl
targets -set -filter {jtag_cable_name =~ "Xilinx TUL 1234-tulA" && level==0} -index 1
fpga -file /home/junhonglin/Xilinx/PYNQ_Car/base.sdk/hw_base/download.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Xilinx TUL 1234-tulA"} -index 0
loadhw -hw /home/junhonglin/Xilinx/PYNQ_Car/base.sdk/hw_base/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Xilinx TUL 1234-tulA"} -index 0
stop
ps7_init
configparams force-mem-access 0
bpadd -addr &main
