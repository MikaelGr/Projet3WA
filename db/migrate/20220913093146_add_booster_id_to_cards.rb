class AddBoosterIdToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :booster_id, :integer
    add_index :cards, :booster_id
  end
end
