Rails.application.routes.draw do
  root 'dashboard#index'
  devise_for :employees
  resources :trips
  resources :expenses
  namespace :admin do
    resources :employees, except: [:show]
  end
end
