Rails.application.routes.draw do
  resources :reviews
  post 'authenticate', to: 'authentication#authenticate'
end
