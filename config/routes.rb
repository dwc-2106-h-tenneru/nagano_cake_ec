Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers

  namespace :admin do
    root to: "homes#top"
    resources :genres, only: [:index, :create, :edit, :update]
  end

end
