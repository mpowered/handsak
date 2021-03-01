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
#### Lunesta for callbacks
Allows you to destroy callbacks on an instance, leaving other instances of the same class intact. It is very threadsafe.

    # Create an initializer with the following:
    require 'handsak/active_support/lunesta'
    ActiveRecord::Base.send :include, Handsak::ActiveSupport::ReadyMyLunestaForCallbacks

    # Usage
    d = Dog.find 1
    d2 = Dog.find 2

    d.lunesta_my_callbacks!
    d.save
    => No callbacks executed

    d2.save
    => callbacks as usual

You will have to dispense with the instance once you have Lunesta'd it, since we've hosed
it's callbacks via its Eigenclass.


### ActionView
Not included by default.
#### Build display
Require this lib to add a view helper that you can use to display build information.

    = build_footer


### Services
Not included by default.
#### Trading Name Normaliser
Normalises trading names to aid in 'fuzzy' matches

    TradingNameNormaliser.new('Rosenthal (PTY) l.t.d').normalised_name
    => rosenthal

### Mixins
Not included by default.
#### Password Valdition
Mixes into an AR user model and adds our password validation format.

    class User
      include Handsak::Mixins::PasswordValidation
    end


