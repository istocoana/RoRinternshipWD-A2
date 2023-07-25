require_relative '../lib/bank_account'

RSpec.describe BankAccount do

  let(:bank_account) {
     BankAccount.new("Name", "Job", "Email", "Address") 

  }

    describe '#initialize' do
      it 'sets initial balance to 0' do
        puts "Initial balance: #{bank_account.balance}"
        expect(bank_account.balance).to eq(0)
      end
    end

    describe '#deposit_money' do
      it 'adds money to the balance' do
        bank_account.deposit_money(2000)
        expect(bank_account.balance).to eq(2000)
      end
    end
    
    describe '#withdraw_money' do
      before do
        bank_account.deposit_money(5000)
      end

      context 'when the withdrawal amount is valid' do
        it 'reduces the balance by the withdrawn amount' do
          bank_account.withdraw_money(1000)
          expect(bank_account.balance).to eq(4000)
        end
      end

      context "when the withdrawal amount exceeds the maximum limit" do
        it 'displays an error message' do
          expect { bank_account.withdraw_money(6000) }.to output("The maximum daily withdrawal amount has been exceeded. You can withdraw a maximum of $5000.\n").to_stdout
        end
      end

      context "when the withdrawal amount exceeds the account balance" do
        it 'display an error message' do
          bank_account.withdraw_money(4000)
          expect { bank_account.withdraw_money(2000) }.to output(/You don't have enough funds in your account./).to_stdout
        end
      end
    end
end
