require_relative "controllers/controller"
require_relative "controllers/welcome_controller"

class Router
  attr_accessor :controller, :welcome_controller

  def initialize
    @controller = Controller.new
    @welcome_controller = WelcomeController.new
  end

  def perform
    @welcome_controller.welcome

    while true
      @welcome_controller.input
      params = gets.chomp.to_i

      case params
      when 1
        @controller.create_item
      when 2
        @controller.items_index
      when 3
        @controller.show
      when 4
        @controller.delete_by_id
      when 5
        break
      else
        @welcome_controller.error
      end
    end
  end
end
