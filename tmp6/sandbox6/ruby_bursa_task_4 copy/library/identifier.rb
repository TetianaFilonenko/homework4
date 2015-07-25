module Library
  module Identifier

    def self.included(base)
      base.send :extend, ClassMethods
      base.send :class_variable_set, :@@group_identifier, 0
      base.send :prepend, Initializer
    end

    module ClassMethods
      def group_identifier
        self.class_variable_get :@@group_identifier
      end

      def inc_group_identifier
        self.class_variable_set :@@group_identifier, self.class_variable_get(:@@group_identifier) + 1
      end
    end

    module Initializer
      def initialize(*args)
        super(*args)
        @identifier = self.class.inc_group_identifier
      end
    end

    # attr_reader :identifier
    def identifier
      @identifier
    end

    # class << self
    #   attr_reader :group_identifier
    # end
    # ClassMethods::group_identifier

    def == obj
      (obj.class == self.class) && (obj.instance_variable_get(identifier) == self.instance_variable_get(identifier))
    end

    alias :== :eql?
  end
end
