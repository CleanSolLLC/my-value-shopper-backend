Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do 
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      resources :users, only: [:create] 
      resources :categories, only: [:create]
      resources :items, only: [:create]
    end
  end
end
 