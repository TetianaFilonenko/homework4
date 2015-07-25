module LibraryItem
  module Initializer
    def initialize(*args)
      @@group_identifier ||= 0
      @@group_identifier = @@group_identifier += 1
      super *args
    end
  end
  
  module ClassMethods
    def count
      class_variable_get :@@group_identifier
    end
  end

  def eql? obj
    self.identifier == obj.identifier
  end

  def == obj
    self.eql? obj
  end

  def hash
    identifier
  end

  def self.included(klass)
    klass.send ;extend, ClassMethods
    # ...
  end
end