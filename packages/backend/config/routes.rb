# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  resources :users
  resources :accounts
  resources :send_mail_forgot_password
  post 'auth_user' => 'authentication#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
