class Library::Book

  include Library::Commentable
  include Library::Identifier

  attr_accessor :author, :title

  def initialize author, title
    @author = author
    @title = title
    super()
  end

end
