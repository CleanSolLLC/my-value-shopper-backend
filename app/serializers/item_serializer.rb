class ItemSerializer < ActiveModel::Serializer
  attributes :id, :product_title, :product_detail_url, :app_sale_price, :currency, :ASIN, :Customer_Reviews, :available_quantity, :category_id, :product_main_image_url, :original_price, :discount
  belongs_to :category, serializer: CategorySerializer 
end
