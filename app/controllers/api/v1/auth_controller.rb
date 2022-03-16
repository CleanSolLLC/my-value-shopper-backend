class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.find_by(email: user_login_params[:email])
    if @user && @user.authenticate(user_login_params[:password])
      token = encode_token({ user_id: @user.id })
      #@user = assign_category_name if !@user.items.empty?
      render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end

  private

  def user_login_params
    params.require(:user).permit(:email, :password)
  end

  # def assign_category_name
  #   @user.items.each.map do |item|
  #     binding.pry
  #     item.assign_attributes(category_name: item.category.name)
  #   end
  #   return @user
  # end
end
