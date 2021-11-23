class Api::V1::CategoriesController < ApplicationController
  
  before_action :set_user, only: [:index, :create, :show, :delete]

  def index
  	user_categories = @user.categories
    render json: user_categories
  end

  def create
    category = Category.new(category_params)
      if category.save
         @user.categories << category
         render json: @user.categories.last
      else
        render json: {errors: category.errors.full_messages, status: :unprocessable_entity}
      end
  end

  def show
    user_category = @user.categories.where(id: params[:id])
    render json: user_category
  end

  def delete
    user_category = @user.categories.where(id: params[:id])
    if user_category.nil?
      render json: {error: "Category Not Found", status: :unprocessable_entity}
    else
      user_category.destroy
      render json: user_category
    end    
  end


  private
    def category_params
      params.require(:category).permit(:name)
    end	

    def set_user
      @user = User.find(params[:user_id])
      if @user.nil? 
        redirect_to controller: :categories, action: :create, method: :post
      end
            
    end

end
