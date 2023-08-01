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
      user_instance = instance_double(User, name: 'John Doe')
      expect(BankAccount).to receive(:new).with(user_instance).and_return(user_instance)
      bank_system.create_account(user_instance)
      expect(bank_system.accounts).to include(user_instance)
    end
  end
end
