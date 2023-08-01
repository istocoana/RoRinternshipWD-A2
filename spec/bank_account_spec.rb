require_relative '../lib/bank_account'
require_relative '../modules/transaction'
require 'rspec'

RSpec.describe BankAccount do

  let(:user) { 'John Doe' }
  subject(:bank_account) { BankAccount.new(user) }

  it 'has the correct user details' do
    expect(bank_account.user).to eq(user)
  end

  it 'has a zero balance when initialized' do
    expect(bank_account.balance).to eq(0)
  end

end
