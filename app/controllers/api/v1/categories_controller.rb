class Api::V1::CategoriesController < ApplicationController
  
  before_action :set_category, only: [:create, :show, :delete]

  def index
  	categories = Category.all
    render json: categories #\CategorySerializer.new(categories) 
  end

  def create
    if @category.nil?
      @category = Category.new(category_params)
        if @category.save
          render json: @category
        else
          render json: {errors: category.errors.full_messages, status: :unprocessable_entity}
        end
    else
      @category
    end
  end

  def show
    category_items = @category.items
    render json: category_items #CategorySerializer.new(category_items) 
  end

  def delete
    if @category.nil?
      render json: {error: "Category Not Found", status: :unprocessable_entity}
    else
      @category.destroy
    end    
  end


  private
    def category_params
      params.require(:category).permit(:recipe_type, :query, :cuisine, :diet, :intolerances, :exclude)
    end	

    def set_category
      @category = Category.find(params[:category_id])
    end

end
