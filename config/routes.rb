Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/about'
  root 'courses#index'
  resources :courses
  resources :students
end
