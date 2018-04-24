Rails.application.routes.draw do
  root 'dashboard/student#index'
  get 'dashboard/admin/index'
  get 'dashboard/student/index'
  devise_for :users
  resources :subject
end
