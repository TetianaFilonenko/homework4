module Library
  
 module Identifier

    @@identifier_count = 0

    def identifier
      @identifier
    end

    def self.included(base)
      base.send :extend, ClassMethods
      base.send :prepend, Initializer
      base.send :class_variable_set, :@@group_identifier, 0
    end
   
    def identifier_count

        @@identifier_count += 1
        
    end

    def self.identifier_count_stat
      @@identifier_count
    end


    module ClassMethods

      def  group_identifier

        self.class_variable_get :@@group_identifier
        end

      def group_identifier=(increment)
      
        self.class_variable_set :@@group_identifier, self.class_variable_get(:@@group_identifier) + increment

        end

      end # classmethods



    module Initializer

      def initialize *args
       
        identifier_count
        group_identifier_count 
        @identifier = Library::Identifier.identifier_count_stat

        super *args

      end

      def group_identifier_count
        self.class.group_identifier = 1
       end

      


      end  # initializer





  end # идентифаер
 



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

    end # classmethods

    module Initializer
      def initialize *args
        @comments = []
        super *args
      end
       
       
    end # initializer

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

  end # коментабле

end # library
