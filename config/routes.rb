Rails.application.routes.draw do

  get 'daily_logs/index'
  get 'daily_logs/show'
  get 'daily_logs/new'
  devise_for :users
  root 'frontpage#index'

  resources :activities do 
    member do 
      get :delete
    end
  end

  resources :daily_logs do 
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
