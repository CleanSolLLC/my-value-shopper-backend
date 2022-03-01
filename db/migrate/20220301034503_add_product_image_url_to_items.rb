class AddProductImageUrlToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :product_main_image_url, :string
  end
end
