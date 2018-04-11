Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  devise_for :users
end
