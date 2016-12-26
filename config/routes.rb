Rails.application.routes.draw do
  root 'dashboard#index'
  devise_for :employees
  resources :trips
  resources :expenses
  namespace :admin do
    resources :employees
    resources :categories
    get 'category_report' => "reports#category_report"
    get "trip_report" => "reports#trip_report"
  end
end
