require_relative "../views/welcome_view"

class WelcomeController
  # def initialize
  #   @view = WelcomeView.new
  # end

  def welcome
    WelcomeView.welcome
  end

  def user_input
    WelcomeView.get_user_input
  end

  def admin_input
    WelcomeView.get_admin_input
  end

  def error
    WelcomeView.error
  end

  def goodbye
    WelcomeView.goodbye
  end

  def check_pwd
    WelcomeView.get_pwd
  end

  def confirm
    WelcomeView.ask_confirm
  end
end
