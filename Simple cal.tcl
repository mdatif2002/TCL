#!/usr/bin/tclsh
proc add {a b} {
    return [expr $a + $b]
}
proc subtract {a b} {
    return [expr $a - $b]
}
proc multiply {a b} {
    return [expr $a * $b]
}
proc divide {a b} {
    if {$b == 0} {
        error "Cannot divide by zero"
    }
    return [expr $a / $b]
}
while {1} {
    puts "Choose operation: (+) Addition, (-) Subtraction, (*) Multiplication, (/) Division, or (exit) to quit:"
    set operation [gets stdin]
    
    if {$operation eq "exit"} {
        break
    }
    puts "Enter the first number:"
    set num1 [gets stdin]
    
    puts "Enter the second number:"
    set num2 [gets stdin]
    catch {
        swi:tch $operation {
            "+" {
                set result [add $num1 $num2]
                puts "Result: $result"
            }
            "-" {
                set result [subtract $num1 $num2]
                puts "Result: $result"
            }
            "*" {
                set result [multiply $num1 $num2]
                puts "Result: $result"
            }
            "/" {
                set result [divide $num1 $num2]
                puts "Result: $result"
            }
            default {
                puts "Invalid operation."
            }
        }
    } error_msg
    if {[info exists error_msg]} {
        puts "Error: $error_msg"
    }
    else {
	puts "operation done."
    }
}
