Rails.application.routes.draw do
  get 'homes/top'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'

  resources :books, only: [:index, :edit, :show, :destroy]
  resources :users, only: [:edit, :show]
end
