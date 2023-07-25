class BankSystem
  attr_reader :accounts #reader bcs you don't have to sett them

  def initialize()
    @accounts = [] #accounts is a array list
  end

  def create_account(name, job, email, adress)
    account = BankAccount.new(name, job, email, adress)
    @accounts << account #
    puts "Account for #{name} created successfully."
    account
  end
end
