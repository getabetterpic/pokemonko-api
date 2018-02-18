class PkoCard < ApplicationRecord
  validates :card_id, presence: true, uniqueness: true
  validates :name, presence: true

  belongs_to :set, foreign_key: :set_code, primary_key: :code, class_name: 'PkoSet'
  has_many :deck_cards
  has_many :decks, through: :deck_cards

  has_one_attached :image
  has_one_attached :hi_res_image

  SDK_ATTRS = %w(name national_pokedex_number image_url image_url_hi_res subtype supertype ability ancient_trait hp
                 number artist rarity series set_code retreat_cost text types attacks weaknesses resistances
                 evolves_from)

  def self.create_from_api(api_card)
    card = find_or_initialize_by(card_id: api_card.id)
    SDK_ATTRS.each do |attr|
      card.send("#{attr}=", api_card.send(attr))
    end
    card.save
    card
  end

  def as_json
    json = SDK_ATTRS.each_with_object({}) do |attr, hsh|
      hsh[attr] = self.send(attr)
    end
    json[:set_name] = set.name
    json[:service_url] = image.service_url if image.attached?
    json
  end
end
