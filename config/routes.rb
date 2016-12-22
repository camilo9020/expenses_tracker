Rails.application.routes.draw do
  root 'dashboard#index'
  devise_for :employees
  namespace :admin do
    resources :employees, except: [:show]
    resources :trips
  end
end
