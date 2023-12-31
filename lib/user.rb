class User 

    attr_accessor :name, :job, :email, :address, :pin, :logged_in

    def initialize(name, job, email, address, pin)
      @name = name
      @job = job
      @email = email
      @address = address
      set_pin(pin)
      @logged_in = false
    end

    def valid_pin?(pin)
      pin.match?(/^\d{4}$/)
    end

    def set_pin(pin)
      unless valid_pin?(pin)
        puts "Invalid PIN. It must be a 4-digit number."
        return false
      end
      
      @pin = pin
      puts "PIN set successfully. [#{pin}]"
      true
    end 

    def login(pin_attempt)
      if @pin == pin_attempt.to_s
        @logged_in = true
        puts "Login successful. Welcome, #{name}!"
      else
        puts "Invalid PIN. Login failed."
      end
      @logged_in
    end

    def logout
      @logged_in = false
    end
  end

