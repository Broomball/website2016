Rails.application.routes.draw do

  get 'sessions/create'

  get 'sessions/destroy'

  get 'home/show'

  resources :carousel_pictures
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :invoices
  resources :practice_rink_reservations
  root 'application#index'

  resources :players do
    collection do
      get :autocomplete
    end
  end
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

  get '/schedulegames', to: 'games#schedulegames'
  post '/schedulegames', to: 'games#creategamesschedule'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]

  root to: "home#show"

end
