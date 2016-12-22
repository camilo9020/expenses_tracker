Rails.application.routes.draw do
  root 'dashboard#index'
  devise_for :employees
  namespace :admin do
    resources :employees, only: [:index, :new, :create, :edit, :update, :destroy]
  end
end
