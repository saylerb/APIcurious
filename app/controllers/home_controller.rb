class HomeController < ApplicationController
  def index
    @access_token = current_token
  end

  def show
    @user = User.user_data(current_token)
  end
end
