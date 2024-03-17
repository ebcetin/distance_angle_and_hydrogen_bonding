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
	
# WT 

#35

set og135   [atomselect top "protein and resid 35 and name OG1"]
set o35 	[atomselect top "protein and resid 35 and name O"]

#37 

set n37     [atomselect top "protein and resid 37 and name N"]

#40

set o40 	[atomselect top "protein and resid 40 and name O"]

#47
set ne147 	[atomselect top "protein and resid 47 and name NE1"]


#L54

set n54 	[atomselect top "protein and resid 54 and name N"]
set o54 	[atomselect top "protein and resid 54 and name O"]

#P55

set o55 	[atomselect top "protein and resid 55 and name O"]

#56

set o56 	[atomselect top "protein and resid 56 and name O"]

#R57

set n57 	[atomselect top "protein and resid 57 and name N"]
set ne57 	[atomselect top "protein and resid 57 and name NE"]
set nh257   [atomselect top "protein and resid 57 and name NH2"]
set o57 	[atomselect top "protein and resid 57 and name O"]
set nh157   [atomselect top "protein and resid 57 and name NH1"]

#K58

set nz58 	[atomselect top "protein and resid 58 and name NZ"]

#N59

set n59 	[atomselect top "protein and resid 59 and name N"]
set o59 	[atomselect top "protein and resid 59 and name O"]
set nd259 	[atomselect top "protein and resid 59 and name ND2"]
set od159	[atomselect top "protein and resid 59 and name OD1"]

#60

set n60 	[atomselect top "protein and resid 60 and name N"]

#I61

set n61 	[atomselect top "protein and resid 61 and name N"]




#S63

set og63	[atomselect top "protein and resid 63 and name OG"]



#Q65

set ne265 	[atomselect top "protein and resid 65 and name NE2"]


#P66

set o66 	[atomselect top "protein and resid 66 and name O"]

#G67

set n67 	[atomselect top "protein and resid 67 and name N"]
set o67 	[atomselect top "protein and resid 67 and name O"]

#T68

set og168 	[atomselect top "protein and resid 68 and name OG1"]
set n68 	[atomselect top "protein and resid 68 and name N"]

#D69
set od169  [atomselect top "protein and resid 69 and name OD1" ]
set od269  [atomselect top "protein and resid 69 and name OD2"]
set n69    [atomselect top "protein and resid 69 and name N"]
set o69 	[atomselect top "protein and resid 69 and name O"]

#D70

set od170  [atomselect top "protein and resid 70 and name OD1" ]
set od270  [atomselect top "protein and resid 70 and name OD2"]
set n70    [atomselect top "protein and resid 70 and name N"]
set o70 	[atomselect top "protein and resid 70 and name O"]

#R71
set ne71   [atomselect top "protein and resid 71 and name NE" ]
set nh171  [atomselect top "protein and resid 71 and name NH1"]
set nh271  [atomselect top "protein and resid 71 and name NH2"]
set n71    [atomselect top "protein and resid 71 and name N"]
set o71 	[atomselect top "protein and resid 71 and name O"]

#V72 

set n72 	[atomselect top "protein and resid 72 and name N"]
set o72 	[atomselect top "protein and resid 72 and name O"]

#T73

set n73		[atomselect top "protein and resid 73 and name N"]
set o73 	[atomselect top "protein and resid 73 and name O"]
set og173 	[atomselect top "protein and resid 73 and name OG1"]

#W74

set ce374	[atomselect top "protein and resid 74 and name CE3"]
set ne174 	[atomselect top "protein and resid 74 and name NE1"]
set o74 	[atomselect top "protein and resid 74 and name O"]
set n74 	[atomselect top "protein and resid 74 and name N"]

#Index

#35

set iog135 [$og135 get index]
set io35 [$o35 get index]

#37

set in37 [$n37 get index]

#40

set io40 [$o40 get index]

#47
set ine147 [$ne147 get index]	


#L54

set in54   [$n54 get index]
set io54   [$o54 get index]

#P55

set io55   [$o55 get index]

#56

set io56   [$o56 get index]

#R57

set in57   [$n57 get index]	
set ine57  [$ne57 get index]
set inh257 [$nh257 get index]
set io57   [$o57 get index]	
set inh157 [$nh157 get index] 

#K58

