class WelcomeView
  def self.get_input
    puts "Whatcha wanna do ?"
    puts "1. Browse Items."
    puts "2. I wanna see details of one item !"
    puts "3. Go to Admin Dashboard."
    puts "4. Leave."
  end

  def self.get_admin_input
    puts "Whatcha wanna do ?"
    puts "1. I wanna create item !"
    puts "2. I wanna browse items !"
    puts "3. I wanna see details of one item !"
    puts "4. I wanna delete a item !"
    puts "5. I wanna leave."
  end

  def self.error
    puts "Invalid choice. Please focus and try again."
  end

  def self.welcome
    puts "Welcome to The Shop !"
  end

  def self.get_pwd
    puts "Enter password : "
  end

  def self.goodbye
    puts "Good Bye !"
  end
end
