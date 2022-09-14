class AddUserIdToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :user_id, :integer
    add_index :cards, :user_id
  end
end
