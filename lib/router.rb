require_relative "controllers/item_controller"
require_relative "controllers/welcome_controller"

class Router
  attr_accessor :item_controller, :welcome_controller

  def initialize
    @item_controller = ItemController.new
    @welcome_controller = WelcomeController.new
  end

  def welcome
    @welcome_controller.welcome

    while true
      user_choice
    end
  end

  def user_choice
    @welcome_controller.user_input
    user_input = gets.chomp.to_i

    case user_input
    when 1
      @item_controller.items_alphabet_order
    when 2
      @item_controller.items_from_lowest
    when 3
      @item_controller.items_from_highest
    when 4
      @item_controller.show
    when 5
      admin_pwd
    when 6
      @welcome_controller.goodbye
      abort
    else
      @welcome_controller.error
    end
  end

  def admin_pwd
    pwd = 1234
    @welcome_controller.check_pwd
    admin_pwd = gets.chomp.to_i

    while true
      case admin_pwd
      when pwd
        admin_dashboard
      else
        @welcome_controller.error
        user_choice
      end
    end
  end

  def admin_dashboard
    @welcome_controller.admin_input
    admin_input = gets.chomp.to_i

    case admin_input
    when 1
      @item_controller.create_item
    when 2
      @item_controller.items_alphabet_order
    when 3
      @item_controller.items_from_lowest
    when 4
      @item_controller.items_from_highest
    when 5
      @item_controller.show
    when 6
      confirm_delete
    when 7
      confirm_update
    when 8
      @welcome_controller.goodbye
      abort
    else
      @welcome_controller.error
    end
  end

  def confirm_delete
    @welcome_controller.confirm
    choice = gets.chomp.downcase

    case choice
    when "y"
      @item_controller.delete_by_id
    when "n"
      admin_dashboard
    else
      @welcome_controller.error
    end
  end

  def confirm_update
    @welcome_controller.confirm
    choice = gets.chomp.downcase

    case choice
    when "y"
      @item_controller.update_item
    when "n"
      admin_dashboard
    else
      @welcome_controller.error
    end
  end

  def perform
    welcome
  end
end
