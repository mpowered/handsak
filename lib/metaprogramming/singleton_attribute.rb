module Metaprogramming
  module SingletonAttribute
    private
    # Creates a singleton attribute accessor.
    # eg:
    #   class Dog
    #     include Metaprogramming::SingletonAttribute
    #
    #     def method_missing(method, *args)
    #       if method =~ /a pattern that recognises aggregation like methods/
    #         cache_as_singleton_attribute(method, logic_that_converts_:method_to_some_value)
    #         return send(method) # using our new singleton attribute accessor
    #       else
    #         super
    #       end
    #     end
    #   end
    def cache_as_singleton_attribute(attr_name, value)
      # Cache the value in an instance variable
      instance_variable_set("@#{attr_name}", value)
      # Define a singleton method with the attr_name that
      # retrieves the instance variable
      self.instance_eval <<-EOS
        def #{attr_name}
          instance_variable_get('@#{attr_name}')
        end
      EOS
    end
  end
end
