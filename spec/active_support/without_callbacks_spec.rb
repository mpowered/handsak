require 'active_support'
require 'active_support/callbacks'
require 'handsak/active_support/without_callbacks'

module Handsak::ActiveSupport

  class Dog
    include ActiveSupport::Callbacks
    include Handsak::ActiveSupport::WithoutCallbacks

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

  describe WithoutCallbacks, '.without_callbacks' do
    before(:each) do
      @dog = Dog.new
    end

    it "skips the callbacks specified" do
      expect(@dog).to_not receive(:update_kennel)
      Dog.without_callbacks([:save, :after, :update_kennel]) do
        @dog.save
      end
    end

    it "restores the callbacks once the block has executed" do
      Dog.without_callbacks([:save, :after, :update_kennel]) do
        @dog.save
      end
      expect(@dog).to receive(:update_kennel)
      @dog.save
    end

    it "parses all arguments to symbols before removing callbacks (ActiveSupport doesn't like strings in this space)" do
      expect do
        Dog.without_callbacks([:save, 'after', :update_kennel]) do
          @dog.save
        end
        @dog.save # String args will mean an error will be thrown here if they're not parsed.
      end.to_not raise_error
    end
  end
end
