require './library/library.rb'

describe Library::PublishedBook do
  let!(:book1) { Library::PublishedBook.new "","","","",""}
  let!(:book2) { Library::PublishedBook.new "","","","",""}
  let!(:book3) { Library::PublishedBook.new "","","","",""}

  it 'should have correct personal identifier' do
    expect(book3.identifier).to eq 3
  end

  it 'should have correct group identifier' do
    expect(Library::PublishedBook.group_identifier).to eq 3
  end
  
end 

describe Library::Reader do
  let!(:reader1) { Library::Reader.new "",""}
  let!(:reader2) { Library::Reader.new "",""}
  let!(:reader3) { Library::Reader.new "",""}

  it 'should have correct personal identifier' do
    expect(reader2.identifier).to eq 2
  end

  it 'should have correct group identifier' do
    expect(Library::Reader.group_identifier).to eq 3
  end
  
end 