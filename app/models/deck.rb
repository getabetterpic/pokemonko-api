class Deck < ApplicationRecord
  validates :user, presence: true
  belongs_to :user

  has_many :deck_cards
  has_many :cards, through: :deck_cards

  validates :cards, length: { maximum: 100 }

  before_save :deck_is_valid?
  before_save :deck_is_standard_legal?
  before_save :deck_is_expanded_legal?

  def deck_is_valid?
    self.valid_deck = cards.count == 60
  end

  def deck_is_standard_legal?
    return unless cards.present?
    self.standard_legal = cards.includes(:set).all? { |card| card.set.standard_legal? }
  end

  def deck_is_expanded_legal?
    return unless cards.present?
    self.expanded_legal = cards.includes(:set).all? { |card| card.set.expanded_legal? }
  end
end
