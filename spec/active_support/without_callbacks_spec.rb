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
      @dog.should_not_receive :update_kennel
      Dog.without_callbacks([:save, :after, :update_kennel]) do
        @dog.save
      end
    end

    it "restores the callbacks once the block has executed" do
      Dog.without_callbacks([:save, :after, :update_kennel]) do
        @dog.save
      end
      @dog.should_receive :update_kennel
      @dog.save
    end
  end
end
