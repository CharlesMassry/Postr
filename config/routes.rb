Rails.application.routes.draw do
  root "front_pages#show"
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
end
