#!/usr/bin/tclsh
set wfp [open "extract.log" w]
set rfp [open "innovus.log" r]
set fileData [read $rfp]
puts $wfp "Error present: "
foreach line [split $fileData "\n"] {
	set string1 $line
	regexp {\*\*ERROR: \(([^)]+)\)} $string1 err str
	if {[info exists err]} {
		puts $wfp "$str"
	}
}	
puts $wfp "Warning present:"
foreach line [split $fileData "\n"] {
	set string1 $line
	regexp {\*\*WARN: \(([^)]+)\)} $string1 err str
	if {[info exists err]} {
		puts $wfp "$str"
	}
}
puts $wfp "PATHS :"
foreach line [split $fileData "\n"] {
	set string1 $line
	regexp {\(File (/[^\,]+)\)} $string1 err str
	if {[info exists err]} {
		puts $wfp "$str"
	}
}
close $rfp
close $wfp

