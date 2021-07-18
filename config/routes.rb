Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers


  root to: 'homes#top'
  get 'about' => 'homes#about'
  get 'customer/edit' => 'customers#edit'
  patch 'customer/' => 'customers#update', as: 'update_customer'
  get 'customer' => 'customers#show'

  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:new, :create, :show, :index, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end



end
#ルーティング問題
