module Library
	module Identifier
		def self.included(base)
			base.send :extend, ClassMethods
			base.send :prepend, Initializer
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
					self.class.class_variable_get(:@@group_identifier)+1
				else
					self.class.class_variable_set :@@group_identifier,0
				end
				@identifier = self.class.class_variable_get(:@@group_identifier)
	
				super *args
			end
		end

		def identifier
			@identifier ||= 0
		end

		def ==(other)
			class_equal = (self.class == other.class ? true : false)
			if class_equal
				self.identifier == other.identifier ? true : false
			else
				false
			end 
		end

		def eql?(other)
			class_equal = (self.class == other.class ? true : false)
			if class_equal
				self.identifier == other.identifier ? true : false
			else
				false
			end 
		end

	end
end