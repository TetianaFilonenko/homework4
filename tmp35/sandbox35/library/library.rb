require 'active_support/all'
require 'pry'

# Common module for all Library classes
module Library
end

require_relative 'commentable.rb'
require_relative 'author.rb'
require_relative 'book.rb'
require_relative 'published_book.rb'
require_relative 'reader.rb'
require_relative 'reader_with_book.rb'
require_relative 'manager.rb'
