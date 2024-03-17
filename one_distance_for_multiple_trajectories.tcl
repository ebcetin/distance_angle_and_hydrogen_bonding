## measures distance between two atoms for different trajectories

puts "how many trajectories: "
gets stdin nt


for {set j 0} {$j < $nt} {incr j} {
puts "Enter mutation name (lowercase): "
gets stdin a

#molecule input e.g dhf-a26t.psf
mol load psf dhf-$a.psf
animate read dcd dhf-$a-s100-210ns.dcd waitfor all
	
	set nf [molinfo $j get numframes]
	set outfile [open AAA_31_55_DHF_$a.dat w]

	
		#wrapping
		
		pbc wrap -centersel "protein" -center com -compound fragment -all
		
		#aligning of protein
		for {set l 1} {$l < $nf} {incr l} {
	
			set sel1 [atomselect $j all frame $l]
			set sel2 [atomselect $j all frame $l+1]
			set transformation_matrix [measure fit $sel1 $sel2]
			set move_sel [atomselect $j "all"]
			$move_sel move $transformation_matrix
	
		}
		
		# Phe31 CZ-DHF C11 Distance
		set a [atomselect $j "protein and resid 31 and name CB"]
		set b [atomselect $j "protein and resid 55 and name CB"]


		
		
		set n [$a get index]
		set m [$b get index]

		
		
		#distances measured and written
		for {set i 0} {$i<$nf} {incr i} {
		set dist [measure bond "$n $m" molid $j frame $i]
		puts $outfile $dist
		
		}		
		
		close $outfile
	
	
	mol delete $j
}