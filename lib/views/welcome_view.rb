class WelcomeView
  def self.get_user_input
    print "\n"
    print "-" * 50
    print "\nWhatcha wanna do ?\n"
    print "\n1. Browse Items sorted alphabetically ."
    print "\n2. Browse Items sorted from lowest price to highest ."
    print "\n3. Browse Items sorted from highest price to lowest ."
    print "\n4. I wanna see details of one item !"
    print "\n5. Go to Admin Dashboard."
    print "\n6. Leave.\n>"
    return gets.chomp.to_i
  end

  def self.get_admin_input
    print "\n"
    print "-" * 50
    print "\nWhatcha wanna do ?"
    print "\n1. I wanna create item !"
    print "\n2. I wanna browse items alphabetically !"
    print "\n3. I wanna browse items from lowest price to highest !"
    print "\n4. I wanna browse items from highest price to lowest !"
    print "\n5. I wanna see details of one item !"
    print "\n6. I wanna delete an item !"
    print "\n7. I wanna update an item !"
    print "\n8. I wanna Leave.\n>"
    return gets.chomp.to_i
  end

  def self.error
    print "\nInvalid choice. Please focus and try again.\n"
  end

  def self.welcome
    print "*" * 50
    print "\nWelcome to The Shop !\n"
    print "*" * 50
  end

  def self.get_pwd
    print "#" * 50
    print "\nEnter password : "
    return gets.chomp.to_i
  end

  def self.goodbye
    print "*" * 50
    print "\nGood Bye !\n"
    print "*" * 50
  end

  def self.ask_confirm
    print "#" * 50
    print "\nAre you sure ? (y/n)\n"
    return gets.chomp.downcase
  end
end
