Rails.application.routes.draw do
  root 'pages#index'
  
  get 'pages/index'
  get 'pages/logout'
  get 'pages/user'

  get '/oauth', to: 'pages#oauth'
end
