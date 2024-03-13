Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'homes/top'
  get 'home/about' => 'homes#about', as: 'about'
  root to: 'homes#top'

  resources :books, only: [:index, :create, :edit, :show, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :edit, :show, :update] do
    get "search" => 'users#search'
  end
end
