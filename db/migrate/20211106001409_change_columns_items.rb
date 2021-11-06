class ChangeColumnsItems < ActiveRecord::Migration[6.1]
  def change
    remove_index :items, :list_id
  end
end
