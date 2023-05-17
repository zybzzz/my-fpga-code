set_property IOSTANDARD LVTTL [get_ports sys_clk_i]
set_property PACKAGE_PIN N11 [get_ports sys_clk_i]

set_property IOSTANDARD LVTTL [get_ports ext_rst_n]
set_property PACKAGE_PIN T2 [get_ports ext_rst_n]

set_property IOSTANDARD LVTTL [get_ports {key_h[0]}]
set_property PACKAGE_PIN T10 [get_ports {key_h[0]}]
set_property IOSTANDARD LVTTL [get_ports {key_h[1]}]
set_property PACKAGE_PIN R10 [get_ports {key_h[1]}]
set_property IOSTANDARD LVTTL [get_ports {key_h[2]}]
set_property PACKAGE_PIN T9 [get_ports {key_h[2]}]
set_property IOSTANDARD LVTTL [get_ports {key_h[3]}]
set_property PACKAGE_PIN T8 [get_ports {key_h[3]}]

set_property IOSTANDARD LVTTL [get_ports {led[0]}]
set_property PACKAGE_PIN M1 [get_ports {led[0]}]
set_property IOSTANDARD LVTTL [get_ports {led[1]}]
set_property PACKAGE_PIN N1 [get_ports {led[1]}]
set_property IOSTANDARD LVTTL [get_ports {led[2]}]
set_property PACKAGE_PIN P1 [get_ports {led[2]}]
set_property IOSTANDARD LVTTL [get_ports {led[3]}]
set_property PACKAGE_PIN R2 [get_ports {led[3]}]
set_property IOSTANDARD LVTTL [get_ports {led[4]}]
set_property PACKAGE_PIN T3 [get_ports {led[4]}]
set_property IOSTANDARD LVTTL [get_ports {led[5]}]
set_property PACKAGE_PIN R5 [get_ports {led[5]}]
set_property IOSTANDARD LVTTL [get_ports {led[6]}]
set_property PACKAGE_PIN R6 [get_ports {led[6]}]
set_property IOSTANDARD LVTTL [get_ports {led[7]}]
set_property PACKAGE_PIN T7 [get_ports {led[7]}]

set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property BITSTREAM.CONFIG.SPI_FALL_EDGE YES [current_design]
