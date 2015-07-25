module Library
  module Identifier    
 
    def self.included(base)
      base.send :extend, ClassMethods
      base.send :prepend, Initializer
      base.send :class_variable_set, :@@group_identifier, 0
    end
    
    module ClassMethods

      def group_identifier
        self.class_variable_get :@@group_identifier
      end
    end
  
    module Initializer

      @@total_identifier = 0
      
      def initialize *args        
        @@total_identifier += 1

        @identifier = @@total_identifier
        self.class.class_variable_set(:@@group_identifier, (self.class.class_variable_get(:@@group_identifier) + 1))
        super *args
      end
    end

    def eql? param
      self.identifier == param.identifier          	
    end
    
    alias == eql?

    def identifier
      @identifier
    end
  end
end
