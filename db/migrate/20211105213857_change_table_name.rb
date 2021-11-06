class ChangeTableName < ActiveRecord::Migration[6.1]
  def change
    rename_table :lists, :categories
  end
end
