Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :invoices
  resources :practice_rink_reservations
  root 'application#index'

  resources :players
  resources :teams
  resources :news_articles
  resources :committee_pages
  resources :committee_members
  resources :games
  resources :leagues
  resources :player_teams
  resources :player_games

  get '/residencyindex', to: 'players#residencyindex'
  post 'import', to: 'players#import'

end
