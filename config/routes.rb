Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope except: [:new, :show, :update] do
    resources :players
    get 'players', to: 'players#index'
    get 'players/new', to: 'players#new', as: 'register_player'
    get 'players/:token', to: 'players#show'
    get 'players/:token', to: 'players#edit', as: 'player_edit'
    put 'players/:token', to: 'players#update'
  end
  
end
