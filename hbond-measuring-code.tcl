   set sel  [atomselect top "protein and resid 10 13"]
   set sel2 [atomselect top "protein"]
   set outfile [open dhf-d27e-hbonds.txt w] 

   for {set trajFrame 0} {$trajFrame <= 1050} {incr  trajFrame} {
    $sel frame $trajFrame
    $sel2 frame $trajFrame
	
    set a [measure hbonds 3.0 20.0  $sel $sel2 ] 
	for {set i 0} {$i <= 2} {incr i} {
	
		set c [lindex $a $i]
		puts $outfile $c 
	}
	#puts $outfile ""
}

close $outfile
   
   set sel  [atomselect top "protein and resid 10 13"]
   set sel2 [atomselect top "protein"]
   set outfile [open dhfp-d27e-hbonds.txt w] 

   for {set trajFrame 0} {$trajFrame <= 1050} {incr  trajFrame} {
    $sel frame $trajFrame
    $sel2 frame $trajFrame
	
    set a [measure hbonds 3.0 20.0  $sel2 $sel ] 
	for {set i 0} {$i <= 2} {incr i} {
	
		set c [lindex $a $i]
		puts $outfile $c 
	}
	#puts $outfile ""
}

close $outfile