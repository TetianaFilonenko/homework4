module Library::Identifier
  
  def self.included(base)
    base.send :extend, ClassMethods
    base.send :prepend, Initializer
    base.send :class_variable_set, :@@group_identifier, 0
  end

  module ClassMethods

    def inc_group_identifier
      self.class_variable_set :@@group_identifier, self.class_variable_get(:@@group_identifier) + 1
    end

    def group_identifier
      self.class_variable_get :@@group_identifier
    end

  end

  module Initializer

    def initialize *args
      self.class.inc_group_identifier
      @identifier = self.class.class_variable_get :@@group_identifier
      super *args
    end

  end

  def identifier
    @identifier
  end

  def eql?(obj)
    obj.identifier.eql? @identifier
  end

  def ==(obj)
    obj.identifier == @identifier
  end
end