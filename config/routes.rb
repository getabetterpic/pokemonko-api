Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get '/cards/search', to: 'cards#search'
      post '/callback', to: 'callback#callback'
    end
  end
end
