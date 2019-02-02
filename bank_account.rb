
# create BankAccount Class
class BankAccount
  # allow attribute reader, to be read only
  attr_reader :name

  # define initialize, with customer name and empty array
  def initialize(name)
    @name = name
    @transactions = []
  end

  # add methods to push data to transactions array, both debit and credit the account balance
  def add_transactions(description, amount)
    @transactions.push("description": description, "amount": amount)
  end

  def credit(description, amount)
    add_transactions(description, amount)
  end

  def debit(description, amount)
    add_transactions(description, -amount)
  end

  # define the account balance with starting value of 0.00
  def balance
    balance = 0.00
    @transactions.each do | transaction|
      balance += transaction[:amount]
    end
    return balance
  end

  # define 'to string' method that prints useful account information
  def to_s
    "Name: #{name}, Balance: #{sprintf("%0.2f", balance)}"
  end

  # Print the registered account holder's name
  def print_register
    puts "#{name}'s' Bank Account"
    puts "/" * 40

    puts "Description".ljust(30) + "Amount".rjust(10)
    puts "/" * 40
    @transactions.each do |transaction|
      puts transaction[:description].ljust(30) + sprintf("%0.2f",  transaction[:amount]).rjust(10)
    end

   puts "-" * 40

    puts "Ending Balance:".ljust(30) + sprintf("%0.2f", balance).rjust(10)
    puts "-" * 40
  end

  # puts "-" * 40


end
# These are just used for Testing (lines 62-68)
bank_account = BankAccount.new("Archie")
bank_account.credit("Paycheck", 100)
bank_account.debit("Groceries", 40)

puts bank_account
puts "Register:"
bank_account.print_register
