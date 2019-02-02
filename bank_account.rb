class BankAccount
  attr_reader :name

  def initialize(name)
    @name = name
    @transactions = []
  end

  def add_transactions(description, amount)
    @transactions.push("description": description, "amount": amount)
  end

  def credit(description, amount)
    add_transactions(description, amount)
  end

  def debit(description, amount)
    add_transactions(description, -amount)
  end

  def balance
    balance = 0.00
    @transactions.each do | transaction|
      balance += transaction[:amount]
    end
    return balance
  end

  def to_s
    "Name: #{name}, Balance: #{sprintf("%0.2f", balance)}"
  end

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

bank_account = BankAccount.new("Archie")
bank_account.credit("Paycheck", 100)
bank_account.debit("Groceries", 40)

puts bank_account
puts "Register:"
bank_account.print_register
