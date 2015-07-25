require './library/library.rb'

describe Library::Book do
  let!(:book){Library::Book.new "", ""}

  it 'should be commentable' do
    book.add_comment "The comment"
    expect(Library::Book.comments_quantity).to eq 1
    expect(Library::Commentable.total_comments_quantity).to eq 1
    expect(book.comments.count).to eq 1
  end

end

describe Library::Author do
  let!(:author){Library::Author.new "", 0, 0}

  it 'should be commentable' do
    author.add_comment "The comment"
    expect(Library::Author.comments_quantity).to eq 1
    expect(Library::Commentable.total_comments_quantity).to eq 2
    expect(author.comments.count).to eq 1
  end

end

describe Library::PublishedBook do

  let!(:publisher1) { Library::PublishedBook.new "", "", "", "", "" }
  let!(:publisher2) { Library::PublishedBook.new "", "", "", "", "" }
  let!(:publisher3) { Library::PublishedBook.new "", "", "", "", "" }
  let!(:publisher4) { Library::PublishedBook.new "", "", "", "", "" }
  let!(:publisher5) { Library::PublishedBook.new "", "", "", "", "" }

  it 'should return good id of object' do
    expect(publisher3.identifier).to eq 3
    expect(Library::PublishedBook.group_identifier).to eq 5
    expect(publisher3.eql?(publisher4)).to eq false
    expect(publisher2.eql?(publisher2)).to eq true
    expect(publisher3 == publisher4).to eq false
    expect(publisher2 == publisher2).to eq true

  end

end
describe Library::Reader do

  let!(:reader1) { Library::Reader.new "", "" }
  let!(:reader2) { Library::Reader.new "", "" }
  let!(:reader3) { Library::Reader.new "", "" }
  let!(:reader4) { Library::Reader.new "", "" }
  let!(:reader5) { Library::Reader.new "", "" }


  it 'should return good id of object' do
    expect(reader4.identifier).to eq 4
    expect(Library::Reader.group_identifier).to eq 5
    expect(reader4.eql?(reader5)).to eq false
    expect(reader2.eql?(reader2)).to eq true
    expect(reader3 == reader4).to eq false
    expect(reader2 == reader2).to eq true
  end
end


describe Library::Manager do

#   let(:leo_tolstoy) { Library::Author.new(1828, 1910, 'Leo Tolstoy' ) }
#   let!(:oscar_wilde) { Library::Author.new(1854, 1900, 'Oscar Wilde') }
#   let!(:war_and_peace) { Library::PublishedBook.new(leo_tolstoy, 'War and Peace', 1400, 3280, 1996) }
#   let!(:ivan) {Library::Reader.new('Ivan Testenko', 16)}
#   let!(:ivan_testenko) { Library::ReaderWithBook.new(ivan, war_and_peace, 328, (DateTime.now.new_offset(0) + 2.days)) }
#   let!(:manager) { Library::Manager.new([],[], [ivan_testenko]) }

#   it 'should compose reader notification' do
#     expect(manager.reader_notification("Ivan Testenko")). to eq <<-TEXT
# Dear Ivan Testenko!

# You should return a book "War and Peace" authored by Leo Tolstoy in 36 hours.
# Otherwise you will be charged $12.3 per hour.
# By the way, you are on 333 page now and you need 5.4 hours to finish reading "War and Peace"
# TEXT
#   end

#   it 'should compose librarian notification' do
#     expect(manager.librarian_notification). to eq <<-TEXT
# Hello,

# There are 5 published books in the library.
# There are 6 readers and 3 of them are reading the books.

# Ivan Testenko is reading "War and Peace" - should return on 2015-07-04 at 10am - 5.0 hours of reading is needed to finish.
# Vasiliy Pupkin is reading "Red and Black" - should return on 2015-07-12 at 7pm  - 12.7 hours of reading is needed to finish.
# Barak Obama is reading "The Well-Grounded Rubyist" - should return on 2015-07-10 at 12pm  - 44.5 hours of reading is needed to finish.
# TEXT
#   end

#   it 'should compose statistics notification' do
#     expect(manager.statistics_notification). to eq <<-TEXT
# Hello,

# The library has: 5 books, 4 authors, 6 readers
# The most popular author is Leo Tolstoy: 2450 pages has been read in 2 books by 4 readers.
# The most productive reader is Ivan Testenko: he had read 1040 pages in 3 books authored by 3 authors.
# The most popular book is "The Well-Grounded Rubyist" authored by David A. Black: it had been read for 123.0 hours by 5 readers.
# TEXT
#   end

end
