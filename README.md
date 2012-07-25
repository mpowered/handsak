## Handsak
A collection of small, oft used core extensions and utilities :)

## Contents
### Core Extensions
All included by default. Summary of each below.

#### to_yes_no
A method that returns 'yes' or 'no' on `TrueClass`, `FalseClass` & `NilClass`

    true.to_yes_no 
    >> 'yes'
    
    nil.to_yes_no 
    >> 'no'
    
    false.to_yes_no 
    >> 'no'

#### to_percentage
Multiplies a number by 100 and rounds to 2 decimal places

    0.35.to_percentage
    >> 35.00

#### round_to
Round a number to a specific decimal place

    0.2323.round_to(2)
    >> 0.23


### Metaprogramming
Currently contains a single helper that allows you to easily define singelton attribute accessors.
Included by default.

### ActiveSupport
Currently contains a single helper that allows you to temporarily skip callbacks.
Not included by default. 
