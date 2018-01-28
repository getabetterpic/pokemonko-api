require 'rails_helper'

RSpec.describe Deck, type: :model do
  subject { FactoryBot.create(:deck) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_presence_of(:user) }

  context 'when validating number of cards' do
    let(:card) { FactoryBot.create(:pko_card) }

    it "doesn't allow more than 100 cards" do
      101.times do
        subject.cards << card
      end
      expect(subject).to_not be_valid
    end
  end

  describe 'before_save' do
    let(:card) { FactoryBot.create(:pko_card) }

    context 'when there are exactly 60 cards in the deck' do
      it 'sets valid_deck to true' do
        60.times do
          subject.cards << card
        end
        expect { subject.save }.to change { subject.valid_deck }.to(true)
      end
    end

    context "when there aren't exactly 60 cards in the deck" do
      it 'sets valid_deck to false' do
        59.times do
          subject.cards << card
        end
        subject.save
        expect(subject.reload).to_not be_valid_deck
      end
    end

    context 'when all cards in the deck are standard legal' do
      let(:card) { FactoryBot.create(:pko_card, :standard_legal) }

      before { subject.cards << card }

      it 'sets the deck to standard legal' do
        expect { subject.save }.to change { subject.standard_legal }.to(true)
      end
    end

    context 'when not all cards in the deck are standard legal' do
      let(:standard_legal) { FactoryBot.create(:pko_card, :standard_legal) }
      let(:not_standard_legal) { FactoryBot.create(:pko_card, :not_standard_legal) }

      before do
        subject.cards << standard_legal
        subject.cards << not_standard_legal
      end

      it 'sets the deck to not standard legal' do
        subject.save
        expect(subject.reload).to_not be_standard_legal
      end
    end

    context 'when all cards in the deck are expanded legal' do
      let(:card) { FactoryBot.create(:pko_card, :expanded_legal) }

      before { subject.cards << card }

      it 'sets the deck to expanded legal' do
        expect { subject.save }.to change { subject.expanded_legal }.to(true)
      end
    end

    context 'when not all cards in the deck are expanded legal' do
      let(:expanded_legal) { FactoryBot.create(:pko_card, :expanded_legal) }
      let(:not_expanded_legal) { FactoryBot.create(:pko_card, :not_expanded_legal) }

      before do
        subject.cards << expanded_legal
        subject.cards << not_expanded_legal
      end

      it 'sets the deck to not expanded legal' do
        subject.save
        expect(subject.reload).to_not be_expanded_legal
      end
    end
  end
end
