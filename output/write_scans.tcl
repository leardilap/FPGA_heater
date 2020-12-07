set folder_name serenity-a2577_16G_28G
# writing scans
set i 0
foreach scan [lindex [get_hw_sio_scans]] {
write_hw_sio_scan -force "./$folder_name/Scan_$i.csv" [lindex [get_hw_sio_scans] $i]
after 2000
incr i
}

