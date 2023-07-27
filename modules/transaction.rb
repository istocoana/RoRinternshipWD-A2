module Transaction
  def initialize
    @total_daily_withdrawals = 0
  end

  def total_daily_withdrawals # getter
    @total_daily_withdrawals ||= 0
  end

  def total_daily_withdrawals=(value) # setter
    @total_daily_withdrawals = value
  end
  
  def deposit_money(money)
    if money <= 0
      puts "You can't deposit a negative amount!"
      return
    end

    @balance += money 
    puts "Deposited $ #{money}. Your account balance is $ #{@balance}."
      
  end

  def withdraw_money(money)
    if money <= 0
      puts "You can't withdraw a negative amount!"
    elsif (total_daily_withdrawals + money) > 5000
      puts "The maximum daily withdrawal amount has been exceeded. You can withdraw a maximum of $5000.\n Today's withdrawal history: #{total_daily_withdrawals}"
    elsif money > @balance
      puts "Your balance is #{@balance}. You don't have enough funds in your account."
    else
      @balance -= money
      self.total_daily_withdrawals += money
      puts "Retrieved $#{money}. Your account balance is $#{@balance}. \n Today's withdrawal history: #{total_daily_withdrawals}"
    end
  end
end
