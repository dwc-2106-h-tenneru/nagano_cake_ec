Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers


<<<<<<< HEAD





















  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :items, only: [:index, :show]
   resources :cart_items, only: [:index, :create, :destroy, :destroy_all, :update]
  resources :oders, only: [:index, :create, :destroy, :complete, :update,:new, :confirm, :show]

=======
  root to: 'homes#top'
  get 'about' => 'homes#about'
  get 'customer/edit' => 'customers#edit'
  patch 'customer/' => 'customers#update', as: 'update_customer'
  get 'customer' => 'customers#show'
  get 'customer/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
  patch 'customer/withdraw' => 'customers#withdraw', as: 'withdraw_customer'
  put 'customer/withdraw' => 'customers#withdraw'

  resources :addresses, only: [:index, :edit, :create, :update, :destroy]
>>>>>>> origin/develop

  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:new, :create, :show, :index, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end
<<<<<<< HEAD
end
=======



end
#ルーティング問題
>>>>>>> origin/develop
