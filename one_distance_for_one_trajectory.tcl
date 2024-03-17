proc a2adist {A B} {
set nf [molinfo top get numframes]
set outfile [open adist.txt w]
puts $outfile "Frame# A2A_Distance"
for {set i 0} {$i < $nf } { incr i } {
set posA [$A get {x y z}]
set posB [$B get {x y z}]
set dist [veclength [vecsub $posA $posB]]
puts $outfile "$i $dist"
}
close $outfile
}