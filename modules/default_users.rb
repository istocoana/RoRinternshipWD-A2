
module DefaultUsers 

  def default_user1(bank_system)
    default_user1 = User.new("John Doe", "Engineer", "john.doe@example.com", "123 Elm Street, Cityville, USA", "1111")
    user_account1 = bank_system.create_account(default_user1)
    user_account1.balance = 1000
    puts "Welcome, #{default_user1.name}! This is your balance: #{user_account1.balance}."
    user_account1.deposit_money(3000)
    user_account1.withdraw_money(2000)
    user_account1
  end

  def default_user2(bank_system)
    default_user2 = User.new("Michael Anderson", "Marketing Manager", "michael.anderson@mail.com", "1456 Oak Avenue, Cityville, USA", "2222")
    user_account2 = bank_system.create_account(default_user2)
    user_account2.balance = 7000
    puts "Welcome, #{default_user2.name}! This is your balance: #{user_account2.balance}."
    user_account2.deposit_money(100)
    user_account2.withdraw_money(1000)
    user_account2.withdraw_money(4000)
    user_account2.withdraw_money(1000)
    user_account2
  end

  def default_user3(bank_system)
    default_user3 = User.new("Alex Turner", "Graphic Designer", "alex.turner@mail.com", "789 Elm Street, Villageville, USA", "3333")
    user_account3 = bank_system.create_account(default_user3)
    user_account3.balance = 6000
    puts "Welcome, #{default_user3.name}! This is your balance: #{user_account3.balance}."
    user_account3.deposit_money(2000)
    user_account3.withdraw_money(7000)
    user_account3
  end
end
