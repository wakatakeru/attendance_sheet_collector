Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get 'admin_home/index'
  devise_for :users
end
