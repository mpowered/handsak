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
Metaprogramming helpers. Included by default.
#### cache_as_singleton_attribute
A helper that allows you to easily define singelton attribute accessors.

    police_dog = Dog.new
    dog = Dog.new

    police_dog.cache_as_singleton_attribute(:station_number, 12)
    police_dog.station_number
    >> 12

    dog.station_number
    >> NoMethodError


### ActiveSupport
Not included by default. 
#### without_callbacks
Allows you to temporarily skip callbacks.

    Dog.without_callbacks([:save, :after, :update_kennel]) do
      Dog.create(:name => 'Spike') # created without updating kennel
    end
