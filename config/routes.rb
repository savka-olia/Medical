Rails.application.routes.draw do
  resources :appoinments
  resources :doctors
  resources :patients
  get 'home/index'
  root to: 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
