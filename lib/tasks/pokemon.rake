namespace :pokemon do
  desc 'Load all sets from the API'
  task load_sets: :environment do
    i = 1
    loop do
      sets = Pokemon::Set.where(page: i, pageSize: 100).all
      break unless sets.present?
      sets.each do |api_set|
        PkoSet.create_from_api(api_set)
      end
      puts "Added #{sets.length} sets"
      i += 1
    end
  end

  desc 'Load all cards from the API'
  task load_cards: :environment do
    i = 1
    loop do
      cards = Pokemon::Card.where(page: i, pageSize: 100).all
      break unless cards.present?
      cards.each do |api_card|
        PkoCard.create_from_api(api_card)
      end
      puts "Added #{cards.length} cards"
      i += 1
    end
  end

end
