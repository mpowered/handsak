module Handsak
  module Mixins
    module PasswordValidation
      def self.included(klass)
        klass.class_eval do
          validates_format_of :password, :with => /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).{9,15}$/,
                                         :message => 'must contain at least one uppercase and one lowercase letter as well as at least one numerical character.',
                                         :allow_nil => true # Autholgic will handle nil passwords 
        end
      end
    end
  end
end