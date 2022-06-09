require "controller"

class Router
  attr_accessor :controller

  def initialize
    @controller = Controller.new
  end

  def perform
    puts "Welcome to The Hacking Project !"

    while true
      puts "Whatcha wanna do ?"
      puts "1. I wanna create item !"
      puts "2. I wanna browse items !"
      puts "3. I wanna see details of one item !"
      puts "4. I wanna delete a item !"
      puts "5. I wanna leave."
      params = gets.chomp.to_i

      case params
      when 1
        puts "Have a nice item !"
        @controller.create_item
      when 2
        puts "Displaying ALL items."
        @controller.items_index
      when 3
        @controller.show
      when 4
        @controller.delete_by_id
      when 5
        puts "See ya !"
        break
      else
        puts "Invalid choice. Please focus and try again."
      end
    end
  end
end
