class WelcomeView
  def self.get_input
    print "\n"
    print "-" * 50
    print "\nWhatcha wanna do ?\n"
    print "\n1. Browse Items."
    print "\n2. I wanna see details of one item !"
    print "\n3. Go to Admin Dashboard."
    print "\n4. Leave.\n>"
  end

  def self.get_admin_input
    print "\n"
    print "-" * 50
    print "\nWhatcha wanna do ?"
    print "\n1. I wanna create item !"
    print "\n2. I wanna browse items !"
    print "\n3. I wanna see details of one item !"
    print "\n4. I wanna delete a item !"
    print "\n5. I wanna leave.\n>"
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
  end

  def self.goodbye
    print "*" * 50
    print "\nGood Bye !\n"
    print "*" * 50
  end

  def self.ask_confirm
    print "#" * 50
    print "\nAre you sure ? (y/n)\n"
  end
end
