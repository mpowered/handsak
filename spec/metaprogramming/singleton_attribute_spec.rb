require 'spec_helper'
module Metaprogramming

  describe SingletonAttribute, '#cache_as_singleton_attribute' do
    subject do
      class Dog
        include Metaprogramming::SingletonAttribute

        def initialize(attr = {})
          attr.each do |key, var|
            cache_as_singleton_attribute(key, var)
          end
        end
      end

      Dog.new(:age => 3)
    end

    it "saves the value in an instance variable with the name specified" do
      subject.instance_variable_get(:@age).should == 3
    end

    it "defines a singleton method to access the instance variable with the name specified" do
      subject.methods.map(&:to_sym).should include(:age)
      subject.age.should == 3
      Dog.new(:legs => 2).methods.map(&:to_sym).should_not include(:age)
    end
  end

end
