class Card < ApplicationRecord
  belongs_to :user
  belongs_to :booster
  belongs_to :category

  enum rarity: {
		commune: 0,
		rare: 1,
    épique: 2,
    légendaire: 3
	}
end
