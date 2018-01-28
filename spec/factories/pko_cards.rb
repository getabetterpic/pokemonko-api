FactoryBot.define do
  factory :pko_card do
    sequence(:card_id) { |n| "sm3-#{n}" }
    name "Gardevoir-GX"
    national_pokedex_number 282
    image_url "https://images.pokemontcg.io/sm3/93.png"
    image_url_hi_res "https://images.pokemontcg.io/sm3/93_hires.png"
    subtype "GX"
    supertype "Pokémon"
    hp "230"
    number "93"
    artist "5ban Graphics"
    series "Sun & Moon"
    set { FactoryBot.create(:pko_set) }
    retreat_cost ["Colorless", "Colorless"]
    text ["When your Pokémon-GX is Knocked Out, your opponent takes 2 Prize cards."]
    types ["Fairy"]
    attacks [
      {
        "cost"=>["Fairy"],
        "name"=>"Infinite Force",
        "text"=>"This attack does 30 damage times the amount of Energy attached to both Active Pokémon.",
        "damage"=>"30×",
        "convertedEnergyCost"=>1
      },
      {
        "cost"=>["Fairy"],
        "name"=>"Twilight-GX",
        "text"=>"Shuffle 10 cards from your discard pile into your deck. (You can’t use more than 1 GX attack in a game.)",
        "damage"=>"",
        "convertedEnergyCost"=>1
      }
    ]
    weaknesses [
      {
        "type" => "Metal",
        "value" => "x2"
      }
    ]
    resistances [
      {
        "type" => "Darkness",
        "value" => "-20"
      }
    ]
    evolves_from "Kirlia"

    trait :standard_legal do
      set { FactoryBot.create(:pko_set, :standard_legal) }
    end

    trait :expanded_legal do
      set { FactoryBot.create(:pko_set, :expanded_legal) }
    end

    trait :not_standard_legal do
      set { FactoryBot.create(:pko_set, :not_standard_legal) }
    end

    trait :not_expanded_legal do
      set { FactoryBot.create(:pko_set, :not_expanded_legal) }
    end
  end
end
