# find hydrogen bonds belonging to which frame
# find which bond is there between which frames

puts "Enter mutation name (lowercase): "
gets stdin a

#molecule input e.g dhf-a26t.psf
mol load psf dhf-$a.psf
animate read dcd dhf-$a-s100-210ns.dcd waitfor all

set nf [molinfo top get numframes]
set outfile [open hb_life_$a w]
set outfile2 [open common_bonds_$a w]

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
	
# WT and A26T atom selection and indexing

#R158
set n158   [atomselect top "protein and resid 158 and name N" ]
set ne158  [atomselect top "protein and resid 158 and name NE"]
set nh1158 [atomselect top "protein and resid 158 and name NH1"]
set nh2158 [atomselect top "protein and resid 158 and name NH2" ]

#R158 Bonded Atoms
set o108   [atomselect top "protein and resid 108 and name O" ]

set cd129  [atomselect top "protein and resid 129 and name CD"]
set oe1129 [atomselect top "protein and resid 129 and name OE1"]
set oe2129 [atomselect top "protein and resid 129 and name OE2" ]

set od1132 [atomselect top "protein and resid 132 and name OD1"]
set od2132 [atomselect top "protein and resid 132 and name OD2"]

#R159
set n159   [atomselect top "protein and resid 159 and name N" ]
set ne159  [atomselect top "protein and resid 159 and name NE" ]
set nh1159 [atomselect top "protein and resid 159 and name NH1"]
set nh2159 [atomselect top "protein and resid 159 and name NH2" ]

#R159 Bonded Atoms
set o132   [atomselect top "protein and resid 132 and name O" ]

set cd134  [atomselect top "protein and resid 134 and name CD"]
set oe1134 [atomselect top "protein and resid 134 and name OE1" ]
set oe2134 [atomselect top "protein and resid 134 and name OE2"]

set oe1157 [atomselect top "protein and resid 157 and name OE1"]
set oe2157 [atomselect top "protein and resid 157 and name OE2" ]





#L28R - A26T addition

#set od1131 [atomselect top "protein and resid 131 and name OD1"]

#L28R

#set ne158 [atomselect top "protein and resid 158 and name NE"]
#set o107  [atomselect top "protein and resid 107 and name O"]

#L28R - A26T Index

#set iod1131 [$od1131 get index]

# L28R Index

#set ine158 [$ne158 get index]
#set io107   [$o107 get index]

# A26T & WT Index

#R158
set in158     [ $n158    get index ]
set ine158    [ $ne158   get index ]
set inh1158   [ $nh1158  get index ]
set inh2158   [ $nh2158  get index ]
						
#R158 Bonded Index       
set io108     [ $o108    get index ]
						
set icd129    [ $cd129   get index ]
set ioe1129   [ $oe1129  get index ]
set ioe2129   [ $oe2129  get index ]
					
set iod1132   [ $od1132  get index ]
set iod2132   [ $od2132  get index ]
						
#R159                   
set in159     [ $n159    get index ]
set ine159    [ $ne159   get index ]
set inh1159   [ $nh1159  get index ]
set inh2159   [ $nh2159  get index ]
						
#R159 Bond              
set io132     [ $o132    get index ]
						
set icd134    [ $cd134   get index ]
set ioe1134   [ $oe1134  get index ]
set ioe2134   [ $oe2134  get index ]
						
set ioe1157   [ $oe1157  get index ]
set ioe2157   [ $oe2157  get index ]






