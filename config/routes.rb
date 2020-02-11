Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  namespace :api do
    namespace :v1 do
      resources :users
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/fetchbills', to: 'adapter#fetch_bills'
      resources :bills
      resources :user_bills
      resources :picked_bills
    end
  end
end
