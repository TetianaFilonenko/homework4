class Library::Book

	include Library::Commentable

	attr_accessor :author, :title

	def initialize author, title
	  @author = author
	  @title = title
	end

end
