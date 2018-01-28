FactoryBot.define do
  factory :pko_set do
    sequence(:code) { |n| "base#{n}"}
    name "Base"
    series "Base"
    total_cards 102
    standard_legal false
    expanded_legal false
    release_date "1999-01-09"

    trait :standard_legal do
      standard_legal true
    end

    trait :expanded_legal do
      expanded_legal true
    end

    trait :not_standard_legal do
      standard_legal false
    end

    trait :not_expanded_legal do
      expanded_legal false
    end
  end
end
