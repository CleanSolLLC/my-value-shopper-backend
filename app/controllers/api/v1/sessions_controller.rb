class Api::V1::SessionsController < ApplicationController
  
  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      render json: @user
    else
      render json: {
        error: "Invalid email or password"
      }
    end
  end

  def delete
  end
end
