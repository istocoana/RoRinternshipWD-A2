require_relative 'user'
require_relative '../modules/transaction'

class BankAccount
  include Transaction

  attr_accessor :balance
  attr_reader :user

  def initialize(new_user)
    @user = new_user
    @balance = 0
  end
end
