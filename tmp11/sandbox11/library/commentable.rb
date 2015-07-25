module Library

  module Identifier

    @@all_identifiers = 0


    def self.included(base)
      base.send :extend, ClassMethods
      base.send :prepend, Initializer
      base.send :class_variable_set, :@@group_identifier, 0
    end

    module Initializer

      def initialize *args
        self.class.group_identifier = 1
        all_identifiers_counter
        @identifier = Library::Identifier.group_identifier_stat
        super *args

      end
    end

    module ClassMethods

      def group_identifier
        self.class_variable_get :@@group_identifier
      end

      def group_identifier=(increment)
        self.class_variable_set :@@group_identifier, self.class_variable_get(:@@group_identifier) + increment
      end

    end


    def all_identifiers_counter
      @@all_identifiers += 1
    end

    def self.group_identifier_stat
      @@all_identifiers
    end

    def identifier
      @identifier
    end

    def eql? obj

      self.identifier == obj.identifier ? true : false

    end

    def == obj
      self.identifier == obj.identifier ? true : false
    end



  end



  module Commentable

    @@total_comments_counter = 0

    def self.included(base)
      base.send :extend, ClassMethods
      base.send :prepend, Initializer
      base.send :class_variable_set, :@@comments_counter, 0
    end

    module ClassMethods

      def comments_quantity
        self.class_variable_get :@@comments_counter
      end

      def inc_comment_or_init increment
        self.class_variable_set :@@comments_counter, self.class_variable_get(:@@comments_counter) + increment
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

end
