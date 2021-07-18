Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers

  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:new, :create, :show, :index, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
  end


end
