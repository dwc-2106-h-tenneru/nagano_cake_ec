Rails.application.routes.draw do
  devise_for :customers
 
  
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
