class Library::Author
  
  include Library::Commentable

  attr_accessor :year_of_birth, :year_of_death, :name

  def initialize year_of_birth, year_of_death, name
    @year_of_birth, @year_of_death, @name = year_of_birth, year_of_death, name
  end
  
  def to_s
    ret = "#{@name} (#{@year_of_birth} - #{@year_of_death})"
  end

  def == other
	 other.class == Author ? (@name == other.name && @year_of_birth == other.year_of_birth && @year_of_death == other.year_of_death) : false
  end

end
