require_relative '../modules/transaction'
require 'rspec'

class TransactionTest
  include Transaction
  attr_accessor :balance

  def initialize(initial_balance)
    @balance = initial_balance
  end
end

RSpec.describe Transaction do

  let(:test_instancet) { TestAccount.new(initial_balance) }

  describe '#deposit_money' do
    it 'adds money to the balance' do
      test_instance = TransactionTest.new(1000)
      test_instance.deposit_money(2000)
      expect(test_instance.balance).to eq(3000)
    end

    context 'when the deposit amount is negative' do
      it 'displays an error message' do
        test_instance = TransactionTest.new(1000)
        expect{ test_instance.deposit_money(-2000) }.to output(/You can't deposit a negative amount!/).to_stdout
        expect(test_instance.balance).to eq(1000)
      end
    end
  end
  
  describe '#withdraw_money' do
    before do
      TransactionTest.new(0).total_daily_withdrawals = 0
    end

    context 'when the withdrawal amount is valid' do
      it 'reduces the balance by the withdrawn amount' do
       test_instance = TransactionTest.new(4000)
        test_instance.total_daily_withdrawals = 2000
        withdrawal_amount = 1000
        test_instance.withdraw_money(withdrawal_amount)
        expect(test_instance.balance).to eq(3000)
        expect(test_instance.total_daily_withdrawals).to eq(3000)
      end
    end

    context "when the withdrawal amount is negative" do
      it 'display an error message' do
        test_instance = TransactionTest.new(1000)
        expect{test_instance.withdraw_money(-2000) }.to output(/You can't withdraw a negative amount!/).to_stdout
        expect(test_instance.balance).to eq(1000)
      end
    end

    context "when the withdrawal amount exceeds the maximum limit" do
      it 'displays an error message' do
        test_instance = TransactionTest.new(1000)
        test_instance.total_daily_withdrawals = 4500
        withdrawal_amount = 700

        output = StringIO.new
        $stdout = output
        test_instance.withdraw_money(withdrawal_amount)
        $stdout = STDOUT
        expected_output = "The maximum daily withdrawal amount has been exceeded. You can withdraw a maximum of $5000.\n Today's withdrawal history: 4500\n"
        
        expect(output.string).to eq(expected_output)
        expect(test_instance.balance).to eq(1000)
      end
    end

    context "when the withdrawal amount exceeds the account balance" do
      it 'display an error message' do
        test_instance = TransactionTest.new(1000)
        test_instance.withdraw_money(4000)
        expect{ test_instance.withdraw_money(4000) }.to output(/Your balance is #{test_instance.balance}. You don't have enough funds in your account/).to_stdout
        expect(test_instance.balance).to eq(1000)
      end
    end
  end
end
