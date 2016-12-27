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

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :employees, only: [:index, :show]
      resources :trips, only: [:index, :show] do
        resources :expenses
      end
      resources :categories, only: [:index, :show, :create]
    end
  end
end
