class RemoveIndexFrom < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key "categories", "users"
  end
end
