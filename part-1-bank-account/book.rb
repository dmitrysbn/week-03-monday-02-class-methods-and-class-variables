class Book

  @@on_shelf = []
  @@on_loan = []

  ## CLASS METHODS ##
  def self.create

  end

  def self.current_due_date

  end

  def self.overdue_books

  end

  def self.browse

  end

  def self.available

  end

  def self.borrowed

  end

  ## INSTANCE METHODS ##
  def initialize

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