set inz58 	[$nz58 get index]

#N59

set in59 	[$n59 get index]
set io59 	[$o59 get index]
set ind259 	[$nd259 get index]
set iod159  [$od159 get index]

#60

set in60 	[$n60 get index]

#I61

set in61 	[$n61 get index]

#S63

set iog63	[$og63 get index]

#Q65

set ine265 	[$ne265 get index]


#P66

set io66 	[$o66 get index]

#G67

set in67 	[$n67 get index]
set io67 	[$o67 get index]

#T68

set iog168 	[$og168 get index]
set in68 	[$n68 get index]

#D69
set iod169  [$od169 get index]
set iod269  [$od269 get index]
set in69    [$n69 get index]
set io69 	[$o69 get index]

#D70

set iod170  [$od170 get index]
set iod270  [$od270 get index]
set in70    [$n70 get index]
set io70 	[$o70 get index]

#R71
set ine71   [$ne71 get index]
set inh171  [$nh171 get index]
set inh271  [$nh271 get index]
set in71    [$n71 get index]
set io71 	[$o71 get index]

#V72 

set in72 	[$n72 get index]
set io72 	[$o72 get index]

#T73

set in73	[$n73 get index]	
set io73 	[$o73 get index]
set iog173 	[$og173 get index]

#W74

set ice374	[$ce374 get index]
set ine174 	[$ne174 get index]
set io74 	[$o74 get index]
set in74 	[$n74 get index]


