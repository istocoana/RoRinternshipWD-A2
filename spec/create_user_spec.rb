require_relative '../lib/user'
require_relative '../modules/create_user'
require 'rspec'

RSpec.describe CreateUser do

    before do
      User.include(CreateUser)
    end

  describe '#create_user' do

    let(:user_input_values) do
      {
        name: "John Doe",
        job: "Software Engineer",
        email: "john.doe@mail.com",
        address: "123 Main St, City",
        pin: "1111"
      }
    end
    let(:invalid_pin) { 'invalid' }

    before do 
      allow_any_instance_of(Kernel).to receive(:gets).and_return(
        user_input_values[:name],
        user_input_values[:job],
        user_input_values[:email],
        user_input_values[:address],
        user_input_values[:pin]
      )
    end

    it 'creates a new user with valid input' do
      user_instance = User.new(:name , :job, :email, :address, :pin)
      new_user = user_instance.create_user
      expect(new_user).to be_a(User)
      expect(new_user.name).to eq(user_input_values[:name])
      expect(new_user.job).to eq(user_input_values[:job])
      expect(new_user.email).to eq(user_input_values[:email])
      expect(new_user.address).to eq(user_input_values[:address])
      expect(new_user.pin).to eq(user_input_values[:pin])
    end

    context 'when an invalid PIN is provided' do
      it 'retries and sets the valid PIN for the new user' do
        valid_pin = user_input_values[:pin]
        allow_any_instance_of(Kernel).to receive(:gets).and_return(invalid_pin, valid_pin)
        user_instance = User.new(
          user_input_values[:name],
          user_input_values[:job],
          user_input_values[:email],
          user_input_values[:address],
          user_input_values[:pin]
        )
        user_instance.set_pin(valid_pin)
        expect(user_instance.pin).to eq(user_input_values[:pin])
      end
    end
  end
end
