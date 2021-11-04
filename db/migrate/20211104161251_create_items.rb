class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :list, null: false, foreign_key: true
      t.string :name
      t.string :description
      t.string :product_rating
      t.string :image_url
      t.string :product_url
      t.string :retailer_rating
      t.float :price

      t.timestamps
    end
  end
end
