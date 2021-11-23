class Api::V1::UsersController < ApplicationController

  before_action :set_user, only: [:create, :show, :delete]

  def index
  	users = User.all
    render json: users
  end

  def create
    if @user.nil?
      @user = User.new(User_params)
        if @user.save
          render json: @user
        else
          render json: {errors: User.errors.full_messages, status: :unprocessable_entity}
        end
    else
      @user
    end
  end

  def show
    user = @user
    render json: user
  end

  def delete
    if @user.nil?
      render json: {error: "User Not Found", status: :unprocessable_entity}
    else
      @user.destroy
      render json: @user
    end    
  end


  private
    def User_params
      params.require(:User).permit(:username, :email)
    end	

    def set_user
      @user = User.find(params[:User_id])
      
      if @user.nil? 
        redirect_to controller: :users, action: :create, method: :post
      end
            
    end

end
