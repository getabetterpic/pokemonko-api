require 'rails_helper'

RSpec.describe DeckCard, type: :model do
  subject { FactoryBot.create(:deck_card) }

  it { is_expected.to belong_to(:deck) }
  it { is_expected.to belong_to(:card) }
  it { is_expected.to validate_presence_of(:deck) }
  it { is_expected.to validate_presence_of(:card) }
end
