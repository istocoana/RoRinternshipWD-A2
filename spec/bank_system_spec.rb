require_relative '../lib/bank_system'

RSpec.describe BankSystem do

  describe '#initialize' do
    it 'creates an array of accounts' do
      bank_system = BankSystem.new
      expect(bank_system.accounts).to eq([])
    end
  end

  describe '#create_account' do
    it 'adds a new account to the accounts list' do
      bank_system = BankSystem.new
      account = bank_system.create_account('Name', 'Job', 'Email', 'Address')

      expect(bank_system.accounts).to include(account)
    end
  end

end
