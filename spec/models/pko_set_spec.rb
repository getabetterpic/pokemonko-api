require 'rails_helper'

RSpec.describe PkoSet, type: :model do
  subject { FactoryBot.create(:pko_set) }

  it { is_expected.to validate_presence_of(:code) }

  describe '#create_from_api' do
    it 'creates a set object from api data' do
      VCR.use_cassette('create_set_from_api') do
        api_data = Pokemon::Set.where(name: 'Sun & Moon', page: 1, pageSize: 1).all.first
        set = described_class.create_from_api(api_data)
        expect(set).to be_valid
        expect(set).to be_persisted
      end
    end
  end
end
