# Distance Analysis (distance calculated for every frame)
# Input: trajectories 

################################################################
proc perc {molid} {
    set pos $molid
    set sel [[atomselect $pos "protein and name CA"] num]
    set PROselcoil [[atomselect $pos "resname PRO and coil and name CA"] num]
    set PROselsheet [[atomselect $pos "resname PRO and sheet and name CA"] num]
    set PROselturn [[atomselect $pos "resname PRO and turn and name CA"] num]
    set PROselhelix [[atomselect $pos "resname PRO and helix and name CA"] num]
    
    set log [open MaSp2_PRO_stats.txt w]

    puts $log "Coil   sheet   turn   helix"
    
    puts $log "[expr $PROselcoil/$sel] [expr $PROselsheet/$sel] [expr $PROselturn/$sel] [expr $PROselhelix/$sel]"
    flush $log
}


################################################################