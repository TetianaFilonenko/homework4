require 'gmail'
require 'pry'
require 'zip'
require 'csv'
require 'active_support/all'

desc "Make coffee"
task :download_homeworks_and_unzip do
  results = []
  students = []
  Gmail.connect('test', 'test').mailbox("HomeWork4").emails.each_with_index do |email, counter|
    begin
      puts '=' * 80
      student_grade = []
      student_name = email.message.subject.split('.')[0] 
      next if students.include?(student_name)
      students << student_name
      puts "checking #{student_name}, #{counter}"
      student_grade << counter << student_name
      FileUtils.mkdir "#{Dir.pwd}/tmp#{counter}"
      FileUtils.mkdir "#{Dir.pwd}/tmp#{counter}/sandbox#{counter}"
      email.message.attachments.each do |f|
        File.write(File.join("#{Dir.pwd}/tmp#{counter}", 'ruby_bursa_task_4.zip'), f.body.decoded)
      end
      Zip::File.open("#{Dir.pwd}/tmp#{counter}/ruby_bursa_task_4.zip") do |zip_file|
        zip_file.each { |f| zip_file.extract(f, File.join("#{Dir.pwd}/tmp#{counter}/sandbox#{counter}", f.name)) }
      end
      puts student_grade.to_s
      results << student_grade
    rescue Exception => e  
      puts e.message
      puts e.backtrace.inspect  
    end
  end
  CSV.open("hw_4_grades.csv", "a+") do |csv|
    results.each{ |res| csv << res }
  end
end

desc "Make tea"
task :check_homework do
  results = []
  file_name = 'library'
  homework_count = Dir.entries('.').reject{ |d| d.scan(/tmp.*/).empty? }.sort_by{ |q| q.split('tmp')[1].to_i }
  homework_count.each do |dir|
    begin
      counter = dir.split('tmp')[1]
      puts '=' * 80
      path = "./#{dir}/sandbox#{counter}/library/#{file_name}.rb"
      if File.exist?(path)
        require path
      else
        directories = Dir.glob("./#{dir}/sandbox#{counter}/*").select{ |e| File.directory? e }
        raise 'directory not found' if directories[0].blank?
        path = directories[0]+"/library/#{file_name}.rb"
        require path
      end
      @leo_tolstoy = Library::Author.new(1828, 1910, 'Leo Tolstoy')
      @oscar_wilde = Library::Author.new(1854, 1900, 'Oscar Wilde')
      @agatha_christie = Library::Author.new(1890, 1976, 'Agatha Christie')

      @war_and_peace = Library::PublishedBook.new(@leo_tolstoy, 'War and Peace', 1400, 3280, 1996)
      @picture_of_dorian_gray = Library::PublishedBook.new(@oscar_wilde, 'The Picture of Dorian Gray', 900, 1280, 2001)
      @poirot_investigates =  Library::PublishedBook.new(@agatha_christie, 'Poirot investigates', 700, 2280, 2007)

      @ivan_testenko = Library::Reader.new('Ivan Testenko', 130)
      @semen_pyatochkin = Library::Reader.new('Semen Pyatochkin', 110)
      @vasya_pupkin = Library::Reader.new('Vasya Pupkin', 140)

      comment_cool = "cool"
      comment_fine = "fine"
      comment_nice = "nice"

      @war_and_peace.add_comment(comment_cool)
      @poirot_investigates.add_comment(comment_fine)
      @leo_tolstoy.add_comment(comment_cool)
      @leo_tolstoy.add_comment(comment_fine)


      first, second, third = 3.times.map{0}
# check module
      begin
        if [:Author,:Book, :PublishedBook, :Reader, :Manager].all? { |e| Library.constants.include?(e) }
          first += 10
        end
      rescue Exception => e
        puts e.message
        puts e.backtrace.inspect
      end

# check commentable
      begin
        if Library.constants.include?(:Commentable)
          if Library::Commentable.class_variables.include?(:@@total_comments_counter)
            second += 2 
            second += 2 if Library::Commentable.total_comments_quantity == 4
          end
          if [Library::Author, Library::Book, Library::PublishedBook].all? { |e| e.method(:comments_quantity).parameters.count.zero? }
            second += 3
            second += 2 if Library::PublishedBook.comments_quantity == 2
            second += 2 if Library::Author.comments_quantity == 2
          end
          if [@poirot_investigates, @war_and_peace, @leo_tolstoy].all? { |e| e.instance_variables.include?(:@comments) }
            second += 3
            second += 2 if @poirot_investigates.comments.include?(comment_fine)
            second += 2 if @war_and_peace.comments.include?(comment_cool)
            second += 2 if @leo_tolstoy.comments.include?(comment_cool)
          end
        end
      rescue Exception => e
        puts e.message
        puts e.backtrace.inspect
      end
# check identifier
      begin
        if Library.constants.include?(:Identifier)
          third += 5 if [Library::PublishedBook, Library::Reader].all?{ |e| e.class_variables.include?(:@@group_identifier) }
          third += 5 if [@war_and_peace, @ivan_testenko].all? { |e| e.instance_variables.include?(:@identifier)}   
          third += 5 unless @war_and_peace.eql? @picture_of_dorian_gray
          third += 5 unless @ivan_testenko.eql? @semen_pyatochkin
        end
      rescue Exception => e
        puts e.message
        puts e.backtrace.inspect
      end

      total = [first, second, third].sum
      student_grade = [counter, total, first, second, third]
      results << student_grade
    rescue Exception => e  
      puts e.message
      puts e.backtrace.inspect  
    end

    if defined? Library
      [:Author, :Commentable,
         :Identifier, :Manager, :PublishedBook,
         :Reader, :ReaderWithBook, :Book].each{ |s| Library.send(:remove_const, s) if Library.constants.include?(s) }
        Object.send(:remove_const, :Library)
    end
  end
  CSV.open("hw_4_grades.csv", "a+") do |csv|
    results.each{ |res| csv << res }
  end
end

desc "And clear"
task :remove_homeworks do
  results = []
  begin
    system('rm -rf tmp*')
  rescue Exception => e  
    puts e.message
    puts e.backtrace.inspect  
  end
  CSV.open("hw_4_grades.csv", "a+") do |csv|
    results.each{ |res| csv << res }
  end
end
