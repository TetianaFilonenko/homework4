module Library
	module Identifier

		

		def self.included(base)
          base.send :prepend, Initializer 
        end

        module Initializer
          def initialize *args

          @@group_identifier = 0

          if @@group_identifier == 0
          	 @@group_identifier = 1
          	 @identifier = 1
          else
          	@@group_identifier+= 1
          	@identifier = @@group_identifier
          end  
          super *args
        end

        end

		def == object
			if self.identifier == object.identifier
				true
			else
				false
			end
		end

		def eql? object
			if self.identifier == object.identifier
				true
			else
				false
			end
		end

		def identifier
			@identifier
	    end
	end
end
