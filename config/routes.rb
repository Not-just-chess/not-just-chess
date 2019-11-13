Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_page#index'
  resources :games, only: [:new, :index, :show, :create, :update]
  resources :chess_pieces, only: [:new, :create]
end