for {set i 0 } {$i < $nf} {incr i} {


    set dist1 [measure bond "$io54 $ind259" molid 0 frame $i]
	set dist2 [measure bond "$in54 $iod159" molid 0 frame $i]
	
    set dist3 [measure bond "$io55 $in57" molid 0 frame $i]
    set dist4 [measure bond "$io55 $ine57" molid 0 frame $i]
	set dist5 [measure bond "$io55 $inh257" molid 0 frame $i]
	
    set dist6 [measure bond "$io56 $inh171" molid 0 frame $i]
	
    set dist7 [measure bond "$io56 $in37" molid 0 frame $i]
	
    set dist8 [measure bond "$io57 $inh171" molid 0 frame $i]
	
    set dist9 [measure bond "$inh157 $iog135" molid 0 frame $i]
    set dist10 [measure bond "$inh157 $io35" molid 0 frame $i]
	
    set dist11 [measure bond "$ind259 $io71" molid 0 frame $i]
	set dist12 [measure bond "$in59 $io71" molid 0 frame $i]
	
    set dist13 [measure bond "$io59 $in73" molid 0 frame $i]
	
    set dist14 [measure bond "$in60 $io40" molid 0 frame $i]
	
    set dist15 [measure bond "$io66 $ine265" molid 0 frame $i]
	
    set dist16 [measure bond "$io67 $iog168" molid 0 frame $i]
	
    set dist17 [measure bond "$iog168 $iog173" molid 0 frame $i]
    
	set dist18 [measure bond "$in68 $ine174" molid 0 frame $i]
	set dist19 [measure bond "$iog168 $in74" molid 0 frame $i]
	
    set dist20 [measure bond "$iog168 $ine147" molid 0 frame $i]
	
    set dist21 [measure bond "$iod269 $in70" molid 0 frame $i]
    set dist22 [measure bond "$iod169 $in70" molid 0 frame $i]
	
    set dist23 [measure bond "$iod269 $in71" molid 0 frame $i]
    set dist24 [measure bond "$iod169 $inh271" molid 0 frame $i]
    set dist25 [measure bond "$iod269 $ine71" molid 0 frame $i]
	set dist26 [measure bond "$iod169 $in71" molid 0 frame $i]
	set dist27 [measure bond "$iod269 $inh271" molid 0 frame $i]
	set dist28 [measure bond "$iod169 $ine71" molid 0 frame $i]
	
    set dist29 [measure bond "$in69 $io72" molid 0 frame $i]
    set dist30 [measure bond "$iod169 $in72" molid 0 frame $i]
	set dist31 [measure bond "$iod269 $in72" molid 0 frame $i]
    
	set dist32 [measure bond "$in69 $iog173" molid 0 frame $i]
	set dist33 [measure bond "$io69 $iog173" molid 0 frame $i]
	
    set dist34 [measure bond "$iod269 $ine174" molid 0 frame $i]
    set dist35 [measure bond "$io69 $ine174" molid 0 frame $i]
	
    set dist36 [measure bond "$iod270 $ine71" molid 0 frame $i]
    set dist37 [measure bond "$iod170 $inh271" molid 0 frame $i]
    set dist38 [measure bond "$iod270 $inh271" molid 0 frame $i]
    set dist39 [measure bond "$iod170 $ine71" molid 0 frame $i]
	
    set dist40 [measure bond "$io70 $inz58" molid 0 frame $i]
	
    set dist41 [measure bond "$io71 $inz58" molid 0 frame $i]
	
    set dist42 [measure bond "$inh171 $io56" molid 0 frame $i]
	
    set dist43 [measure bond "$io72 $iog173" molid 0 frame $i]
	
	set dist44 [measure bond "$iog173 $inz58" molid 0 frame $i]
	
	set dist45 [measure bond "$io73 $in61" molid 0 frame $i]
	
	set dist46 [measure bond "$ine174 $ine147" molid 0 frame $i]
	
	set dist47 [measure bond "$ice374 $iog63" molid 0 frame $i]




	
	

	set a 0 
	set b 0
	set c 0
	set d 0
	set e 0
	set f 0
	set g 0
	set h 0
	set j 0
	set k 0
	set l 0
	set m 0
	set n 0
	set o 0
	set p 0
	set r 0
	set s 0
	set t 0
	set u 0
	set v 0
	set w 0
	set z 0
	set aa 0
	set bb 0
	set cc 0
	set dd 0
	set ee 0
	set ff 0
	
	if {$dist1 < 3.0 || $dist2<3.0 } {
	set a 1
	} 
	if {$dist3 < 3.0 || $dist4 < 3.0 || $dist5 < 3.0 } {
	set b 1
	}
    if {$dist6 <3.0 } {
	set c 1
	}
	if {$dist7 <3.0 } {
	set d 1
	}
	if {$dist8 < 3.0} {
	set e 1
	}
	if {$dist9 < 3.0 || $dist10 < 3.0} {
	set f 1
	}
	if {$dist11 < 3.0 || $dist12 < 3.0} {
	set g 1
	}
	if {$dist13 < 3.0} {
	set h 1
	} 
	if {$dist14 < 3.0} {
	set j 1
	}
	if {$dist15 < 3.0} {
	set k 1
	}
	if {$dist16 < 3.0} {
	set l 1
	}
	if {$dist17 < 3.0} {
	set m 1
	}
	if {$dist18 < 3.0 || $dist19 < 3.0 } {
	set n 1
	}
	if {$dist20 < 3.0} {
	set o 1
	}
	if {$dist21 < 3.0 || $dist22 < 3.0} {
	set p 1
	}
	if {$dist23 < 3.0 || $dist24 < 3.0 || $dist25 < 3.0 || $dist26 < 3.0 || $dist27 < 3.0 || $dist28 < 3.0} {
	set r 1
	}
	if {$dist29 < 3.0 || $dist30 < 3.0 || $dist31 < 3.0} {
	set s 1
	}
	if {$dist32 < 3.0 || $dist33 < 3.0} {
	set t 1
	}
	if {$dist34 < 3.0 || $dist35 < 3.0} {
	set u 1
	}
	if {$dist36 < 3.0 || $dist37 < 3.0 || $dist38 < 3.0 || $dist39 < 3.0} {
	set v 1
	}
	if {$dist40 < 3.0} {
	set w 1
	}
	if {$dist41 < 3.0} {
	set z 1
	}
	if {$dist42 < 3.0} {
	set aa 1
	}
	if {$dist43 < 3.0} {
	set bb 1
	}
	if {$dist44 < 3.0 } {
	set cc 1
	}
	if {$dist45 < 3.0 } {
	set dd 1
	}
	if {$dist46 < 3.0 } {
	set ee 1
	}
	if {$dist47 < 3.0 } {
	set ff 1
	}
	
	
	
	
	
	set y "$a $b $c $d $e $f $g $h $j $k $l $m $n $o $p $r $s $t $u $v $w $z $aa $bb $cc $dd $ee $ff"
	puts $outfile "$y"
	
	set y 0
	
	 



}
	close $outfile
	close $outfile2