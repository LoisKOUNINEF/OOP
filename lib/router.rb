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
      user_input = gets.chomp.to_i

      case user_input
      when 1
        @item_controller.items_index
      when 2
        @item_controller.show
      when 3
        @welcome_controller.check_pwd
        admin_pwd = gets.chomp.to_i

        while true
          case admin_pwd
          when 1234
            @welcome_controller.admin_input
            admin_input = gets.chomp.to_i

            case admin_input
            when 1
              @item_controller.create_item
            when 2
              @item_controller.items_index
            when 3
              @item_controller.show
            when 4
              @welcome_controller.confirm
              choice = gets.chomp

              case choice
              when "y"
                @item_controller.delete_by_id
              when "n"
                @item_controller.admin_input
              else
                @welcome_controller.error
              end
            when 5
              @welcome_controller.goodbye
              break
            else
              @welcome_controller.error
            end
          else
            @welcome_controller.error
          end
        end
      when 4
        @welcome_controller.goodbye
        break
      else
        @welcome_controller.error
      end
    end
  end
end
