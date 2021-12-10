class ItemSerializer < ActiveModel::Serializer
  attributes :id, :product_title, :product_detail_url, :app_sale_price, :currency, :ASIN, :Customer_Reviews, :Best_Sellers_Rank, :available_quantity, :category_id
  belongs_to :category, serializer: CategorySerializer 
end
