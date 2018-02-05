class Book

  @@on_shelf = []
  @@on_loan = []
  @@current_due_date = 15

  ## CLASS METHODS ##
  def self.create(title, author, isbn)
    book = Book.new(title, author, isbn)
     @@on_shelf << book
    return book
  end

  # The due date is 21 days from the lend date.
  def self.current_due_date
    @@current_due_date = (Time.now + (3600*24*21)).asctime
  end

  def self.overdue_books

  end

  def self.browse
    @@on_shelf[rand(@@on_shelf.size)]
  end

  def self.available
    @@on_shelf
  end

  def self.borrowed
    @@on_loan
  end

  ## INSTANCE METHODS ##
  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  ## READER METHODS ##
  def title
    @title
  end

  def author
    @author
  end

  def isbn
    @isbn
  end

  ## OTHER METHODS ##
  def borrow
    if lent_out?
      false

    else
      self.due_date = Book.current_due_date

      dummy_book = @@on_shelf.find do |book|
        book.isbn == @isbn
      end
      @@on_loan << @@on_shelf.delete(dummy_book)
      return true
    end
  end

  def return_to_library

  end

  def lent_out?
    list_of_lent_out_matches = @@on_loan.select do |book|
      book.isbn == @isbn
    end

    if list_of_lent_out_matches.length > 0
      return true
    else
      return false
    end
  end

  def due_date
    @due_date
  end

  def due_date=(due_date)
    # puts "hihihihihi"
    @due_date = due_date
  end
end

book1 = Book.create(1,1,5)
book2 = Book.create(1,1,5)
book3 = Book.create(1,1,5)
book4 = Book.create(1,1,5)

# puts Book.available

# puts Book.browse
# puts Book.browse
# puts Book.browse

puts book4.lent_out?
# puts Book.current_due_date
puts book4.borrow
puts book4.due_date
# puts book4.inspect
# puts book4.lent_out?
