require 'spec_helper'
require 'handsak/services/trading_name_normaliser'

describe TradingNameNormaliser do
  describe "#original" do
    it 'returns the original trading name' do
      name = "Jimmy's Motor Works (Pty) Ltd"
      normaliser = TradingNameNormaliser.new(name)
      normaliser.original.should eql(name)
    end
  end

  describe "#name" do
    context "when given nil as input" do
      it 'returns nil' do
        normaliser = TradingNameNormaliser.new(nil)
        normaliser.normalised_name.should be_nil
      end
    end

    it 'downcases the name' do
      name = "HelloMOTO"
      normaliser = TradingNameNormaliser.new(name)
      normaliser.normalised_name.should eql("hellomoto")
    end

    it "renames '&' to 'and'" do
      name = "hello&moto"
      normaliser = TradingNameNormaliser.new(name)
      normaliser.normalised_name.should eql("helloandmoto")
    end

    it 'removes non-alphanumeric characters' do
      name = "h#35%llo m*to (stuff)!"
      normaliser = TradingNameNormaliser.new(name)
      normaliser.normalised_name.should eql("h35llomtostuff")
    end

    ['Pty Ltd', 'Proprietary', 'Limited', 'C.C.' '(Pty) Ltd', 'Pty.', 'Ltd.'].each do |suffix|
      it "strips #{suffix} suffix" do
        name = "hellomoto #{suffix}"
        normaliser = TradingNameNormaliser.new(name)
        normaliser.normalised_name.should eql("hellomoto")
      end

      it "doesn't strip #{suffix} prefix" do
        name = "#{suffix} hellomoto"
        normaliser = TradingNameNormaliser.new(name)
        normaliser.normalised_name.should eql("#{suffix.downcase.gsub(/\W/, '')}hellomoto")
      end
    end
  end
end
