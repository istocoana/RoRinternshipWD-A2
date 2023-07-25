class BankAccount
 
  attr_accessor :name, :job, :email, :address, :balance 

  def initialize(name, job, email, address)
    @name = name
    @job = job
    @email = email 
    @address = address 
    @balance = 0
  end

  def deposit_money(money)
    @balance += money 
    puts "Deposited $ #{money}. Your account balance is $ #{@balance}."
  end

  def withdraw_money(money)
    if money > 5000
      puts "The maximum daily withdrawal amount has been exceeded. You can withdraw a maximum of $5000."
    elsif money > @balance
      puts "Your balance is #{@balance}. You don't have enough funds in your account to withdraw $#{money}" 
    
    else 
      @balance -= money
      puts "Retrieved $ #{money}. Your account balance is $ #{@balance}."
    end 
  end
end