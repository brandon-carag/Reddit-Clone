PostitTemplate::Application.routes.draw do
  
  root to: 'posts#index'
  get '/register', to: 'users#new'
  
#Authentication Routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/user_profile', to: 'users#show'

#Model Routes
  resources :posts, except: :destroy do
    resources :comments, except: :destroy
    end
  resources :categories, except: :destroy
  resources :users, except: [:index,:destroy,:show]

end

