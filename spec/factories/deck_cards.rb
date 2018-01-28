FactoryBot.define do
  factory :deck_card do
    deck
    card { FactoryBot.create(:pko_card) }
  end
end
