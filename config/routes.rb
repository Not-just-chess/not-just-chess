Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'games#index'
  resources :games, only: [:new, :show, :create, :update] do
    patch :forfeit, on: :member
  end
  resources :chess_pieces, only: [:new, :create, :show, :update]
end
