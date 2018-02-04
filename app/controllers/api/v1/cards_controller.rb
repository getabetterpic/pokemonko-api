class Api::V1::CardsController < ApplicationController
  def search
    cards = PkoCard.where('pko_cards.name ILIKE ?', params[:name] + '%')
      .includes(:set)
      .order("pko_sets.release_date DESC")
    paginated = cards.paginate(page: params[:page].to_i || 1, per_page: 20)
    render json: { cards: paginated.as_json, total_cards: cards.count }, status: :ok
  end
end
