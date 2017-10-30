proc avg_filter {mol_id} {
    for {set i 0} {$i < 15} {incr i 1} {  
        puts "$i" 
        for {set j 3} {$j <= 59} {incr j 1} {
            set a [atomselect $mol_id "residue [expr $i*60 + $j] and name CA"]
            set b [atomselect $mol_id "residue [expr $i*60 + $j-1] and name CA"]
            set c [atomselect $mol_id "residue [expr $i*60 + $j-2] and name CA"]
            set d [atomselect $mol_id "residue [expr $i*60 + $j-3] and name CA"]
        # for {set j 3} {$j <= 71} {incr j 1} {}
        #     set a [atomselect $mol_id "residue [expr $i*72 + $j] and name CA"]
        #     set b [atomselect $mol_id "residue [expr $i*72 + $j-1] and name CA"]
        #     set c [atomselect $mol_id "residue [expr $i*72 + $j-2] and name CA"]
        #     set d [atomselect $mol_id "residue [expr $i*72 + $j-3] and name CA"]

            set n [$a get x]
            set o [$b get x]
            set p [$c get x]
            set q [$d get x]

            set r [$a get y]
            set s [$b get y]
            set t [$c get y]
            set u [$d get y]

            # $a set x [expr $n/4 +$o/4 +$p/4 +$q/4]
            # $a set y [expr $r/4 + $s/4 + $t/4 + $u/4]
            $a set x [expr $n/3 + $o/3 + $p/3]
            $a set y [expr $r/3 + $s/3 + $t/3]
        }
    }
}