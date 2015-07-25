module Library
  require_relative './identifier.rb'
  class Reader
  	include Library::Identifier
    attr_accessor :name, :reading_speed
  
    def initialize name, reading_speed
      @name = name
      @reading_speed = reading_speed
    end
  end
end