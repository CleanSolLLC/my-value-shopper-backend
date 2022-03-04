class AddAdditionalColumnsToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :original_price, :float
    add_column :items, :discount, :float
  end
end
