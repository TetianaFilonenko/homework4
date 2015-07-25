require './library/library.rb'

describe Library::ReaderWithBook do
  
  let(:leo_tolstoy) { Library::Author.new(1828, 1910, 'Leo Tolstoy' ) }
  let(:ivan_testenko_reader) { Library::Reader.new('Ivan Testenko', 100) }
  let(:war_and_peace) { Library::PublishedBook.new(leo_tolstoy, 'War and Peace', 1400, 3280, 1996) }
  let(:reader_with_book) { Library::ReaderWithBook.new(war_and_peace, ivan_testenko_reader, 328, (Time.now - 2.days)) }
    
  it 'should count penalty' do
    expect(reader_with_book.penalty).to eq 789
  end

  it 'should count days to buy' do
    expect(reader_with_book.days_to_buy).to eq 4
  end

  it 'should count penalty to finish' do
    expect(reader_with_book.penalty_to_finish).to eq 1274
  end

end
