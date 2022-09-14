class ChangeDefaultValueOfCards < ActiveRecord::Migration[5.2]
  def up
    change_column_default :cards, :atk, 0
    change_column_default :cards, :def, 0
    change_column_default :cards, :hp, 0
  end
end
