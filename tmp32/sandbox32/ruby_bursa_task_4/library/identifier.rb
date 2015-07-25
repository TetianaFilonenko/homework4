module Library
  module Identifier
    
    def self.included(base)
      base.send :extend, ClassMethods
      base.send :prepend, Initializer
      base.send(:class_variable_set, :@@group_identifier, 0)
    end

    module ClassMethods
      def gid
        self.class_variable_get :@@group_identifier
      end
      alias group_identifier gid
    end

    module Initializer
      def initialize *args

        #Super must be before id updating
        super *args
        gid = self.class.send(:class_variable_get, :@@group_identifier)
        gid += 1
        self.class.send(:class_variable_set, :@@group_identifier, gid)
        @identifier = gid
      end
    end

    def gid
      self.class.class_variable_get :@@group_identifier
    end

    def id
      @identifier
    end

    def ==(other)
      if other.class == self.class
        other.id == self.id ? true : false
      else
        false
      end
    end

    alias eql? ==

    alias group_identifier gid
    alias identifier id
  end
end
