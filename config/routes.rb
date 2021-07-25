Rails.application.routes.draw do


  devise_for :admins, controllers: {
  # sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}
  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

  root to: 'homes#top'
  get 'about' => 'homes#about'
  get 'customer/edit' => 'customers#edit'
  patch 'customer/' => 'customers#update', as: 'update_customer'
  get 'customer' => 'customers#show'
  get 'customer/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
  patch 'customer/withdraw' => 'customers#withdraw', as: 'withdraw_customer'
  put 'customer/withdraw' => 'customers#withdraw'
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/confirms' => 'orders#confirms'
  get 'orders/complete' => 'orders#complete'


  resources :addresses, only: [:index, :edit, :create, :update, :destroy]

  resources :items, only: [:index, :show]
  resources :cart_items, only: [:index, :create, :destroy, :update] do
    collection do
      delete 'destroy_all'
    end
  end
  resources :orders, only: [:index, :create, :destroy, :update, :new, :show]


  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:new, :create, :show, :index, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    post 'order_details/:id' => 'orders#show'

   end
  end
