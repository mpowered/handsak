module Handsak
  module ActiveSupport
    module ReadyMyLunestaForCallbacks

      # Irreversibly puts an instance's (not the whole class's) callbacks to sleep. forever. When you're done
      # you'll have to dispose of your object. At least it threadsafe :D
      def lunesta_my_callbacks!
        self.extend(Handsak::ActiveSupport::LunestaForCallbacks)
      end
    end

    module LunestaForCallbacks
      define_method("run_callbacks") do |*args, &block|
        block.call
      end
    end

  end
end

