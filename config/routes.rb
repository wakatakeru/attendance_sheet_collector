Rails.application.routes.draw do
  root 'dashboard#index'

  get 'dashboard/admin/index'
  get 'dashboard/index'

  devise_for :users
  resources :subject
  resources :lesson
  resources :user
end
