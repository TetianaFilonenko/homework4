module Library
  module Identifier
  	#@@group_identifier = 0

  	def self.included(base)
      base.send :extend, ClassMethods
      base.send :prepend, Initializer
      base.send :class_variable_set, :@@group_identifier, 0
    end

    module ClassMethods
      def group_identifier
        self.class_variable_get(:@@group_identifier)
      end

      def inc_identifier_or_init
        self.class_variable_set(:@@group_identifier, self.class_variable_get(:@@group_identifier) + 1)
      end
    end

    # Module for initialization
    module Initializer
      def initialize(*args)
        super(*args)
        @identifier = self.class.inc_identifier_or_init
      end
    end

    def identifier
      @identifier
    end

    def eql?(other)
    	self.class == other.class && self.identifier == other.identifier
    end

    def ==(other)
      self.class == other.class && self.identifier == other.identifier
    end

  end
end