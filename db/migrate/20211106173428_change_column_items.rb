class ChangeColumnItems < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :items, column: :list_id
    remove_column :items, :list_id
    add_reference :items, :category, foreign_key: true
  end
end
