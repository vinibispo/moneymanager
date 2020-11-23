# frozen_string_literal: true

Rails.application.routes.draw do
  resources :accounts
  resources :users
  post 'auth_user' => 'authentication#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
