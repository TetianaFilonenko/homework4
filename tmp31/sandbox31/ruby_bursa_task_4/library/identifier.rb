# rubocop shut up
module Library
  # rubocop shut up
  module Identifier
    attr_reader :identifier

    def self.included(base)
      base.send :extend, ClassMethods
      base.send :prepend, Initializer
      base.send :class_variable_set, :@@total_objects, 0
      base.send :class_variable_set, :@@group_identifier, 0
    end

    # rubocop shut up
    module ClassMethods
      def group_identifier
        class_variable_get(:@@group_identifier)
      end

      def inc_group_identifier
        class_variable_set(:@@group_identifier,
                           class_variable_get(:@@group_identifier) + 1)
      end
    end

    # rubocop shut up
    module Initializer
      def initialize(*args)
        @@total_objects ||= 0
        @@total_objects += 1
        self.class.inc_group_identifier
        @identifier = @@total_objects
        super(*args)
      end
    end

    def self.group_identifier
      @@group_identifier
    end

    def ==(other)
      self.class.instance_variable_get(:@identifier) ==
        other.class.instance_variable_get(:@identifier) &&
        other.instance_of?(self.class)
    end
    alias_method :==, :eql?
  
  end
end
