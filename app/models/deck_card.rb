class DeckCard < ApplicationRecord
  validates :deck, :card, presence: true

  belongs_to :deck
  belongs_to :card, class_name: 'PkoCard'
end
