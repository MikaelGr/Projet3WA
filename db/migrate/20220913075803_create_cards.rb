class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :rarity
      t.integer :atk
      t.integer :def
      t.integer :hp

      t.timestamps
    end
  end
end
