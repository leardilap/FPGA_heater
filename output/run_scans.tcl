cd C:/Users/KIT/Documents/bitfiles/Bitfile_Example_Design

# create scans
set i 0
foreach link [lindex [get_hw_sio_links]] {
set desc_name Scan_$i
set xil_newScan [create_hw_sio_scan -description $desc_name 2d_full_eye  [lindex [get_hw_sio_links] $i ]]
set_property HORIZONTAL_INCREMENT {2} [get_hw_sio_scans $xil_newScan]
set_property VERTICAL_INCREMENT {2} [get_hw_sio_scans $xil_newScan]
set_property DWELL_BER 1e-7 [get_hw_sio_scans $xil_newScan]
incr i
}
after 3000
# run scans
set i 0
foreach scan [lindex [get_hw_sio_scans]] {
run_hw_sio_scan [lindex [get_hw_sio_scans] $i]
wait_on_hw_sio_scan [lindex [get_hw_sio_scans] $i]
display_hw_sio_scan [lindex [get_hw_sio_scans] $i]
after 2000
incr i
}

