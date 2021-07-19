Rails.application.routes.draw do
  devise_for :customers

 
  


  root to: 'homes#top'
  get 'about' => 'homes#about'
  get 'customer/edit' => 'customers#edit'
  patch 'customer/' => 'customers#update', as: 'update_customer'
  get 'customer' => 'customers#show'
  get 'customer/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
  patch 'customer/withdraw' => 'customers#withdraw', as: 'withdraw_customer'
  put 'customer/withdraw' => 'customers#withdraw'

  resources :addresses, only: [:index, :edit, :create, :update, :destroy]


  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:new, :create, :show, :index, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
    devise_for :admins
    #root to: 'admins/sessions#new'
    get '/admins/sign_in'=> 'admins/sessions#new'
    post '/admins/sign_in' => 'admins/sessions#create'
    #delete '/admins/sign_out' => 'admins/sessions#destroy'




end
#ルーティング問題
