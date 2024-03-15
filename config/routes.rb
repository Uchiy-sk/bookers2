Rails.application.routes.draw do

  get 'groups/index'
  get 'groups/show'
  get 'groups/new'
  get 'groups/edit'
  get 'group/index'
  get 'group/show'
  get 'group/new'
  get 'group/edit'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'homes/top'
  get 'home/about' => 'homes#about', as: 'about'
  root to: 'homes#top'

  resources :books, only: [:index, :create, :edit, :show, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :edit, :show, :update]
  resources :groups, only: [:new, :index, :show, :create, :edit, :update] do
    resource :group_users, only: [:create, :destroy]
  end
end
