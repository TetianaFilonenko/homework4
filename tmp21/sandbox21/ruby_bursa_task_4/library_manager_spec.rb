require './library.rb'

describe Library::Author do
  let!(:leo_tolstoy) { Library::Author.new(1828, 1910, 'Leo Tolstoy') }
  let!(:stendhal) { Library::Author.new(1783, 1942, 'Stendhal')}

  it 'should be commentable' do
    leo_tolstoy.add_comment("First comment")
    expect(Library::Author.comments_quantity).to eq 1
    expect(Library::Commentable.total_comments_quantity).to eq 1
    expect(leo_tolstoy.comments.count).to eq 1
    expect(stendhal.comments.count).to eq 0
    leo_tolstoy.add_comment("Second comment")
    expect(Library::Author.comments_quantity).to eq 2
    expect(Library::Commentable.total_comments_quantity).to eq 2
    expect(leo_tolstoy.comments.count).to eq 2
    expect(stendhal.comments.count).to eq 0
    stendhal.add_comment("First comment")
    expect(Library::Author.comments_quantity).to eq 3
    expect(Library::Commentable.total_comments_quantity).to eq 3
    expect(leo_tolstoy.comments.count).to eq 2
    expect(stendhal.comments.count).to eq 1
  end  
end

describe Library::PublishedBook do
  let!(:leo_tolstoy) { Library::Author.new(1828, 1910, 'Leo Tolstoy') }
  let!(:stendhal) { Library::Author.new(1783, 1942, 'Stendhal')}
  let!(:war_and_peace) { Library::PublishedBook.new(leo_tolstoy, 'War and Peace', 1400, 3280, 1996) }
  it 'should be commentable' do
    war_and_peace.add_comment("First comment")
    expect(Library::PublishedBook.comments_quantity).to eq 1
    expect(Library::Commentable.total_comments_quantity).to eq 4
    expect(leo_tolstoy.comments.count).to eq 0
    expect(stendhal.comments.count).to eq 0
    expect(war_and_peace.comments.count).to eq 1
  end

end

describe Library::PublishedBook do
  let!(:leo_tolstoy) { Library::Author.new(1828, 1910, 'Leo Tolstoy') }
  let!(:publisher1) { Library::PublishedBook.new( "", "", 0, 0, 0) }
  let!(:publisher2) { Library::PublishedBook.new( "", "", 0, 0, 0) }
  let!(:publisher3) { Library::PublishedBook.new( "", "", 0, 0, 0) }
  let!(:publisher4) { Library::PublishedBook.new( "", "", 0, 0, 0) }
  let!(:war_and_peace) { Library::PublishedBook.new(leo_tolstoy, 'War and Peace', 1400, 3280, 1996) }
  let!(:publisher5) { Library::PublishedBook.new "", "", "", "", "" }

  it 'should return true identifier' do
    expect(war_and_peace.identifier).to eq 5
    expect(Library::PublishedBook.group_identifier).to eq 6
    expect(publisher3.eql?(publisher1)).to eq false
    expect(publisher2.eql?(publisher2)).to eq true
    expect(publisher3 == publisher4).to eq false
    expect(publisher2 == publisher2).to eq true
  end
end

describe Library::ReaderWithBook do
  let!(:leo_tolstoy) { Library::Author.new(1828, 1910, 'Leo Tolstoy') }
  let!(:stendhal) { Library::Author.new(1783, 1942, 'Stendhal')}
  let!(:war_and_peace) { Library::PublishedBook.new(leo_tolstoy, 'War and Peace', 1400, 3280, 1996) }
  let!(:ivan) {Library::Reader.new('Ivan Testenko', 16)}
  let!(:ivan_testenko) { Library::ReaderWithBook.new(war_and_peace, ivan, 328, (DateTime.now.new_offset(0) + 2.days)) }
  it 'should be commentable' do
    ivan_testenko.add_comment("First comment")
    expect(Library::ReaderWithBook.comments_quantity).to eq 1
    expect(Library::Commentable.total_comments_quantity).to eq 5
    expect(leo_tolstoy.comments.count).to eq 0
    expect(stendhal.comments.count).to eq 0
    expect(war_and_peace.comments.count).to eq 0
    expect(ivan_testenko.comments.count).to eq 1
  end
end

describe Library::Reader do
    let!(:reader1) { Library::Reader.new("Ya0", 5) }
    let!(:reader2) { Library::Reader.new("Ya1", 10) }
    let!(:reader3) { Library::Reader.new "Ya2", 20 }
    let!(:reader4) { Library::Reader.new "Ya3", 30 }
    let!(:reader5) { Library::Reader.new "Ya4", 40 }

    it 'should return true identifier' do
      expect(reader2.identifier).to eq 2
      expect(Library::Reader.group_identifier).to eq 5
      expect(reader4.eql?(reader5)).to eq false
      expect(reader2.eql?(reader2)).to eq true
      expect(reader3 == reader4).to eq false
      expect(reader2 == reader2).to eq true
    end

end

