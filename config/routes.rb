Rails.application.routes.draw do
  root 'pages#index'
  
  get 'pages/index'

  get '/oauth', to: 'pages#oauth'
end
