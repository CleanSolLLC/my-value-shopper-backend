class Api::V1::UsersController < ApplicationController
  #skip_before_action :authorized, only: [:create]
  #before_action :set_user, only: [:show, :delete]

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def index
  	users = User.all
    render json: users
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { error: @user.errors.full_messages[0] }, status: :unprocessable_entity
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
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def set_user
      @user = User.find(params[:id])            
    end

end
