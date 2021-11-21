class ChangeItemsColumns < ActiveRecord::Migration[6.1]
  def change
    change_table :items do |t|
      t.remove :app_sale_price
      t.remove :available_quantity
      t.float :app_sale_price
      t.integer :available_quantity
    end
  end
end
