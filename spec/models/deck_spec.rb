require 'rails_helper'

RSpec.describe Deck, type: :model do
  subject { FactoryBot.create(:deck) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:user) }
end
