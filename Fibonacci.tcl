#!/usr/bin/tclsh

puts "enter number of series"
set n [gets stdin]
set num1 0
puts "$num1"
set num2 1
puts "$num2"
if {n>2} {
	for { set i 0} {$i <($n-2)} {incr i} {
		set result [expr $num1 + $num2]
		puts "$result"
		set num1 "$num2"
		set num2 "$result"
}
}
