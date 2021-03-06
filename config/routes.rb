Rails.application.routes.draw do

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register', edit: 'settings' }
  
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
