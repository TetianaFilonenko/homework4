module Library

  module Identifier
    
    def self.included base
      base.send :extend, ClassMethods
      base.send :prepend, Initializer
      base.send :class_variable_set, :@@group_identifier, 0
    end

    module ClassMethods
      def group_identifier
        self.class_variable_get :@@group_identifier
      end
      alias gid group_identifier
    end

    module Initializer
      def initialize *args
        super *args
        gid = self.class.send(:class_variable_get, :@@group_identifier) + 1
        self.class.send :class_variable_set, :@@group_identifier, gid
        @identifier = gid
      end
    end

    def gid
      self.class.class_variable_get :@@group_identifier
    end

    def id
      @identifier
    end

    def == other
      other.class == self.class ? (other.id == self.id) : false
    end

    alias eql? ==

    alias group_identifier gid
    
    alias identifier id

  end

end