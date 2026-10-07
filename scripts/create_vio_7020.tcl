# Create the vio_7020 IP used by zynq7020_foc_top.v.
# Run from the Vivado Tcl Console while the target project is open.

set ip_name vio_7020

if {[llength [get_ips -quiet $ip_name]] != 0} {
    puts "INFO: IP $ip_name already exists; leaving it unchanged."
    return
}

create_ip -name vio -vendor xilinx.com -library ip -version 3.0 \
    -module_name $ip_name \
    -dir [get_property DIRECTORY [current_project]]

set_property -dict [list \
    CONFIG.C_NUM_PROBE_IN {5} \
    CONFIG.C_NUM_PROBE_OUT {20} \
    CONFIG.C_PROBE_IN0_WIDTH {16} \
    CONFIG.C_PROBE_IN1_WIDTH {16} \
    CONFIG.C_PROBE_IN2_WIDTH {16} \
    CONFIG.C_PROBE_IN3_WIDTH {1} \
    CONFIG.C_PROBE_IN4_WIDTH {1} \
    CONFIG.C_PROBE_OUT0_WIDTH {1} \
    CONFIG.C_PROBE_OUT1_WIDTH {16} \
    CONFIG.C_PROBE_OUT2_WIDTH {16} \
    CONFIG.C_PROBE_OUT3_WIDTH {32} \
    CONFIG.C_PROBE_OUT4_WIDTH {32} \
    CONFIG.C_PROBE_OUT5_WIDTH {32} \
    CONFIG.C_PROBE_OUT6_WIDTH {1} \
    CONFIG.C_PROBE_OUT7_WIDTH {16} \
    CONFIG.C_PROBE_OUT8_WIDTH {1} \
    CONFIG.C_PROBE_OUT9_WIDTH {16} \
    CONFIG.C_PROBE_OUT10_WIDTH {32} \
    CONFIG.C_PROBE_OUT11_WIDTH {32} \
    CONFIG.C_PROBE_OUT12_WIDTH {32} \
    CONFIG.C_PROBE_OUT13_WIDTH {1} \
    CONFIG.C_PROBE_OUT14_WIDTH {32} \
    CONFIG.C_PROBE_OUT15_WIDTH {32} \
    CONFIG.C_PROBE_OUT16_WIDTH {32} \
    CONFIG.C_PROBE_OUT17_WIDTH {1} \
    CONFIG.C_PROBE_OUT18_WIDTH {1} \
    CONFIG.C_PROBE_OUT19_WIDTH {1} \
] [get_ips $ip_name]

generate_target all [get_ips $ip_name]

puts "INFO: Created $ip_name with 5 inputs and 20 outputs."
puts "INFO: Add the generated IP to the current project sources, then run synthesis."
