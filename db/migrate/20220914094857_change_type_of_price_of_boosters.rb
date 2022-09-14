class ChangeTypeOfPriceOfBoosters < ActiveRecord::Migration[5.2]
  def change
    change_column(:boosters, :price, :integer)
  end
end
