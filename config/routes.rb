Rails.application.routes.draw do
  #write custom routes above
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  resources :reviews
  resources :users
  resources :recipes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
