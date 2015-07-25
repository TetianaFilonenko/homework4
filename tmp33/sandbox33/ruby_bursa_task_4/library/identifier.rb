module Library
  module Identifier


@@total_identifier = 0

  	
	def self.included(base)
      base.send :extend, ClassMethods
      base.send :prepend, Initializer
      def initialize 
      	self.class.class_variable_set :@@group_identifier, 
        self.class.class_variable_get(:@@group_identifier) + 1
        @@total_identifier += 1
        @identifier = @@total_identifier       
      end
    end


  def identifier 
	   @identifier
	 end

   def eql? (other)
    other.instance_of?(self.class) && @identifier == other.identifier
   end

   def ==(other)
    self.eql?(other)
   end

    module ClassMethods

      def group_identifier
        self.class_variable_get :@@group_identifier
      end

    end

    module Initializer
      def initialize *args
        if self.class.class_variables.include? :@@group_identifier
          self.class.class_variable_set :@@group_identifier, 
            self.class.class_variable_get(:@@group_identifier)
        else
          self.class.class_variable_set :@@group_identifier, 0
        end
      super *args
      end
    end

   
 end
end
