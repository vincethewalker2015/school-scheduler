Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/about'
  root 'courses#index'
  resources :courses
  resources :students, except: [:destroy]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
end
