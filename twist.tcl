proc twist {molid str_1 str_2 str_3} {
    
    # source allign.tcl
    # allign $molid
    set centroid_x 0
    set centroid_y 0
    set centroid_x_f 0
    set centroid_y_f 0
    set input 0
    set first 0
    set second ""

    set log [open twist.txt w]

    for {set i 0} {$i < 60} {incr i 1} {
    # for {set i 0} {$i < 72} {incr i 1} {}
        set x_1 0
        set x_2 0
        set x_3 0
        set y_1 0
        set y_2 0 
        set y_3 0
        set input ""
        for {set j 0} {$j < 3} {incr j 1} {
            set st 0
            if {$j == 0} {
                set st $str_1
            } elseif {$j == 1} {
                set st $str_2
            } else {
                set st $str_3
            }
            if {$st == 0 || $st == 3 || $st == 4 || $st == 5 || $st == 8 || $st == 9 || $st == 10 || $st == 13 || $st == 14 } {
                set first [expr 60 * $st]
                # set first [expr 72 * $st]
                set input "protein and residue [expr $first + $i] and name CA"
            } else {
                set first [expr 60 * $st + 59]
                # set first [expr 72 * $st + 71]
                set input "protein and residue [expr $first - $i] and name CA"
            }
            set sel [atomselect $molid $input]
            
            if {$j == 0} {
                set x_1 [$sel get x]
                set y_1 [$sel get y]
            } elseif {$j == 1} {
                set x_2 [$sel get x]
                set y_2 [$sel get y]
            } else {
                set x_3 [$sel get x]
                set y_3 [$sel get y]
            }
        }
        puts $log "$i $x_1 $y_1 $x_2 $y_2 $x_3 $y_3"
    }
    #
    #puts $log "[expr $a/5] $centroid_x $centroid_y $centroid_x_f $centroid_y_f"
    flush $log
}