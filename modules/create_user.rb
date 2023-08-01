module CreateUser 

  def create_user
    puts "Full Name:"
    name = gets.chomp
  
    puts "Job:"
    job = gets.chomp
  
    puts "Email:"
    email = gets.chomp
  
    puts "Address:"
    address = gets.chomp
  
    pin = ""

    loop do
      puts "PIN (4-digit number):"
      pin = gets.chomp
      break if User.new(name, job, email, address, pin).valid_pin?(pin)
    end
  
    new_user = User.new(name, job, email, address, pin)
  end
end
