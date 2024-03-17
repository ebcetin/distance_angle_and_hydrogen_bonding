# find hydrogen bonds belonging to which frame
# find which bond is there between which frames

puts "Enter mutation name (lowercase): "
gets stdin a

#molecule input e.g dhf-a26t.psf
mol load psf dhf-$a.psf
animate read dcd dhf-$a-s100-210ns.dcd waitfor all

set nf [molinfo top get numframes]
set outfile [open dist_hunt_$a w]

#wrapping
		
pbc wrap -centersel "protein" -center com -compound fragment -all

#aligning of protein
for {set l 1} {$l < $nf} {incr l} {
	
	set sel1 [atomselect top all frame $l]
	set sel2 [atomselect top all frame $l+1]
	set transformation_matrix [measure fit $sel1 $sel2]
	set move_sel [atomselect 0 "all"]
	$move_sel move $transformation_matrix
	
}


#selection
set ca13   [atomselect top "protein and resid 13 and name CA" ]
set ca27  [atomselect top "protein and resid 27 and name CA"]
set ca100 [atomselect top "protein and resid 100 and name CA"]
set ca126 [atomselect top "protein and resid 158 and name CA" ]
set ca130 [atomselect top "protein and resid 130 and name CA"]
set ca140 [atomselect top "protein and resid 140 and name CA"]
set ca35  [atomselect top "protein and resid 35 and name CA"]
set ca70  [atomselect top "protein and resid 70 and name CA"]


#Indexes
set ica13     [ $ca13    get index ]
set ica27    [ $ca27   get index ]
set ica100   [ $ca100  get index ]
set ica126   [ $ca126  get index ]
set ica130   [$ca130 get index]
set ica140   [$ca140 get index]
set ica35    [$ca35 get index]
set ica70    [$ca70 get index]





for {set i 1 } {$i < $nf} {incr i} {

	# 13-27
	set dist1 [measure bond "$ica13 $ica27" molid 0 frame $i] 
	# 100 - 126
	set dist2 [measure bond "$ica100 $ica126" molid 0 frame $i]
	# 130 -140
	set dist3 [measure bond "$ica130 $ica140" molid 0 frame $i]
	# 35 -70
	set dist4 [measure bond "$ica35 $ica70" molid 0 frame $i]
	
	
	


	set a 0 
	set b 0 
	set c 0 
	set d 0 
	set e 0 
	set f 0
	
	
	
	if {($dist1 < 17.71 & $dist1 >17.41) } {
	set a 1 
	}
	if {($dist2 < 7.40 & $dist2 > 7.25) } {
	set b 1 
	}
	if {($dist3 < 19.75 & $dist3 > 20.60) } {
	set c 1 
	}
	if {($dist4 < 19.35 & $dist4 > 21.40) } {
	set d 1 
	}

 	
	
	
	
	
	
	set y "$a $b $c $d"
	puts $outfile "$y"
	
	set y 0
	
	 



}
	

	close $outfile