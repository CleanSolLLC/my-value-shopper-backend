class ApplicationController < ActionController::API

  def current_user
    user = User.find(session[:user_id])
  end
  
  def logged_in?
    !!current_user
  end
end
