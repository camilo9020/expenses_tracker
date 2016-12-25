Rails.application.routes.draw do
  root 'dashboard#index'
  devise_for :employees
  resources :trips
  resources :expenses
  namespace :admin do
    resources :employees
    resources :categories
    resources :reports
  end
end
