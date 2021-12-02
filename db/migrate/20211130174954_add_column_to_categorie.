class AddColumnToCategorie < ActiveRecord::Migration[6.1]
  def change
    add_reference :categories, :item, null: true, foreign_key: true
  end
end
