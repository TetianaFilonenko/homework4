class Library::Reader

  include Library::Commentable
  include Library::Identifier

  attr_accessor :name, :reading_speed

  def initialize name, reading_speed
    @name, @reading_speed = name, reading_speed
  end

end
