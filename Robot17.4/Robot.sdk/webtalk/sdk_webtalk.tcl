webtalk_init -webtalk_dir /home/junhonglin/Xilinx/PYNQ_Car/Robot/Robot.sdk/webtalk
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "2019-03-15 17:08:28" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "SDK v2017.4" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "2017.4" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "amd64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "SDK" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "false" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "vvepalhdq62cfkfg3hqd5hcduh" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "2017.4_17" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "17" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "Ubuntu" -context "user_environment"
webtalk_add_data -client project -key os_release -value "Ubuntu 16.04.5 LTS" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "Intel(R) Core(TM) i7-4720HQ CPU @ 2.60GHz" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "2601.000 MHz" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "8" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "6.226 GB" -context "user_environment"
webtalk_register_client -client sdk
webtalk_add_data -client sdk -key uid -value "1552640687000" -context "sdk\\\\hardware/1552640687000"
webtalk_add_data -client sdk -key isZynq -value "true" -context "sdk\\\\hardware/1552640687000"
webtalk_add_data -client sdk -key isZynqMP -value "false" -context "sdk\\\\hardware/1552640687000"
webtalk_add_data -client sdk -key Processors -value "6" -context "sdk\\\\hardware/1552640687000"
webtalk_add_data -client sdk -key VivadoVersion -value "2017.4" -context "sdk\\\\hardware/1552640687000"
webtalk_add_data -client sdk -key Arch -value "zynq" -context "sdk\\\\hardware/1552640687000"
webtalk_add_data -client sdk -key Device -value "7z020" -context "sdk\\\\hardware/1552640687000"
webtalk_add_data -client sdk -key IsHandoff -value "true" -context "sdk\\\\hardware/1552640687000"
webtalk_add_data -client sdk -key os -value "NA" -context "sdk\\\\hardware/1552640687000"
webtalk_add_data -client sdk -key apptemplate -value "NA" -context "sdk\\\\hardware/1552640687000"
webtalk_add_data -client sdk -key RecordType -value "HWCreation" -context "sdk\\\\hardware/1552640687000"
webtalk_add_data -client sdk -key uid -value "1552640711000" -context "sdk\\\\bsp/1552640711000"
webtalk_add_data -client sdk -key hwid -value "1552640687000" -context "sdk\\\\bsp/1552640711000"
webtalk_add_data -client sdk -key os -value "standalone" -context "sdk\\\\bsp/1552640711000"
webtalk_add_data -client sdk -key apptemplate -value "null" -context "sdk\\\\bsp/1552640711000"
webtalk_add_data -client sdk -key RecordType -value "BSPCreation" -context "sdk\\\\bsp/1552640711000"
webtalk_add_data -client sdk -key uid -value "NA" -context "sdk\\\\bsp/1552640908445"
webtalk_add_data -client sdk -key RecordType -value "ToolUsage" -context "sdk\\\\bsp/1552640908445"
webtalk_add_data -client sdk -key BootgenCount -value "0" -context "sdk\\\\bsp/1552640908445"
webtalk_add_data -client sdk -key DebugCount -value "0" -context "sdk\\\\bsp/1552640908445"
webtalk_add_data -client sdk -key PerfCount -value "0" -context "sdk\\\\bsp/1552640908445"
webtalk_add_data -client sdk -key FlashCount -value "0" -context "sdk\\\\bsp/1552640908445"
webtalk_add_data -client sdk -key CrossTriggCount -value "0" -context "sdk\\\\bsp/1552640908445"
webtalk_add_data -client sdk -key QemuDebugCount -value "0" -context "sdk\\\\bsp/1552640908445"
webtalk_transmit -clientid 1581670379 -regid "" -xml /home/junhonglin/Xilinx/PYNQ_Car/Robot/Robot.sdk/webtalk/usage_statistics_ext_sdk.xml -html /home/junhonglin/Xilinx/PYNQ_Car/Robot/Robot.sdk/webtalk/usage_statistics_ext_sdk.html -wdm /home/junhonglin/Xilinx/PYNQ_Car/Robot/Robot.sdk/webtalk/sdk_webtalk.wdm -intro "<H3>SDK Usage Report</H3><BR>"
webtalk_terminate
