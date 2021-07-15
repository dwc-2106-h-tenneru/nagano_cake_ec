Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  resources :customers, only: [:show, :edit]
end
#ルーティング問題
