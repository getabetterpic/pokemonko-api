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
    cards = nil
    i = 1
    loop do
      cards = Pokemon::Card.where(page: i, pageSize: 100).all
      break unless cards.present?
      cards.each do |api_card|
        PkoCard.create_from_api(api_card)
      end
      puts "Added #{(i * 100) + cards.length} cards"
      i += 1
    end
    puts "Finished adding #{(i * 100) + cards.length} cards"
  end

  desc 'Attach images to cards'
  task attach_images: :environment do
    require 'open-uri'

    bar = ProgressBar.create(title: 'Attaching Images', total: PkoCard.count, format: '%t %c/%C | %w | %e')
    PkoCard.find_each do |card|
      if card.image.attached?
        bar.increment
        next
      end
      begin
        img = open(card.image_url)
        card.image.attach(io: img, filename: "#{card.card_id}.png", content_type: 'image/png')
        bar.increment
      rescue
        bar.increment
      end
    end
    bar.finish
  end
end
