class AddColumnsToItems < ActiveRecord::Migration[6.1]
  def change
    change_table :items do |t|
      t.rename :name, :product_title
      t.rename :description, :product_detail_url
      t.rename :product_rating, :app_sale_price
      t.rename :image_url, :currency
      t.rename :product_url, :ASIN
      t.rename :retailer_rating, :Customer_Reviews
      t.string :Best_Sellers_Rank
      t.string :available_quantity
      t.remove :price
    end    
  end
end
