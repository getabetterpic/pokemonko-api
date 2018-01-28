FactoryBot.define do
  factory :deck do
    user
    valid_deck false
    standard_legal false
    expanded_legal false
  end
end
