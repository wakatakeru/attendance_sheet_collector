Rails.application.routes.draw do
  root 'dashboard#index'

  get 'dashboard/index'
  get 'dashboard/admin/index'
  get 'dashboard/admin/show'
  
  devise_for :users
  resources :subject do
    member do
      get 'enable_monitoring'
      get 'disable_monitoring'
    end
  end
  resources :lesson
  resources :user
end
