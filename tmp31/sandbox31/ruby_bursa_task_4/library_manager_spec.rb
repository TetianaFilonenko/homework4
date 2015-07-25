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
  let!(:author) { Library::Author.new '''', 0, 0 }

  it 'should be commentable' do
    author.add_comment 'The comment'
    expect(Library::Author.comments_quantity).to eq 1
    expect(Library::Commentable.total_comments_quantity).to eq 2
    expect(author.comments.count).to eq 1
  end
end
