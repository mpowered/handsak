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
      [:save, :create, :update, :destroy, :touch].each do |type|
        define_method("_run_#{type}_callbacks") do
          # I do nothing, because I have eaten too many Lunesta cookies.
        end
      end
    end

  end
end

