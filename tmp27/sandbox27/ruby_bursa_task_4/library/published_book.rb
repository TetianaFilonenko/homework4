#require '../library/library'

class Library::PublishedBook < Library::Book

 include Library::Identifier

  attr_accessor :price, :pages_quantity, :published_at

  def initialize author, title, price, pages_quantity, published_at
    @price = price
    @pages_quantity = pages_quantity
    @published_at = published_at
    super author, title
  end

  def age
    Time.now.year - published_at
  end

  def penalty_per_hour
    price_penalty = price * 0.0005
    pages_penalty = 0.000003 * price * pages_quantity
    age_penalty = 0.00007 * price * age

    price_penalty + pages_penalty + age_penalty
  end

end


# publisher1 = Library::PublishedBook.new "","","","",""
# publisher2 = Library::PublishedBook.new "","","","",""
# publisher3 = Library::PublishedBook.new "","","","",""
# reader = Library::Reader.new('','')
# reader = Library::Reader.new('','')
# publisher4 = Library::PublishedBook.new "","","","",""
# publisher5 = Library::PublishedBook.new "","","","",""
# publisher6 = Library::PublishedBook.new "","","","",""
# publisher6 = Library::PublishedBook.new "","","","",""
# reader = Library::Reader.new('','')
# reader1 = Library::Reader.new('','')
# reader1 = Library::Reader.new('','')
 
# puts "#### Group Identifiers  #####"
# p Library::Reader.group_identifier
# p Library::PublishedBook.group_identifier
 
# puts "#### Identifier  #####"
# p publisher5.identifier
# p publisher6.identifier
# puts "#### Count Identifiers  #####"
 
 
# p publisher5.eql?(publisher4)
# p publisher5 == publisher4
 
# p publisher5.eql?(publisher5)
# p publisher5 == publisher5
