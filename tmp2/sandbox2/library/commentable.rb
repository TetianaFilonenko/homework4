module Library
  module Commentable

    @@total_comments_counter = 0

    def self.included(base)
      base.send :extend, ClassMethods
      base.send :prepend, Initializer
      base.send :class_variable_set, :@@comments_counter, 0
    end

    module ClassMethods
      def comments_quantity
        class_variable_get :@@comments_counter
      end
    end
    
    module Initializer
      def initialize(*args)
        @@comments_counter ||= 0
        @comments = []
        super *args
      end
    end

    def self.total_comments_quantity
      @@total_comments_counter
    end

    def add_comment(comment='')
      self.class.class_variable_set :@@comments_counter,
        self.class.class_variable_get(:@@comments_counter) + 1
      @comments << comment
    end

    def comments
      @comments
    end

  end
end