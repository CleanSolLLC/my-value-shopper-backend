class Api::V1::ItemsController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def update
    item = @user.items.find(params[:id])
    if item 
      coupon_amt = params[:user][:coupon].to_f
      Item.update_price(item, current_user, coupon_amt)
       render json: item
    else 
      render json: {error: "Item could not be updated", status: :unprocessable_entity}
    end  
  end

  def create
	  results = Item.call_api(item_params["ASIN"])
    category_id = item_params["category_id"].to_i
    item = Item.parse_data(results, current_user, category_id)
    if results 
      render json: item
    else
      render json: {error: "Item not found", status: :unprocessable_entity}
    end
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
    params.require(:user).permit(:ASIN, :category_id)
  end
end