set nf [molinfo top get numframes]
set outfile [open W30R_angle.dat w]

for {set i 0} {$i<$nf} {incr i} {

set hinge1_com [measure center [atomselect top "protein and resid 86 to 88" frame $i]]
set hinge2_com [measure center [atomselect top "protein and resid 105 to 107" frame $i]]

set hinges_midpoint [vecadd $hinge1_com $hinge2_com]
set hinges_midpoint [vecscale 0.5 $hinges_midpoint]

set absub_com [measure center [atomselect top "protein and resid 38 to 104" frame $i]]


set loopsub_com [measure center [atomselect top "protein and resid 2 to 37 or resid 104 to 159" frame $i]]


set vec1 [vecsub $absub_com $hinges_midpoint]
set vec2 [vecsub $loopsub_com $hinges_midpoint]

set angle [expr acos([expr [vecdot $vec1 $vec2] / ([veclength $vec1] * [veclength $vec2])])*180/$M_PI]


		
puts $outfile [format "%8d %8f" $i $angle]
}

close $outfile