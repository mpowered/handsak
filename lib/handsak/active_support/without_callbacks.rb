module Handsak
  module ActiveSupport

    module WithoutCallbacks
      def self.included(klass)
        klass.class_eval do
          # A class method that allows you to skip a list of callbacks temporarily.
          # eg:
          #   class Dog < ActiveRecord::Base
          #     include Handsak::ActiveSupport::WithoutCallbacks 
          #
          #     before_save :update_tag
          #     after_save  :update_kennel
          #   end
          #
          #   Dog.without_callbacks([:save, :before, :update_tag], 
          #                         [:save, :after,  :update_kennel]) do
          #     Dog.create(:name => 'Spike') # No callbacks would've fired here
          #   end
          #
          # Provide the arguments as a set of arrays each containing 3 elements:
          # 1. callback
          # 2. position around callback
          # 3. method to be skipped
          #
          def self.without_callbacks(*callbacks)
            # convert all args to symbols. AS won't restore the callbacks properly
            # if strings are used.
            callbacks.collect!{|callback_array| callback_array.collect!(&:to_sym)}

            callbacks.each do |callback|
              skip_callback *callback
            end

            yield

            callbacks.each do |callback|
              set_callback *callback
            end
          end
        end
      end
    end

  end
end
