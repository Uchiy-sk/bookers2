Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'homes/top'
  get 'homes/about' => 'homes#about', as: 'about'
  root to: 'homes#top'

  resources :books, only: [:index, :edit, :show, :destroy]
  resources :users, only: [:edit, :show]
end
