Rails.application.routes.draw do
  devise_for :users
  resources :cards
  resources :boosters
  resources :categories
  # get 'home/index'
  get 'home/about'
  # root 'home#index'
  root 'home#about'
  get 'cards/:id/fight', to: 'cards#fight', as: :cards_fight
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
