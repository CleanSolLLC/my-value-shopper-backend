class Api::V1::ItemsController < ApplicationController

  before_action :set_category, only: [:index, :create, :show, :delete]
  
  def index
    items = @category.items
    render json: items #ItemSerializer.new(items) 
  end

  def create
  	item = @category.items.find_or_initialize_by(ASIN: params[:aisn])

  	if item.nil? 
	  results = item.call_api(params[:search_criteria])
      item = Item.new(item_params(results)) 
    end  
   
    if item.save || !item.nil?
      render json: item  #status: :accepted
    else
      render json: {errors: item.errors.full_messages, status: :unprocessable_entity}
    end
  end

  def show
    item = @category.items.find(params[:id])
    render json: item #ItemSerializer.new(item) 
  end


  def destroy
    item = @category.items.find(params[:id])

    if item.nil?
      render json: {error: "Item Not Found", status: :unprocessable_entity}
    else
      item.destroy
      render json: item
    end    

  end


  private
    def item_params(results)
      results.require(:item).permit(:product_title, :product_detail_url, :app_sale_price, :currency, :ASIN, :Customer_Reviews, :Best_Sellers_Rank, :available_quantity, :list_id, list_id: [] )
    end

    def set_category
      @category = Category.find(params[:category_id])
    end    	  	
end