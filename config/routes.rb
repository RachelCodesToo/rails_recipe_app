Rails.application.routes.draw do
  root "sessions#home"
  #write custom routes above
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  #login
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  #logout
  delete '/logout' => 'sessions#destroy'

  #omniauth callback route
  get '/auth/google_oauth2/callback' => 'sessions#omniauth'
   
  resources :recipes do 
    resources :reviews
  end 
  resources :reviews
  resources :users do 
    resources :recipes, shallow: true
  end

 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
