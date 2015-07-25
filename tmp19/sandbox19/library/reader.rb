class Library::Reader
  attr_accessor :name, :reading_speed

  include Library::Commentable
  include Library::Identifier

  def initialize name, reading_speed
    @name = name
    @reading_speed = reading_speed
  end

end
