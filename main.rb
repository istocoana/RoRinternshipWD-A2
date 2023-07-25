require_relative 'bank_account'
require_relative 'bank_system'

def main 
  puts "\n" + "-" * 20

  bank_system = BankSystem.new

  user1 = bank_system.create_account("Emily Johnson", "Software Engineer", "emily.johnson@mail.com", " 123 Main Street, Anytown, USA")
  user1.balance = 1000
  puts "Welcome, #{user1.name}! This is your balance: #{user1.balance}."
  user1.deposit_money(3000)
  user1.withdraw_money(2000)

  puts "\n" + "-" * 20

  user2 = bank_system.create_account("Michael Anderson", "Marketing Manage", "michael.anderson@mail.com", " 1456 Oak Avenue, Cityville, USA")
  user2.balance = 2000
  puts "Welcome, #{user2.name}! This is your balance: #{user2.balance}."
  user2.deposit_money(100)
  user2.withdraw_money(4000)

  puts "\n" + "-" * 20

  user3 = bank_system.create_account("Alex Turner", "Graphic Designer", "alex.turner@mail.com", "789 Elm Street, Villageville, USA")
  user3.balance = 6000
  puts "Welcome, #{user3.name}! This is your balance: #{user3.balance}."
  user3.deposit_money(2000)
  user3.withdraw_money(7000)

  puts "\n" + "-" * 20

  puts "Welcome! To create an account you will need to complete the following fields: "
  puts "Full name: "
  name = gets.chomp 

  puts "Job: "
  job = gets.chomp 

  puts "Email: "
  email = gets.chomp

  puts "Address: "
  address = gets.chomp

  user_account = bank_system.create_account(name, job, email, address)
 
  puts "Your data: \n Name: #{user_account.name} \n Job: #{user_account.job}\n Email: #{user_account.email} \n Address: #{user_account.address} \n Balance: $#{user_account.balance}"

  loop  do
    puts "\t What do you want to do next?"
    puts "1. Deposit Money"
    puts "2. Withdraw Money"
    puts "3. Check Balance"
    puts "4. Exit"

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
      puts "Thank you for using our bank. Goodbye!"
      break
    else
      puts "Invalid choice. Please try again."
    end
  end
end

main
