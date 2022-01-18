Rails.application.routes.draw do
  devise_for :users
  resources :destinations do
    resources :reviews
  end
end
