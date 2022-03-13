class Api::V1::ItemsController < ApplicationController
  #skip_before_action :authorized, only: [:create]
  #before_action :set_user, only: [:index, :create, :show, :delete]
  
  def index
    items = current_user.items
    render json: items
  end

  def create
    binding.pry
    user = @user
	  results = Item.call_api(params[item_params])
    parsed_data = Item.parse_data(results, user)
    redirect_to :index
  end

  def show
    user_category_item = @user.categories.find(params[:category_id]).items.find(params[:id])
    render json: user_category_item
  end


  def delete
    user_category_item = @user.categories.find(params[:category_id]).items.find(params[:id])
    if user_category_item.nil?
      render json: {error: "Item Not Found", status: :unprocessable_entity}
    else
      user_category_item.destroy
      render json: user_category_item
    end    

  end


  private

  def item_params
    params.require(:item).permit(:ASIN, :category_id=[])
  end

  def set_user
    @user = User.find(params[:user_id])
    if @user.nil? 
      redirect_to controller: :items, action: :create, method: :post
    end 
  end	  	
end