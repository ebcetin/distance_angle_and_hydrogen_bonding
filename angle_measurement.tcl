set outfile [open angle_corr_wt.dat w]
for {set j 0} {$j < 1051} {incr j} {
	
	set n  [atomselect top "protein and resid 71 and name N" frame $j]
	set ca [atomselect top "protein and resid 71 and name CA" frame $j]
	set cb [atomselect top "protein and resid 71 and name CB" frame $j]
	
	set n10 [atomselect top "resname DHF and name N10" frame $j]
	set c9 [atomselect top "resname DHF and name C9" frame $j]
	set c6 [atomselect top "resname DHF and name C6" frame $j]
	

	set coord_n [$n get {x y z}]
	#puts $coord_n
	set coord_ca [$ca get {x y z}]
	set coord_cb [$cb get {x y z}]
	
	set coord_n10 [$n10 get {x y z}]
	set coord_c9 [$c9 get {x y z}]
	set coord_c6 [$c6 get {x y z}]

	

	
	set angle_arg [vecdot [vecsub [lindex $coord_n 0] [lindex $coord_ca 0]] [vecsub [lindex $coord_cb 0] [lindex $coord_ca 0]]]
	set angle_dhf [vecdot [vecsub [lindex $coord_n10 0] [lindex $coord_c9 0]] [vecsub [lindex $coord_c6 0] [lindex $coord_c9 0]]]
	puts $outfile "$angle_arg $angle_dhf"
	
	
	
}
close $outfile
