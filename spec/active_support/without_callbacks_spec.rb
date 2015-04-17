require 'active_support'
require 'active_support/callbacks'
require 'handsak/active_support/lunesta'

module Handsak::ActiveSupport

  class Dog
    include ActiveSupport::Callbacks
    include Handsak::ActiveSupport::ReadyMyLunestaForCallbacks

    define_callbacks :save

    set_callback :save, :after, :update_kennel

    def save
      run_callbacks(:save) { 'saving...' }
    end

    private
      def update_kennel
        'updating kennel...'
      end
  end

  describe LunestaForCallbacks, 'lunesta_my_callbacks!' do
    before(:each) do
      @dog = Dog.new
    end

    it "skips the callbacks specified" do
      expect(@dog).to_not receive(:update_kennel)
      @dog.lunesta_my_callbacks!
      @dog.save
    end
  end
end
