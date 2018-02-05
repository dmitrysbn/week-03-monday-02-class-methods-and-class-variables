class BankAccount

  @@interest_rate = 0.01
  @@accounts = []

  ## CLASS METHODS ##
  def self.accounts
    @@accounts
  end

  def self.create
    account = BankAccount.new
    @@accounts << account
    return account
  end

  def self.total_funds
    total = 0.0
    @@accounts.each do |account|
      total += account.balance
    end
    return total
  end

  def self.interest_time
    @@accounts.each do |account|
      account.deposit(account.balance * @@interest_rate)
    end
  end



  ## INSTANCE METHODS ##
  def initialize
    @balance = 0.0
  end

  ## READER METHODS ##
  def balance
    @balance
  end

  ## WRITER METHODS ##
  def balance=(balance)
    @balance = balance
  end

  ## METHODS ##
  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end
end

# puts BankAccount.create
my_account = BankAccount.create
your_account = BankAccount.create

puts "List of accounts:"
puts BankAccount.accounts

puts "Individual accounts:"
puts my_account
puts your_account

puts "Total balance:"
my_account.deposit(20)
your_account.deposit(1000)
puts BankAccount.total_funds

puts "Interest time goes by..."
BankAccount.interest_time
puts my_account.balance
puts your_account.balance
# puts BankAccount.accounts
puts BankAccount.total_funds


## TEST ##
# my_account = BankAccount.create
# your_account = BankAccount.create
# puts my_account.balance # 0
# puts BankAccount.total_funds # 0
# my_account.deposit(200)
# your_account.deposit(1000)
# puts my_account.balance # 200
# puts your_account.balance # 1000
# puts BankAccount.total_funds # 1200
# BankAccount.interest_time
# puts my_account.balance # 202.0
# puts your_account.balance # 1010.0
# puts BankAccount.total_funds # 1212.0
# my_account.withdraw(50)
# puts my_account.balance # 152.0
# puts BankAccount.total_funds # 1162.0
# puts BankAccount.accounts
# puts my_account.balance
