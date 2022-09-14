json.extract! card, :id, :name, :rarity, :atk, :def, :hp, :created_at, :updated_at
json.url card_url(card, format: :json)
