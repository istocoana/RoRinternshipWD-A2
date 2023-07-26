require_relative '../lib/bank_system'
require 'rspec'

RSpec.describe BankSystem do

  let(:bank_system) { BankSystem.new }
  
  describe '#initialize' do
    it 'creates an empty array of accounts' do
      expect(bank_system.accounts).to eq([])
    end
  end

  describe '#create_account' do
    it 'adds a new account to the accounts list' do
      expect(BankAccount).to receive(:new).with(User).and_return(User)
      bank_system.create_account(User)
      expect(bank_system.accounts).to include(User)
    end
  end
end
