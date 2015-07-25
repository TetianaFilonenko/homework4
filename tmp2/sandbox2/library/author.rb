class Library::Author
  # include Quality
  include Library::Commentable
  
  attr_accessor :year_of_birth, :year_of_death, :name

  def initialize year_of_birth, year_of_death, name
    @year_of_birth = year_of_birth
    @year_of_death = year_of_death
    @name = name
  end

  def to_s
    "#{@name} (#{@year_of_birth} - #{@year_of_death})"
  end

  def ==(arg)
    return false if arg.class != Author
    @name == arg.name && @year_of_birth == arg.year_of_birth && @year_of_death == arg.year_of_death
  end

end