for {set i 1 } {$i < $nf} {incr i} {

	# R158 - Q108
	set dist1 [measure bond "$in158 $io108" molid 0 frame $i] 
	# R158 - D129
	set dist21 [measure bond "$inh2158 $icd129" molid 0 frame $i]
	set dist22 [measure bond "$inh1158 $ioe1129" molid 0 frame $i]
	set dist23 [measure bond "$inh2158 $ioe1129" molid 0 frame $i]
	set dist24 [measure bond "$inh1158 $ioe2129" molid 0 frame $i]
	set dist25 [measure bond "$inh2158 $ioe2129" molid 0 frame $i]
	# R158-D132
	set dist31 [measure bond "$ine158 $iod1132" molid 0 frame $i] 
	set dist32 [measure bond "$inh1158 $iod1132" molid 0 frame $i] 
	set dist33 [measure bond "$inh2158 $iod1132" molid 0 frame $i] 
	set dist34 [measure bond "$ine158 $iod2132" molid 0 frame $i] 
	set dist35 [measure bond "$inh1158 $iod2132" molid 0 frame $i] 
	set dist36 [measure bond "$inh2158 $iod2132" molid 0 frame $i] 
	# R159-D132
	set dist41 [measure bond "$in159 $io132" molid 0 frame $i]
	set dist42 [measure bond "$ine159 $iod1132" molid 0 frame $i]
	set dist43 [measure bond "$inh2159 $iod1132" molid 0 frame $i]
	set dist44 [measure bond "$ine159 $iod2132" molid 0 frame $i]
	# R159 - E134
	set dist51 [measure bond "$inh2159 $icd134" molid 0 frame $i]
	set dist52 [measure bond "$ine159 $ioe1134" molid 0 frame $i]
	set dist53 [measure bond "$inh1159 $ioe1134" molid 0 frame $i]
	set dist54 [measure bond "$inh2159 $ioe1134" molid 0 frame $i]
	set dist55 [measure bond "$ine159 $ioe2134" molid 0 frame $i]
	set dist56 [measure bond "$inh1159 $ioe2134" molid 0 frame $i]
	set dist57 [measure bond "$inh2159 $ioe2134" molid 0 frame $i]

	# R159-E157
	set dist61 [measure bond "$ine159 $ioe1157" molid 0 frame $i]
	set dist62 [measure bond "$inh1159 $ioe1157" molid 0 frame $i]
	set dist63 [measure bond "$inh2159 $ioe1157" molid 0 frame $i]
	set dist64 [measure bond "$ine159 $ioe2157" molid 0 frame $i]
	set dist65 [measure bond "$inh1159 $ioe2157" molid 0 frame $i]
	set dist66 [measure bond "$inh2159 $ioe2157" molid 0 frame $i]


	# R158 - A107
	#set dist7 [measure bond "$ine158 $io107" molid 0 frame $i]
	# R159 - D131
	#set dist8 [measure bond "$inh2159 $iod1131" molid 0 frame $i]
	set a 0 
	set b 0 
	set c 0 
	set d 0 
	set e 0 
	set f 0
	
	
	
	if {$dist1 < 3.0} {
	set a 1 
	} 
	
	if {$dist21 < 3.0 || $dist22<3.0 || $dist23<3.0 || $dist24 < 3.0 || $dist25 < 3.0 } {
	set b 1
	} 
	
	if {$dist31 < 3.0 || $dist32<3.0 || $dist33<3.0 || $dist34 < 3.0 || $dist35 < 3.0 || $dist36 < 3.0 } {
	set c 1
	} 
	
	if {$dist41 < 3.0 || $dist42<3.0 || $dist43<3.0 || $dist44 < 3.0 } {
	set d 1
	} 
	
	if {$dist51 < 3.0 || $dist52<3.0 || $dist53<3.0 || $dist54 < 3.0 || $dist55 < 3.0 || $dist56 < 3.0 || $dist57 < 3.0} {
	set e 1
	} 
	
	if {$dist61 < 3.0 || $dist62<3.0 || $dist63<3.0 || $dist64 < 3.0 || $dist65 < 3.0 || $dist66 < 3.0} {
	set f 1
	}
	
	set y "$a $b $c $d $e $f"
	puts $outfile "$y"
	
	set y 0
	
	 



}
	

	close $outfile
	close $outfile2