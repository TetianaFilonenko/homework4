module Identifier
  alias == eql?

  def self.included(base)
    base.send :extend, ClassMethods
    base.send :prepend, Initializer
    base.send :class_variable_set, @@group_identifier, 0
  end

  module ClassMethods
    def identifiers_quality
      self.class_variable_get :@@group_identifier
    end

    def inc_idevntifier_or_init incremental_value
      self.class_variable_set :@@group_identifier, self.class_variable_get(:@@group_identifier) + incremental_value
    end
  end

  module Initializer
    def initialize *args
      self.class.inc_identifier_or_init 1
      @identifier = self.class.identifiers_quality
      super *args
    end
  end

  def identifier
    @identifier
  end
  def eql?  second
    @identifier == second.identifier
  end
end
