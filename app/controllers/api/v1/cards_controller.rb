class Api::V1::CardsController < ApplicationController
  def search
    cards = PkoCard.includes(:set)
      .where('pko_cards.name ILIKE ? OR pko_sets.name ILIKE ?', params[:name] + '%', params[:name] + '%')
      .order("pko_sets.release_date DESC, regexp_replace(pko_cards.number, '[A-Za-z]+', '')::integer DESC")
    paginated = cards.paginate(page: params[:page].to_i || 1, per_page: 20)
    render json: { cards: paginated.as_json, total_cards: cards.count }, status: :ok
  end
end
