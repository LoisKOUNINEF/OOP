require_relative "../views/welcome_view"

class WelcomeController
  # def initialize
  #   @view = WelcomeView.new
  # end

  def welcome
    WelcomeView.welcome
  end

  def input
    WelcomeView.get_input
  end

  def error
    WelcomeView.error
  end
end
