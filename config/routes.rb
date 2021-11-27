Rails.application.routes.draw do

  #post '/login', to: 'auth#create'
  #post '/api/v1/login', to: 'api/v1/auth#create'
  #delete '/api/v1/logout', to: 'api/v1/sessions#destroy'
  #get '/api/v1/sessions/get_current_user', to: 'api/v1/sessions#get_current_user'
  #get '/api/v1/sessions/logout', to: 'api/v1/sessions#delete'

  namespace :api do
    namespace :v1 do 
      resources :users, only: [:create] do
        post '/login', to: 'auth#create'
        resources :categories do
          resources :items
          end
        end
    end
  end
end
 