class Library::Manager

  attr_accessor :readers, :books, :readers_with_books

  def initialize readers = [], books = [], readers_with_books = []
    @readers_with_books = readers_with_books
    @readers = readers
    @books = books
  end

  def new_book author, title, price, pages_quantity, published_at

  end

  def new_reader  name, reading_speed

  end

  def give_book_to_reader reader_name, book_title

  end

  def read_the_book reader_name, duration

  end

  def reader_notification name = "Ivan Testenko"
    r = readers_with_books.find{|r| r.reader.name == name}
<<-TEXT
Dear #{r.reader.name}!

You should return a book "#{r.amazing_book.title}" authored by #{r.amazing_book.author.name} in #{r.hours_remaining} hours.
Otherwise you will be charged $#{r.amazing_book.penalty_per_hour.round(2)} per hour.
By the way, you are on #{r.current_page} page now and you need #{r.time_to_finish} hours to finish reading "#{r.amazing_book.title}"
TEXT
  end

  def librarian_notification
<<-TEXT
Hello,

There are #{books.count + readers_with_books.count} published books in the library.
There are #{readers.count + readers_with_books.count} readers and #{readers_with_books.count} of them are reading the books.

#{readers_information}
TEXT
  end

  def readers_information
    readers_with_books.map do |r|
      "#{r.reader.name} is reading \"#{r.amazing_book.title}\" - should return on #{r.return_date.strftime("%Y-%m-%d at %l %p").downcase} - #{r.time_to_finish} hours of reading is needed to finish."
    end.join("\n")
  end

  def statistics_notification

  end

  private

  def populate_statistics!
    readers_with_books.each do |r|
      @statistics["readers"][r.reader.name] ||= {"pages" => 0, "books" => 0, "authors" => []}
      @statistics["readers"][r.reader.name]["pages"] += r.current_page
      @statistics["readers"][r.reader.name]["authors"] |= [r.amazing_book.author.name]
      @statistics["readers"][r.reader.name]["books"] += 1
      @statistics["book_titles"][r.amazing_book.title] ||= {
      "author" => "", "reding_hours" => 0, "readers" => []}
      @statistics["book_titles"][r.amazing_book.title]["author"] = r.amazing_book.author.name
      @statistics["book_titles"][r.amazing_book.title]["reading_hours"] += r.reading_hours
      @statistics["book_titles"][r.amazing_book.title]["readers" ] |= [r.reader.name]
      # @statistics["authors"][r.name] ||= {"pages" => 0, "books" => 0, "authors" => 0}
      # @statistics["authors"][r.name]["pages"] += r.current_page
      # @statistics["authors"][r.name]["authors"] |= [r.amazing_book.author.name]
      # @statistics["authors"][r.name]["books"] += 1
    end
    @statistics
  end

  def statiscs_sample
    {
      "readers" => {
        "Ivan Testenko" => {
          "pages" => 1040, 
          "books" => 3, 
          "authors" => ["David A. Black", "Leo Tolstoy"]
          }
        },
      "book_titles" => {
        "The Well-Grounded Rubyist" => {
          "author" => "David A. Black", 
          "reading_hours" => 123, 
          "readers" => ["Ivan Testenko"]
          }
        },
      "authors" => {
        "Leo Tolstoy" => {
          "pages" => 123, 
          "readers" => 4, 
          "books" => 3
          }
        }
    }
  end

  def reader_notification_params

  end

  def librarian_notification_params

  end

  def statistics_notification_params

  end

end
