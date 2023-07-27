require_relative 'bank_account'
require_relative 'bank_system'
require_relative 'user'
require_relative '../modules/transaction'
require_relative '../modules/create_user'
require_relative '../modules/default_users'

def main 

  bank_system = BankSystem.new
  include DefaultUsers

  puts "\n" + "-" * 20

  user_accounts = {}

  user_account1 = default_user1(bank_system)
  user_accounts[user_account1.user.name] = user_account1

  puts "\n" + "-" * 20

  user_account2 = default_user2(bank_system)
  user_accounts[user_account2.user.name] = user_account2

  puts "\n" + "-" * 20

  user_account3 = default_user3(bank_system)
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
