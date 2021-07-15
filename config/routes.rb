Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  root to: 'homes#top'
  get 'about' => 'homes#about'
end
