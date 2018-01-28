require 'rails_helper'

RSpec.describe PkoCard, type: :model do
  subject { FactoryBot.create(:pko_card) }
  it { is_expected.to validate_presence_of(:card_id) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:card_id) }

  describe '.create_from_api' do
    it 'creates a card object from api data' do
      VCR.use_cassette('create_card_from_api') do
        api_card = Pokemon::Card.where(name: 'Gardevoir-GX', page: 1, pageSize: 1).all.first
        card = PkoCard.create_from_api(api_card)
        expect(card).to be_valid
        expect(card).to be_persisted
      end
    end
  end
end
