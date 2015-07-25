require './library/library.rb'

describe Library::Book do
  let!(:book) { Library::Book.new '', '' }

  it 'should be commentable' do
    book.add_comment 'The comment'
    expect(Library::Book.comments_quantity).to eq 1
    expect(Library::Commentable.total_comments_quantity).to eq 1
    expect(book.comments.count).to eq 1
  end
end

describe Library::Author do
  let!(:author) { Library::Author.new '', 0, 0 }

  it 'should be commentable' do
    author.add_comment 'The comment'
    expect(Library::Author.comments_quantity).to eq 1
    expect(Library::Commentable.total_comments_quantity).to eq 2
    expect(author.comments.count).to eq 1
  end
end

describe Library::PublishedBook do

  let!(:publisher1) { Library::PublishedBook.new '', '', '', '', '' }
  let!(:publisher2) { Library::PublishedBook.new '', '', '', '', '' }
  let!(:publisher3) { Library::PublishedBook.new '', '', '', '', '' }
  let!(:publisher4) { Library::PublishedBook.new '', '', '', '', '' }
  let!(:publisher5) { Library::PublishedBook.new '', '', '', '', '' }

  it 'should return id of object' do
    expect(publisher5.identifier).to eq 5

  end

end
describe Library::Reader do

  let!(:reader1) { Library::Reader.new '', '' }
  let!(:reader2) { Library::Reader.new '', '' }
  let!(:reader3) { Library::Reader.new '', '' }
  let!(:reader4) { Library::Reader.new '', '' }
  let!(:reader5) { Library::Reader.new '', '' }

  it 'should return id of object' do
    expect(reader3.identifier).to eq 3
  end
end