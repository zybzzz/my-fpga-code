# 
# Synthesis run script generated by Vivado
# 

set_param general.maxThreads 8
set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a35tftg256-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/myfpga/at7_ex03/at7.cache/wt [current_project]
set_property parent.project_path C:/myfpga/at7_ex03/at7.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib C:/myfpga/at7_ex03/at7.srcs/sources_1/new/at7.v
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/myfpga/at7_ex03/at7.srcs/constrs_1/new/at7.xdc
set_property used_in_implementation false [get_files C:/myfpga/at7_ex03/at7.srcs/constrs_1/new/at7.xdc]


synth_design -top at7 -part xc7a35tftg256-1


write_checkpoint -force -noxdef at7.dcp

catch { report_utilization -file at7_utilization_synth.rpt -pb at7_utilization_synth.pb }
