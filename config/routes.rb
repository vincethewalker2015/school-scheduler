Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/about'
  root 'courses#index'
  resources :courses
  resources :students

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
end
