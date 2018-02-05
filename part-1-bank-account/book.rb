class Book

  @@on_shelf = []
  @@on_loan = []

  ## CLASS METHODS ##
  def self.create(title, author, isbn)
    book = Book.new(title, author, isbn)
     @@on_shelf << book
    return book
  end

  def self.current_due_date

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
    @@on_load
  end

  ## INSTANCE METHODS ##
  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def borrow

  end

  def return_to_library

  end

  def lent_out?

  end

  def due_date
    @due_date
  end

  def due_date=(due_date)
    @due_date = due_date
  end
end

book1 = Book.create(1,1,5)
book2 = Book.create(1,1,5)
book3 = Book.create(1,1,5)
book4 = Book.create(1,1,5)

# puts Book.available

puts Book.browse
puts Book.browse
puts Book.browse
