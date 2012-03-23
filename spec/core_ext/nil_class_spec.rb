require 'spec_helper'

describe NilClass, '#to_yes_no' do
  subject { nil.to_yes_no }

  it { should == 'No'}
end
