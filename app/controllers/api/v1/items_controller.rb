class Api::V1::ItemsController < ApplicationController

  before_action :set_category, only: [:index, :create, :show, :delete]
  
  def index
    items = @category.items
    render json: items
  end

  def create
    category = @category
	  results = Item.call_api(params[:aisn])
    parsed_data = Item.parse_data(results, category)
    redirect_to :index
  end

  def show
    item = @category.items.find(params[:id])
    render json: item
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

    def set_category
      @category = Category.find(params[:category_id])
    end    	  	
end