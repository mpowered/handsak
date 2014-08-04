require 'spec_helper'

describe Numeric do
  describe '#round_to' do
    context "when '2' is passed as an argument" do
      it "correctly rounds to 2 decimal places" do
        expect(0.223123.round_to 2).to eql(0.22)
      end
    end
  end

  describe '#to_percentage' do
    it "multiplies by 100 and rounds to 2 when no decimal place specified" do
      expect(0.223.to_percentage).to eql(22.3)
    end
  end
end
