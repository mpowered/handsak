require 'spec_helper'

describe TrueClass, '#to_yes_no' do
  subject { true.to_yes_no }

  it { should == 'Yes'}
end
