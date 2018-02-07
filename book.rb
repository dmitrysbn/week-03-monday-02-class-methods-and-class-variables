class Book

  @@on_shelf = []
  @@on_loan = []

  ## CLASS METHODS ##
  def self.create(title, author, isbn, genre)
    book = Book.new(title, author, isbn, genre)
    @@on_shelf << book
    return book
  end

  # The due date is 21 days from the lend date.
  def self.current_due_date
    @@current_due_date = Time.now + (3600 * 24 * 21)
  end

  def self.overdue
    @@on_loan.select do |book|
      book.due_date < Time.now
    end
  end

  def self.browse(genre)
    combined_list = @@on_shelf + @@on_loan

    list_of_genre = combined_list.select do |book|
      book.genre == genre
    end

    return list_of_genre[rand(list_of_genre.size)]
  end

  def self.search(identifier)
    combined_list = @@on_shelf + @@on_loan

    list_of_matches = combined_list.select do |book|
      (book.title == identifier) || (book.author == identifier) || (book.isbn == identifier)
    end

    return list_of_matches
  end

  def self.available
    @@on_shelf
  end

  def self.borrowed
    @@on_loan
  end

  ## INSTANCE METHODS ##
  def initialize(title, author, isbn, genre)
    @title = title
    @author = author
    @isbn = isbn
    @genre = genre
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

  def genre
    @genre
  end

  ## OTHER METHODS ##
  def borrow
    if lent_out?
      @on_hold = true
      return false

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
    if lent_out?
      self.due_date = nil

      dummy_book = @@on_loan.find do |book|
        book.isbn == @isbn
      end
      @@on_shelf << @@on_loan.delete(dummy_book)
      return true

    else
      false
    end
  end

  def lent_out?
    list_of_lent_out_matches = @@on_loan.select do |book|
      book.isbn == @isbn
    end

    if !list_of_lent_out_matches.empty?
      return true
    else
      return false
    end
  end

  def due_date
    @due_date
  end

  def due_date=(due_date)
    @due_date = due_date
  end

  def renew
    if @on_hold
      false
    else
      self.due_date += 3600 * 24 * 21
    end
  end
end

book1 = Book.create(1, 11, 5, "horror")
book2 = Book.create(2, 22, 5, "epic")
book3 = Book.create(3, 33, 5, "poetry")
book4 = Book.create(4, 44, 5, "poetry")

puts Book.available

# puts Book.browse('poetry')
# puts Book.browse('poetry')
puts Book.search(5) # returns all books
# puts Book.browse
# puts Book.browse

puts book4.lent_out?
puts book4.borrow
puts book4.due_date
puts book4.borrow
puts book4.renew
puts book4.lent_out?
puts book4.return_to_library
puts book4.due_date
puts Book.available
puts Book.overdue.inspect

## TEST INPUTS FROM ASSIGNMENT ##
# sister_outsider = Book.create("Sister Outsider", "Audre Lorde", "9781515905431")
# aint_i = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
# if_they_come = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")
# puts Book.browse.inspect # #<Book:0x00555e82acdab0 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221"> (this value may be different for you)
# puts Book.browse.inspect # #<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307"> (this value may be different for you)
# puts Book.browse.inspect # #<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307"> (this value may be different for you)
# puts Book.available.inspect # [#<Book:0x00555e82acde20 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431">, #<Book:0x00555e82acdce0 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00555e82acdab0 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">]
# puts Book.borrowed.inspect # []
# puts sister_outsider.lent_out? # false
# puts sister_outsider.borrow # true
# puts sister_outsider.lent_out? # true
# puts sister_outsider.borrow # false
# puts sister_outsider.due_date # 2017-02-25 20:52:20 -0500 (this value will be different for you)
# puts Book.available.inspect # [#<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00562314675fd8 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">]
# puts Book.borrowed.inspect # [#<Book:0x00562314676208 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431", @due_date=2017-02-25 20:55:17 -0500>]
# puts Book.overdue.inspect # []
# puts sister_outsider.return_to_library # true
# puts sister_outsider.lent_out? # false
# puts Book.available.inspect # [#<Book:0x00562314676118 @title="Ain't I a Woman?", @author="Bell Hooks", @isbn="9780896081307">, #<Book:0x00562314675fd8 @title="If They Come in the Morning", @author="Angela Y. Davis", @isbn="0893880221">, #<Book:0x00562314676208 @title="Sister Outsider", @author="Audre Lorde", @isbn="9781515905431", @due_date=nil>]
# puts Book.borrowed.inspect # []
