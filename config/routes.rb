Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers


  root to: 'homes#top'
  get 'about' => 'homes#about'

  resources :customers, only: [:show, :edit, :update]



  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:new, :create, :show, :index, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end



end
#ルーティング問題
