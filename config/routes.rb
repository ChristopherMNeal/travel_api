Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :reviews
    end
  end
  post 'authenticate', to: 'authentication#authenticate'
  
end
