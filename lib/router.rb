require_relative "controllers/item_controller"
require_relative "controllers/welcome_controller"

class Router
  attr_accessor :item_controller, :welcome_controller

  def initialize
    @item_controller = ItemController.new
    @welcome_controller = WelcomeController.new
  end

  def perform
    @welcome_controller.welcome

    while true
      @welcome_controller.input
      params = gets.chomp.to_i

      case params
      when 1
        @item_controller.create_item
      when 2
        @item_controller.items_index
      when 3
        @item_controller.show
      when 4
        @item_controller.delete_by_id
      when 5
        break
      else
        @welcome_controller.error
      end
    end
  end
end
