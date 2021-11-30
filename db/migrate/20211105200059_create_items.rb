class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :product_title
      t.string :product_detail_url
      t.string :app_sale_price
      t.string :currency
      t.string :ASIN
      t.string :Customer_Reviews
      t.string :Best_Sellers_Rank
      t.string :available_quantity
    end    
  end
end
