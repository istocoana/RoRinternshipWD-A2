require_relative 'bank_account'
require_relative 'user'

class BankSystem
  attr_reader :accounts

  def initialize()
    @accounts = [] 
  end

  def create_account(user)
    account = BankAccount.new(user)
    @accounts << account 
    puts "Account for #{user.name} created successfully."
    account
  end
end
