# Distance Analysis (distance calculated for every frame)
# Input: trajectories 

################################################################
proc end2end {molid} {
    set pos $molid
    set sel [atomselect $pos all]
    set nf [molinfo $pos get numframes]
    set log [open end2end_pull.txt w]

    puts $log "Frame Distance"
    for {set i 0} {$i < $nf} {incr i 1} {
    animate goto $i
    display update ui
    $sel frame $i 
    $sel update
    mol ssrecalc $pos
    set distance [measure bond {4788 3202} $sel]
    puts $log "$i $distance"
    }

    flush $log
}


################################################################

