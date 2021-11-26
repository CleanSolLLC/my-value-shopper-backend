Rails.application.routes.draw do

  post '/api/v1/sessions/login', to: 'api/v1/sessions#create'
  get '/api/v1/sessions/get_current_user', to: 'api/v1/sessions#get_current_user'
  get '/api/v1/sessions/logout', to: 'api/v1/sessions#delete'

  namespace :api do
    namespace :v1 do 
      resources :users do
        resources :categories do
          resources :items
          end
        end
    end
  end
end
 