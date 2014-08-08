require 'spec_helper'

describe String do
  let(:valid_true)    { %w{ true 1 t y yes } }
  let(:invalid_true)  { %w{ Truue ys} }
  let(:valid_false)   { %w{ false 0 no n False } }
  let(:invalid_false) { %w{ Faalse nope } }

  it "should convert all valid true equivalent to boolean true" do
    valid_true.each do |true_case|
      expect(true_case.to_bool).to be_instance_of(TrueClass)
    end
  end

  it "should raise exception for all invalid true equivalent" do
    invalid_true.each do |invalid_case|
      expect { invalid_case.to_bool}.to raise_error
    end
  end

  it "should convert all valid false equivalent to boolean false" do
    valid_false.each do |false_case|
      expect(false_case.to_bool).to be_instance_of(FalseClass)
    end
  end

  it "should raise exception for all invalid false equivalent" do
    invalid_false.each do |invalid_case|
      expect { invalid_false.to_bool}.to raise_error
    end
  end

end
