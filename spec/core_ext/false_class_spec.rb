require 'spec_helper'

describe FalseClass, '#to_yes_no' do
  subject { false.to_yes_no }

  it { should == 'No'}
end
