#!/usr/bin/tclsh
proc matrixMultiply {matrix1 matrix2} {
    set result {{0 0} {0 0}}
    for {set i 0} {$i < 2} {incr i} {
        for {set j 0} {$j < 2} {incr j} {
            set sum 0
            for {set k 0} {$k < 2} {incr k} {
                set sum [expr $sum + [lindex $matrix1 $i $k] * [lindex $matrix2 $k $j]]
            }
            lset result $i $j $sum
        }
    }
    return $result
}
proc readMatrix {prompt} {
    puts $prompt
    set matrix {}
    for {set i 0} {$i < 2} {incr i} {
        gets stdin row
        set rowValues [split $row " "]
        lappend matrix $rowValues
    }
    return $matrix
}
set matrix1 [readMatrix "Enter values for the first matrix:"]
set matrix2 [readMatrix "Enter values for the second matrix:"]

set resultMatrix [matrixMultiply $matrix1 $matrix2]

puts "Resultant Matrix:"
foreach row $resultMatrix {
    puts [join $row "\t"]
}
