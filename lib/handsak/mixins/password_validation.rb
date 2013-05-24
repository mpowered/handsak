module Handsak
  module Mixins
    module PasswordValidation
      def self.included(klass)
        klass.class_eval do
          validates_format_of :password, :with => /^(?=.*[^a-zA-Z])(?=.*[a-z])(?=.*[A-Z])\S{8,}$/,
                                         :message => 'must be at least 8 characters long with at least one uppercase letter, one lowercase letter and one number.',
                                         :allow_nil => true # Autholgic will handle nil passwords 
        end
      end
    end
  end
end
