# Allign axis with molecule's principle axes
# This requires the packages orient and la1.0

proc allign {molid} {

  package require Orient
  namespace import Orient::orient

  set sel [atomselect $molid protein]
  set I [draw principalaxes $sel]
  set A [orient $sel [lindex $I 2] {0 0 1}]
  $sel move $A
  set I [draw principalaxes $sel]
  set A [orient $sel [lindex $I 1] {0 1 0}]
  $sel move $A
  #set I [draw principalaxes $sel]
  mol reanalyze $molid
  puts "Changed"
  unset sel
  unset I
  unset A
}
