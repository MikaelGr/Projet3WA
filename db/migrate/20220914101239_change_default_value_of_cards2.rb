class ChangeDefaultValueOfCards2 < ActiveRecord::Migration[5.2]
  def change
    change_column_default :cards, :def, 1
    change_column_default :cards, :hp, 1
  end
end
