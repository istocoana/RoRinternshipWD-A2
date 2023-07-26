require_relative 'bank_account'
require_relative 'bank_system'
require_relative 'user'
require_relative '../modules/transaction'
require_relative '../modules/create_user'

def main 
  puts "\n" + "-" * 20

  bank_system = BankSystem.new

  user_accounts = {}

  default_user1 = User.new("John Doe", "Engineer", "john.doe@example.com", "123 Elm Street, Cityville, USA", "1111")
  user_account1 = bank_system.create_account(default_user1)
  user_account1.balance = 1000
  puts "Welcome, #{default_user1.name}! This is your balance: #{user_account1.balance}."
  user_account1.deposit_money(3000)
  user_account1.withdraw_money(2000)
  user_accounts[user_account1.user.name] = user_account1

  puts "\n" + "-" * 20

  default_user2 = User.new("Michael Anderson", "Marketing Manager", "michael.anderson@mail.com", "1456 Oak Avenue, Cityville, USA", "2222")
  user_account2 = bank_system.create_account(default_user2)
  user_account2.balance = 2000
  puts "Welcome, #{default_user2.name}! This is your balance: #{user_account2.balance}."
  user_account2.deposit_money(100)
  user_account2.withdraw_money(4000)
  user_accounts[user_account2.user.name] = user_account2

  puts "\n" + "-" * 20

  default_user3 = User.new("Alex Turner", "Graphic Designer", "alex.turner@mail.com", "789 Elm Street, Villageville, USA", "3333")
  user_account3 = bank_system.create_account(default_user3)
  user_account3.balance = 6000
  puts "Welcome, #{default_user3.name}! This is your balance: #{user_account3.balance}."
  user_account3.deposit_money(2000)
  user_account3.withdraw_money(7000)
  user_accounts[user_account3.user.name] = user_account3

  puts "\n" + "-" * 20

  
  loop do
    puts "Welcome! What would you like to do?"
    puts "1. Create new account"
    puts "2. Login to existing account"
    puts "3. Exit"

    choice = gets.chomp.to_i 

    case choice 
    when 1
      include CreateUser
      user_account = bank_system.create_account(create_user)
      user_accounts[user_account.user.name] = user_account
    when 2
      puts "Please enter your name:"
      name = gets.chomp
      user_account = user_accounts[name]
      if user_account.nil?
        puts "No account found with this name. Please try again."
        next
      else
        loop do
          puts "Enter your PIN to continue:"
          pin_attempt = gets.chomp.to_i
          if user_account.user.login(pin_attempt)
            break
          end
        end
      end
    when 3
      puts "Thank you for using our bank. Goodbye!"
      exit
    else
      puts "Invalid choice. Please try again."
    end

    logged_in = true
  
    while logged_in
      puts "\t What do you want to do next?"
      puts "1. Deposit Money"
      puts "2. Withdraw Money"
      puts "3. Check Balance"
      puts "4. Logout"
      puts "5. Exit"
  
      choice = gets.chomp.to_i 
  
      case choice 
      when 1
        puts "Enter the amount you want to deposit:"
        money = gets.chomp.to_f
        user_account.deposit_money(money)
      when 2
        puts "Enter the amount you want to withdraw:"
        money = gets.chomp.to_f
        user_account.withdraw_money(money)
      when 3
        puts "Your current balance is $#{user_account.balance}."
      when 4
        user_account.user.logout
        logged_in = false
        puts "You have been logged out."
      when 5
        puts "Thank you for using our bank. Goodbye!"
        exit
      else
        puts "Invalid choice. Please try again."
      end
    end
  end
end

main
