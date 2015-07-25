module Library
  module Commentable

    @@total_comments_counter = 0

    def self.included(base)
      base.send :extend, ClassMethods
      base.send :prepend, Initializer
      base.send :class_variable_set, :@@comments_counter, 0
    end

    module ClassMethods
      
      def inc_comment_or_init increment
        self.class_variable_set :@@comments_counter, self.class_variable_get(:@@comments_counter) + increment
      end

      def comments_quantity
        self.class_variable_get :@@comments_counter
      end
    
    end

    module Initializer
      
      def initialize *args
        @comments = []
        super *args
      end
    
    end

    def self.total_comments_quantity
      @@total_comments_counter
    end

    def add_comment comment = ""
      self.class.inc_comment_or_init 1
      @@total_comments_counter += 1
      @comments << comment
    end

    def comments
      @comments
    end

  end


  module Identifier
    
    alias == eql?
    
    def self.included(base)
      base.send :extend, ClassMethods
      base.send :prepend, Initializer
      base.send :class_variable_set, :@@group_identifier, 0
    end

    module ClassMethods
      def identifiers_quantity
        self.class_variable_get :@@group_identifier
      end

      def inc_identifier_or_init increment
        self.class_variable_set :@@group_identifier, self.class_variable_get(:@@group_identifier) + increment
      end
    end

    module Initializer
      
      def initialize *args
        self.class.inc_identifier_or_init 1
        @identifier = self.class.identifiers_quantity
        super *args
      end
    
    end
    
    def eql? other
      @identifier == other.identifier
    end

    def identifier
      @identifier
    end
    
  end
  
end
