class ApplicationController < ActionController::API

  def current_user
    user = User.find(params[:id])
    if user.id == session[:user_id]
      current_user
    end  
  end
  
  def logged_in?
    !!current_user
  end
end
