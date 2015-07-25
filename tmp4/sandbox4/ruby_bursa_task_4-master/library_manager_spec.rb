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
    expect(author.comments).to eq ["The comment"]    
  end

end


describe Library::Author do
  let!(:author){Library::Author.new "", 4, 4}

  it 'should be commentable' do
    author.add_comment "The comment"
    expect(Library::Author.comments_quantity).to eq 2
    expect(Library::Commentable.total_comments_quantity).to eq 3
    expect(author.comments.count).to eq 1
    expect(author.comments).to eq ["The comment"]    
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
  let!(:reader6) { Library::Reader.new "", "" }
  let!(:reader7) { Library::Reader.new "", "" }
  
  it 'should return good id of object' do
    expect(reader4.identifier).to eq 4
    expect(Library::Reader.group_identifier).to eq 7
    expect(reader4.eql?(reader5)).to eq false
    expect(reader2.eql?(reader2)).to eq true
    expect(reader3 == reader4).to eq false
    expect(reader2 == reader2).to eq true
  end
end



