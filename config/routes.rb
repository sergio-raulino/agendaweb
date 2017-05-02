Rails.application.routes.draw do
  devise_for :users
  resources :contacts
  resources :users
  root "contacts#index"
end
