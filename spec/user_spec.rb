require_relative '../lib/user'
require 'rspec'

RSpec.describe User do
  
  let(:user) { User.new('John Doe', 'Software Engineer', 'john.doe@example.com', '123 Main St', '') }

  describe '#set_pin' do
    it 'sets the PIN successfully when given a valid 4-digit PIN' do
      valid_pin = '1111'
      expect(user.set_pin(valid_pin)).to eq(true)
      expect(user.pin).to eq(valid_pin)
    end

    it "doesn't set the PIN when given an invalid PIN" do
      invalid_pin = '12111'
      expect { user.set_pin(invalid_pin) }.to output(/Invalid PIN. It must be a 4-digit number./).to_stdout
      expect(user.pin).to be_nil
    end
  end

  describe '#valid_pin?' do
    it 'returns true for a valid 4-digit PIN' do
      expect(user.valid_pin?('1111')).to eq(true)
    end

    it 'returns false for an invalid PIN' do
      expect(user.valid_pin?('12111')).to eq(false)
      expect(user.valid_pin?('abcd')).to eq(false)
      expect(user.valid_pin?('12111')).to eq(false)
    end
  end

  describe '#login' do
    it 'logs in successfully with the correct PIN' do
      pin_attempt = '1111'
      expected_output = /Login successful. Welcome, #{user.name}!/
      user.set_pin(pin_attempt)
      expect { user.login(pin_attempt) }.to output(expected_output).to_stdout
      expect(user.logged_in).to eq(true)
    end

    it 'fails to log in with an incorrect PIN' do
      pin_attempt = '12111'
      expect { user.login(pin_attempt) }.to output(/Invalid PIN. Login failed./).to_stdout
      expect(user.logged_in).to eq(false)
    end
  end

  describe '#logout' do
    it 'logs out successfully' do
      user.logout
      expect(user.logged_in).to eq(false)
    end
  end
end
