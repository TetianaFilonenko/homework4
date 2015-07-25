class Library::Book

  include Library::Commentable

  attr_accessor :author, :title

  def initialize author, title
    @author, @title = author, title
  end

end
