require 'spec_helper'

describe Numeric, '#round_to' do
  context "when '2' is passed as an argument" do
    subject { 0.223123.round_to 2}

    it "correctly rounds to 2 decimal places" do
      should == 0.22000000000000003 # This is the unfortunate reality
    end
  end
end

describe Numeric, '#to_percentage' do
  subject { 0.223.to_percentage }

  it "multiplies by 100 and rounds to 2 when no decimal place specified" do
    should == 22.3
  end
end
