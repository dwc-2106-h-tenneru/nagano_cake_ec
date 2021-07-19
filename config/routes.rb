Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers























  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items, only: [:index, :show]
   resources :cart_items, only: [:index, :create, :destroy, :destroy_all, :update]
  resources :oders, only: [:index, :create, :destroy, :complete, :update,:new, :confirm, :show]


  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:new, :create, :show, :index, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end
end