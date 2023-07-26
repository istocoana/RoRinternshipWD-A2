module Transaction
  def deposit_money(money)
      if money > 0
        @balance += money 
        puts "Deposited $ #{money}. Your account balance is $ #{@balance}."
      else  
        puts "You can't deposit a negative amount!"
      end 
  end

  def withdraw_money(money)
    if money <= 0
      puts "You can't withdraw a negative amount!"
    elsif money > 5000
      puts "The maximum daily withdrawal amount has been exceeded. You can withdraw a maximum of $5000."
    elsif money > @balance
      puts "Your balance is #{@balance}. You don't have enough funds in your account." 
    else 
      @balance -= money
      puts "Retrieved $ #{money}. Your account balance is $ #{@balance}."
    end
  end
end
