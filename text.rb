require 'library.rb'
@leo_tolstoy = Library::Author.new(1828, 1910, 'Leo Tolstoy')
@oscar_wilde = Library::Author.new(1854, 1900, 'Oscar Wilde')
@agatha_christie = Library::Author.new(1890, 1976, 'Agatha Christie')

@war_and_peace = Library::PublishedBook.new(@leo_tolstoy, 'War and Peace', 1400, 3280, 1996)
@picture_of_dorian_gray = Library::PublishedBook.new(@oscar_wilde, 'The Picture of Dorian Gray', 900, 1280, 2001)
@poirot_investigates =  Library::PublishedBook.new(@agatha_christie, 'Poirot investigates', 700, 2280, 2007)

@ivan_testenko = Library::Reader.new('Ivan Testenko', 130)
@semen_pyatochkin = Library::Reader.new('Semen Pyatochkin', 110)
@vasya_pupkin = Library::Reader.new('Vasya Pupkin', 140)


@ivan_testenko_war_and_peace = Library::ReaderWithBook.new(@war_and_peace, @ivan_testenko, 234, Time.now + 4.days)
@semen_pyatochkin_dorian_gray = Library::ReaderWithBook.new(@picture_of_dorian_gray, @semen_pyatochkin, 571, Time.now + 1.days)
@semen_pyatochkin_poirot_investigates = Library::ReaderWithBook.new(@poirot_investigates, @semen_pyatochkin, 464, Time.now + 2.weeks)
@vasya_pupkin_poirot_investigates = Library::ReaderWithBook.new(@poirot_investigates, @vasya_pupkin, 100, Time.now + 4.days)


comment_cool = "cool"
comment_fine = "fine"
comment_nice = "nice"

@war_and_peace.add_comment(comment_cool)
@poirot_investigates.add_comment(comment_fine)

Library::PublishedBook.comments_quantity == 2 #1
@poirot_investigates.include?(comment_fine) #2

@ivan_testenko_war_and_peace.add_comment(comment_nice)
@semen_pyatochkin_dorian_gray.add_comment(comment_fine)
@vasya_pupkin_poirot_investigates.add_comment(comment_cool)
Library::ReaderWithBook.comments_quantity == 3 #3
@vasya_pupkin_poirot_investigates.include?(comment_cool) #4
@leo_tolstoy.add_comment(comment_cool)
@leo_tolstoy.add_comment(comment_fine)
Library::Book.comments_quantity == 2 #5
@leo_tolstoy.comments.include?(comment_cool) #6
Library::Commentable.total_comments_quantity == 6 #7

# Identifier check
@war_and_peace.eql? @picture_of_dorian_gray
@ivan_testenko.eql? @semen_pyatochkin
