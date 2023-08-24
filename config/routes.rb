Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/login', to: 'sessions#create'
      post '/register', to: 'registrations#create'
      get '/users/:user_id/posts', to: 'posts#index'
      get '/all_users', to: 'sessions#all_users'
      resources :users, only: [] do
        resources :posts, only: [:create]
      end
    end
  end
end
